
-------------------------------------------------------------------------------
-- ������� royal ���� ���� �� ���� 

-- �ʿ�� ���̺� �� Ȥ�� ������ �� ���缭 ��� 
-- SELECT * FROM tabs; --���� �� ���̺� ���� Ȯ��
-- SELECT * FROM user_constraints; -- �������� Ȯ�� 
-- SELECT * FROM user_sequences; -- ����� ���� ������ Ȯ��


-- 1. ��(royal)���̺� ����
CREATE TABLE royal(
    royal_id number(2) --������
    CONSTRAINT royal_id_pk PRIMARY KEY,
    royal_name VARCHAR2(15) -- �� �̸�
    CONSTRAINT royal_name_nn NOT NULL
);

-- SELECT * FROM royal;
 --DROP TABLE royal;
-- TRUNCATE TABLE royal;                         
              


-- 2. �� ���� �μ� ���๰ ���̺� (����API������ ��Ƶ� ���̺�)
CREATE TABLE royal_inner (
    royal_inner_id NUMBER(3)  --  ������
    CONSTRAINT royal_inner_id_pk Primary Key,
    royal_id NUMBER(2) -- �� ������ (royal table�� join ���)
    CONSTRAINT royal_id_fk REFERENCES royal(royal_id),
    royal_inner_name VARCHAR2(50)  -- ���๰ ��
    CONSTRAINT royal_inner_name_nn NOT NULL,
    royal_inner_detail VARCHAR2(4000), -- ���๰ �� ����
    royal_inner_imgpath VARCHAR2(4000) -- ���๰ �̹��� ���
);

                     
-- SELECT * FROM royal_inner;
-- DROP TABLE royal_inner;
-- TRUNCATE TABLE royal_inner;                         
              
                     
-- 3. �Ҽ� �α��� ���� ��� ���̺�
CREATE TABLE member(
    member_id NUMBER(5)  -- ���� ������
    CONSTRAINT member_id_pk PRIMARY KEY,
    social_id VARCHAR2(200) -- �Ҽ� �ĺ�id
    CONSTRAINT social_id_nn NOT NULL,
    member_name VARCHAR2(50)  --ȸ�� �̸�
    CONSTRAINT member_name_nn NOT NULL,
    member_email VARCHAR2(50)  -- ȸ�� �̸���
    CONSTRAINT member_email_nn NOT NULL,
    member_type VARCHAR2(10)  --���̹�/īī��
    CONSTRAINT member_type_nn NOT NULL -- 
);

CREATE SEQUENCE member_id_seq
                    START WITH 1 -- ���� ��ȣ ����
                    INCREMENT BY 1  -- ���� ���� ����
                     NOCYCLE -- ���� ��ȯ ���� ����
                     NOCACHE; -- ��ȣ�� �̸� �������� ���� ����
-- SELECT * FROM member;
 --DROP TABLE member;
-- DROP SEQUENCE member_id_seq;
-- TRUNCATE TABLE member;                         



 
-- 4. �������� ���̺�                  
CREATE TABLE notice(
    notice_id NUMBER(10) --�������� ������
    CONSTRAINT notice_id_pk PRIMARY KEY,
    royal_id number(2) -- �� ��ȣ
    CONSTRAINT notice_royal_id_fk REFERENCES royal(royal_id),
    notice_title VARCHAR2(100) --�������� ����
    CONSTRAINT notice_title_nn NOT NULL, 
    notice_content VARCHAR2(4000) --���� ���� 
    CONSTRAINT notice_content_nn NOT NULL,
    notice_date DATE  DEFAULT sysdate -- ���� �����
);

-- �������� ������ ����
CREATE SEQUENCE notice_id_seq
                    START WITH 1 -- ���� ��ȣ ����
                    INCREMENT BY 1  -- ���� ���� ����
                     NOCYCLE -- ���� ��ȯ ���� ����
                     NOCACHE; -- ��ȣ�� �̸� �������� ���� ����
          
-- SELECT * FROM notice;
-- DROP TABLE notice;
-- DROP SEQUENCE notice_id_seq;
-- TRUNCATE TABLE notice;


-- 5. ��� ��� ���̺�
CREATE TABLE event_list(
    event_id NUMBER(5) -- ��縮��Ʈ ������
    CONSTRAINT event_id_pk PRIMARY KEY,
    royal_id  NUMBER(2) -- royal���̺� JOIN
    CONSTRAINT event_royal_id_fk  REFERENCES royal(royal_id),
    event_type VARCHAR2(25) -- �ؼ�/ ���
    CONSTRAINT event_type_nn NOT NULL,   -- �ؼ� :commentary ���: event 
    event_name VARCHAR2(200) --���� 
    CONSTRAINT event_name_nn NOT NULL,
    event_location VARCHAR2(100) -- ������ 
    CONSTRAINT event_location_nn NOT NULL,
    event_rounds NUMBER(2) DEFAULT 1  -- �� ȸ�� ��
    CONSTRAINT event_rounds_nn NOT NULL,
    start_date DATE --��� ������
    CONSTRAINT start_date_nn  NOT NULL,
    end_date DATE --��� ������
    CONSTRAINT end_date_nn  NOT NULL,
    event_link VARCHAR2(1000), --������ ����Ʈ ��ũ
    event_imgpath VARCHAR2(500), -- ������ �̹��� ��ũ
    reservable CHAR(2) -- ���డ�� ����
    CONSTRAINT reservable_nn  NOT NULL
);

--��縮��Ʈ ������ ����
CREATE SEQUENCE event_list_id_seq
                    START WITH 1 -- ���� ��ȣ ����
                    INCREMENT BY 1  -- ���� ���� ����
                     NOCYCLE -- ���� ��ȯ ���� ����
                     NOCACHE; -- ��ȣ�� �̸� �������� ���� ����

-- SELECT * FROM event_list;
-- DROP TABLE event_list;
-- DROP SEQUENCE event_list_id_seq;
-- TRUNCATE TABLE event_list;



-- 6. ��� ȸ�� ���̺�
CREATE TABLE event_round(
    round_id NUMBER(5) -- ��� ȸ�� ��ȣ
    CONSTRAINT round_id_pk PRIMARY KEY,
    event_id NUMBER(5) -- ��� ��ȣ (FK)
    CONSTRAINT event_round_event_id_fk REFERENCES event_list(event_id),
    round_num NUMBER(2)  -- ȸ��
    CONSTRAINT round_num_nn NOT NULL,
    round_time VARCHAR2(20)  -- ȸ�� �� �ð�
    CONSTRAINT round_time_nn NOT NULL,
    round_capacity NUMBER(5) 
    CONSTRAINT round_capacity_nn NOT NULL
    CONSTRAINT round_capacity_chk  CHECK(round_capacity >=0)
);

-- ��� ȸ�� ������ ����
CREATE SEQUENCE event_round_id_seq
                    START WITH 1 -- ���� ��ȣ ����
                    INCREMENT BY 1  -- ���� ���� ����
                     NOCYCLE -- ���� ��ȯ ���� ����
                     NOCACHE; -- ��ȣ�� �̸� �������� ���� ����
-- SELECT * FROM event_round;
-- DROP TABLE event_round;
-- DROP SEQUENCE event_round_id_seq;
-- TRUNCATE TABLE event_round;


          
-- 7. ���� ���̺�
CREATE TABLE reservation ( 
    resv_id NUMBER(5) -- ���� id
    CONSTRAINT resv_id_pk Primary Key,
    event_id NUMBER(5) -- �̺�Ʈ ��ȣ
    CONSTRAINT event_id_fk REFERENCES event_list(event_id),--(fk)
    member_id NUMBER(5) -- ���� ��ȣ (�ĺ�id �ƴ�)
    CONSTRAINT member_id_fk REFERENCES member(member_id), --(fk)
    resv_num VARCHAR2(100) -- �����ȣ (����(e, c) + ����(240206 + 000000(����))
    CONSTRAINT resv_num_nn NOT NULL
    CONSTRAINT resv_num_uq UNIQUE,
    resv_date DATE  -- ���� ��¥
    DEFAULT sysdate, --(date)
    resv_people NUMBER(5) -- ������ �ο�
    CONSTRAINT resv_people_nn NOT NULL
    CONSTRAINT resv_people_chk  CHECK(resv_people >=0),
    resv_eventdate DATE 
    CONSTRAINT resv_eventdate_nn NOT NULL,-- �����ѳ�¥ (���ó�¥) ����
    round_num Number(5) 
    CONSTRAINT resv_round_num_nn NOT NULL -- ��� ȸ��
);


-- ���� ������ ����
CREATE SEQUENCE reservation_id_seq
                    START WITH 1 -- ���� ��ȣ ����
                    INCREMENT BY 1  -- ���� ���� ����
                     NOCYCLE -- ���� ��ȯ ���� ����
                     NOCACHE; -- ��ȣ�� �̸� �������� ���� ����


-- SELECT * FROM reservation;
-- DROP TABLE reservation;
-- DROP SEQUENCE reservation_id_seq;
-- TRUNCATE TABLE reservation;





-- 8. Q&A ���̺�
CREATE TABLE qna (
    qna_id NUMBER(10) -- qna ��ȣ
    CONSTRAINT qna_id_pk PRIMARY KEY, 
    member_id NUMBER(5) -- ���� ��ȣ (������)
    CONSTRAINT qna_member_id_fk REFERENCES member(member_id), 
    royal_id NUMBER(2) -- �� ��ȣ
    CONSTRAINT qna_royal_id_fk REFERENCES royal(royal_id),
    qna_title VARCHAR2(2000) -- qna ����
    CONSTRAINT qna_title_nn NOT NULL,
    qna_content VARCHAR2(2000) -- qna ����
    CONSTRAINT qna_content_nn NOT NULL,
    qna_result VARCHAR2(2000), -- qna �亯����
    qna_date DATE  DEFAULT SYSDATE  -- qna �ۼ���
);


--qna ������
 CREATE SEQUENCE qna_id_seq
                    START WITH 1 -- ���� ��ȣ ����
                    INCREMENT BY 1  -- ���� ���� ����
                    NOCYCLE -- ���� ��ȯ ���� ����
                    NOCACHE; -- ��ȣ�� �̸� �������� ���� ����

-- SELECT * FROM qna;
-- DROP TABLE qna;
-- DROP SEQUENCE qna_id_seq;
-- TRUNCATE TABLE qna;


-- 9. �����ϴ� ���� ���̺�
CREATE TABLE faq(
    faq_id NUMBER(5) -- faq ��ȣ(������)
    CONSTRAINT faq_id_pk PRIMARY KEY,
    royal_id NUMBER(2) -- �� ��ȣ
    CONSTRAINT faq_royal_id_fk REFERENCES royal(royal_id), 
    faq_title VARCHAR2(100) -- faq ����
    CONSTRAINT faq_title_nn NOT NULL,
    faq_result VARCHAR2(4000) -- faq ����
    CONSTRAINT faq_result_nn NOT NULL
);
 
 -- �����ϴ����� ������
CREATE SEQUENCE faq_id_seq
                    START WITH 1 -- ���� ��ȣ ����
                    INCREMENT BY 1  -- ���� ���� ����
                    NOCYCLE -- ���� ��ȯ ���� ����
                    NOCACHE; -- ��ȣ�� �̸� �������� ���� ����
                    
-- SELECT * FROM faq;
-- DROP TABLE faq;
-- DROP SEQUENCE faq_id_seq;
-- TRUNCATE TABLE faq;



--------------------------------------------------------------------------------


-- ���� �� ��� ���̺� ����
--select * from tabs;
--
---- �������� ���� 
--select * from user_constraints;
--
--
--select * from user_sequences;
--drop sequence royal_inner_seq;

--------------------------------------------------------------------------------






