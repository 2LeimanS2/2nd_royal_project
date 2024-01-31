package com.ezen.royal.api.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

import com.ezen.royal.api.dto.MemberDTO;
import com.ezen.royal.api.mapper.LoginMapperXML;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
@PropertySource("classpath:config/kakao.properties") // kakao.properties 사용하기 위한 어노테이션
public class kakaoServiceImpl implements kakaoService {

	// [공통 필드] //
	@Autowired
	Environment env; // kakao.properties 사용하기 위한 객체
	@Autowired
	LoginMapperXML loginMapperXml;
	//

	// [getAccessToken(GAT) 필드] //
	private static String GAT_REQ_URL = "https://kauth.kakao.com/oauth/token";
	private static String GAT_REDIRECT_URI = "/royal/kakao/login";
	//

	// [getUserInfo(GUI) 필드] //
	private static String GUI_REQ_URL = "https://kapi.kakao.com/v2/user/me";
	//

	// [Logout(LO) 필드] //
	// 서비스 로그아웃 + 카카오계정 로그아웃
	private static String LO_REQ_URL = "https://kauth.kakao.com/oauth/logout";
	private static String LO_REDIRECT_URI = "/royal/kakao/form";
	//

	@Override
	public String getAccessToken(String code, HttpServletRequest req) {
		String access_Token = "";
		String refresh_Token = "";

		try {
			URL url = new URL(GAT_REQ_URL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
			conn.setDoOutput(true);

			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=" + env.getProperty("REST_API_KEY")); // TODO REST_API_KEY 입력
			sb.append("&redirect_uri=" + env.getProperty("IP") + GAT_REDIRECT_URI); // TODO 인가코드 받은 redirect_uri 입력
			sb.append("&code=" + code);
			bw.write(sb.toString());
			bw.flush();

			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			if (responseCode == 200) {
				log.info("[GAT] (Success)responseCode : " + responseCode);
			} else {
				log.warn("[GAT] (Fail)responseCode : " + responseCode);
			}

			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			log.info("[GAT] response body : " + result);

			// JSON파싱
			JsonElement element = JsonParser.parseString(result);

			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

			log.info("[GAT] access_token : " + access_Token);
			log.info("[GAT] refresh_token : " + refresh_Token);

			br.close();
			bw.close();

		} catch (IOException e) {
			e.printStackTrace();
		}
		// 세션 어트리뷰트에 저장
		req.getSession().setAttribute("token", access_Token);

		return access_Token;
	}

	@Override
	public int upsertMember(String token) {

		MemberDTO memberDTO = new MemberDTO();
		
		// access_token을 이용하여 사용자 정보 조회
		try {
			URL url = new URL(GUI_REQ_URL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			conn.setRequestProperty("Authorization", "Bearer " + token); // 전송할 header 작성, access_token전송
			conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			if (responseCode == 200) {
				log.info("[GUI] (Success)responseCode : " + responseCode);
			} else {
				log.warn("[GUI] (Fail)responseCode : " + responseCode);
			}

			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			log.info("[GUI] response body : " + result);

			// JSON파싱
			JsonElement element = JsonParser.parseString(result);

			long social_id = element.getAsJsonObject().get("id").getAsLong();
			
			String nickname = element.getAsJsonObject().get("properties").getAsJsonObject().get("nickname")
					.getAsString();
			
			String email = "";
			boolean hasEmail = element.getAsJsonObject().get("kakao_account").getAsJsonObject().get("has_email")
					.getAsBoolean();
			if (hasEmail) {
				email = element.getAsJsonObject().get("kakao_account").getAsJsonObject().get("email").getAsString();
			}

			br.close();

			log.info("[GUI] social_id : " + social_id);
			log.info("[GUI] email : " + email);
			log.info("[GUI] nickname : " + nickname);

			// dto에 데이터 넣어서 db에 upsert
			memberDTO.setSocial_id(Long.toString(social_id));
			memberDTO.setMember_name(nickname);
			memberDTO.setMember_email(email);
			memberDTO.setMemeber_type("kakao");

		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return loginMapperXml.upsertMember(memberDTO);
	}

	@Override
	public String logout(String token, HttpServletRequest req) {

		String parameter = "?client_id=" + env.getProperty("REST_API_KEY") + "&logout_redirect_uri="
				+ env.getProperty("IP") + LO_REDIRECT_URI;

		// 세션 어트리뷰트 삭제
		System.out.println("삭제 직전 세션 어트리뷰트: " + req.getSession().getAttribute("token"));
		req.getSession().invalidate();

		return LO_REQ_URL + parameter;
	}
}
