package com.ezen.royal.client.communication.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.royal.client.communication.dto.NoticeDTO;
import com.ezen.royal.client.communication.util.NoticeListVO;

public interface NoticeMapper {
	
	 List<NoticeDTO> getAll();
	 
	 List<NoticeDTO> getPartAll(Integer royal_id);
	
	 NoticeDTO get(int notice_id);
	 
	 List<NoticeDTO> search(@Param("type") String type, @Param("searchString") String searchString);
	 
	 List<NoticeDTO> searchAll(String searchString);

	 int countBoard(Integer royal_id);

	 List<NoticeDTO> selectBoardList(NoticeListVO vo);
	 
	 // 검색한 공지사항 개수
	 int countSearchResult(@Param("type") String type, @Param("searchString") String searchString);
	 // 검색결과 페이징
	 List<NoticeDTO> searchListPaging(@Param("vo") NoticeListVO vo, @Param("type") String type, @Param("searchString") String searchString);
	
	
}
