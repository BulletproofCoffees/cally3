commit;
--테이블 호출--------------------------------------------------------
--공유
select * from c_member c; --회원
select * from c_admin; --관리자
select * from c_te; --회원건강

--시퀀스 생성----------------------------------------------------------------
--공유
CREATE SEQUENCE seq_cally_member INCREMENT BY 1 ; --회원
CREATE SEQUENCE seq_cally_admin INCREMENT BY 1 ; --관리자

DROP SEQUENCE seq_cally_member;
DROP SEQUENCE seq_cally_admin;


--데이터 삽입--------------------------------------------------------------------------
--truncate table c_member;

--공유------------------
insert into c_member --회원
(MEM_NUM,mem_state,mem_id,mem_pw,mem_email,mem_name)
values (seq_cally_member.nextval,'y','rm','rm','rm@naver.com','김남준');
insert into c_member --회원
(MEM_NUM,mem_state,mem_id,mem_pw,mem_email,mem_name)
values (seq_cally_member.nextval,'y','jin','jin','jin@naver.com','김석진');
insert into c_member --회원
(MEM_NUM,mem_state,mem_id,mem_pw,mem_email,mem_name)
values (seq_cally_member.nextval,'y','suga','suga','suga@naver.com','민윤기');
insert into c_member --회원
(MEM_NUM,mem_state,mem_id,mem_pw,mem_email,mem_name)
values (seq_cally_member.nextval,'y','j-hope','j-hope','j-hope@naver.com','정호석');
insert into c_member --회원
(MEM_NUM,mem_state,mem_id,mem_pw,mem_email,mem_name)
values (seq_cally_member.nextval,'y','jimin','jimin','jimin@naver.com','박지민');
insert into c_member --회원
(MEM_NUM,mem_state,mem_id,mem_pw,mem_email,mem_name)
values (seq_cally_member.nextval,'y','v','v','v@naver.com','김태형');
insert into c_member --회원
(MEM_NUM,mem_state,mem_id,mem_pw,mem_email,mem_name)
values (seq_cally_member.nextval,'y','jungkook','jungkook','jungkook@naver.com','전정국');
select * from c_member c; --회원


insert into c_admin --관리자
values (seq_cally_admin.nextval,'test','test12','test@naver.com');
select * from c_admin; --관리자


-- 남여 m,w
insert into c_te --회원건강
values (1,'m','25','165','50','2000');
insert into c_te --회원건강
values (2,'m','27','165','50','2000');
insert into c_te --회원건강
values (3,'m','26','165','50','2000');
insert into c_te --회원건강
values (4,'m','25','165','50','2000');
insert into c_te --회원건강
values (5,'m','24','165','50','2000');
insert into c_te --회원건강
values (6,'m','24','165','50','2000');
insert into c_te --회원건강
values (7,'m','22','165','50','2000');
select * from c_te; --회원건강







--회원 프로시저 생성
create or replace procedure p_add_member(
p_m_mem_id c_member.mem_id%type,
p_m_mem_pw C_MEMBER.MEM_PW%type,
p_m_mem_email c_member.mem_email%type,
p_m_mem_name C_MEMBER.MEM_NAME%type
)
is
begin
insert into c_member values(seq_cally_member.nextval,'y',p_m_mem_id,p_m_mem_pw,p_m_mem_email,p_m_mem_name);
commit;
end;
-- 회원 프로시저 실행문
execute p_add_member('pro_id_11','pro_pw_11','procedure@test.com','프로시저테스트');



create or replace procedure p_update_member(
p_m_mem_code C_MEMBER.MEM_code%type,
p_m_mem_pw C_MEMBER.MEM_PW%type,
p_m_mem_npw nvarchar2
)
is
begin
update c_member set mem_pw = p_m_mem_npw, mem_code = p_m_mem_code where mem_pw = p_m_mem_pw;
commit;
end;
execute p_update_member(5,'pro_pw','pro_update');


--회원상태 프로시저
create or replace procedure p_s_del_member(
p_m_mem_code C_MEMBER.MEM_NUM%type
)
is
begin
update c_member set MEM_STATE = 'n' where MEM_NUM = p_m_mem_code;
commit;
end;
execute p_s_del_member(5);