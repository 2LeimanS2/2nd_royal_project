서울 고궁안내 프로젝트
=================

# 개요
* 우리나라의 대표적인 관광지인 조선의 4대 궁궐 과 종묘를 소개하는 페이지를 만든다
* 

# 목표
* OpenApi와 Database를 사용해 데이터들을 관리하고, 적절한 곳에 데이터를 활용한다.
* 

# 라이브러리
> * 스프링
> * mybatis
> * Oracle Database

# 기능
> * 공공데이터포털 API 연계로 궁궐, 내부 문화재 정보 조회
> * 문화재 해설 안내
> * 문화재 문화 행사 안내
> * 

***

## mission
> * 방혜미 : 지도 api 데이터 활용 - 오시는길 페이지 
> * 방혜미 : 내부 건축물 이미지 (DB의 이미지path 추가하여 이미지 여러개 나열 해보기)
> * 김준형 : Event 테이블 데이터 추가 시 회차만큼 Event_round 테이블 데이터 추가하는 service
> * 김준형 : Event 테이블 데이터 회차 컬럼을 수정 시 Event_round 테이블 데이터 회차수 만큼 insert or delete 하는 service
> * 조현우 : 관리자 페이지에서 DB데이터 CRUD를 GUI로 구성 

## done
> * 김준형, 조현우 : 공공 API 연계 후 데이터 캐싱(DB) [[Commit]](https://github.com/kimj0131/royal_project/commit/b2bce768f3d814af2542e768a4397b3d1be525f8)
> * 김준형 : Spring scheduler로 공공 API 갱신주기 설정 [[Commit]](https://github.com/kimj0131/royal_project/commit/33482572463fdb34d4146daf1298d9ea5e3bc5da)
> * 김준형, 조현우 : 소셜 로그인 API 연계 (네이버, 카카오) [[Commit_1]](https://github.com/kimj0131/royal_project/commit/4e2913ff5720284ab7ea7f97da3b6c5f3dd4e66b), [[Commit_2]](https://github.com/kimj0131/royal_project/commit/7eb75f11a4e2cc01dd2f1e1aef8b4cf4b995b200)
> * 방혜미 :  공공API 데이터활용, 4대궁궐 및 종묘 내부 건축물 정보 DB에서 가져오기 [[Commit]](https://github.com/kimj0131/royal_project/commit/4d064e4af6bbd1177c85bf19ec7aa69d7ccdcd76)
> * 김태형 : 지도 api 연계
> * 김태형 : 커버페이지 => 메인페이지 이동 및 각 궁 소개페이지 이동 작업
***
## 발생한 문제
> * 

## 해결한 문제
> * 김준형, 조현우 : 공공데이터 Open Api 데이터 갱신방법
>   + MERGE sql문을 활용 경우에따라 Insert, Update 한다.
>   + 주기는 Spring Scheduler를 활용해 일정 주기로 동작하게 한다.
> * 김준형, 조현우 : 소셜 로그인 연동과 로그인상태 확인
>   + 소셜로부터 유저정보를 받아 필요한 데이터를 선별하여 DB에 저장하고 활용한다.
>   + HttpSession에 로그인을 판별할 수 있는 Attribute를 추가하고 Header jsp에 확인을 해 로그인을 유지한다.
>   + (String 으로 캐스팅 후 c:when으로 비어있는지 확인)
> * 김준형 : 관리자 페이지 로그인유지 방법 (session을 어떻게 활용할 것인가)
>   + session 어트리뷰트 로그인 정보 추가
>   + 관리자페이지 include jsp 페이지에 검증하는 로직을 추가
>   + session에 로그인 정보가 없으면 로그인 페이지로 되돌려보냄
> * 방혜미 : 내부 건축물 정보 가져오는 도중 파라미터 2개의 값을 넘기지 못함
>   + 서비스단 및 매퍼에서 @Param으로 해결
> * 


***
## 기여자
* #### [조현우](https://github.com/joehyunwoo)
* #### [김준형](https://github.com/kimj0131)
* #### [방혜미](https://github.com/hyemi-bang)
* #### [김태형](https://github.com/haru4637)
* #### [장호동](https://github.com/Hodongjjang)
* #### [서  빈](https://github.com/binibin99)
* #### [황진솔](https://github.com/ghkdwlsthf0112)
* #### [김민주](https://github.com/2LeimanS2)
