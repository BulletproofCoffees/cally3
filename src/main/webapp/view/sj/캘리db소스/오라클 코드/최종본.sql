commit;
--테이블 호출--------------------------------------------------------
--공유
select * from c_member ; --회원
select * from c_admin; --관리자
select * from c_te; --회원건강
-- 식단관리
select * from c_sj_Re; --칼로리카운터
select * from c_sj_foods; --영양성분
select * from c_sj_adfood; --추천음식
select * from c_sj_today; --작성날짜
select * from c_sj_fimg; --식품이미지
select * from c_sj_com; --댓글


--시퀀스 생성----------------------------------------------------------------
--공유
CREATE SEQUENCE seq_cally_member INCREMENT BY 1 ; --회원
CREATE SEQUENCE seq_cally_admin INCREMENT BY 1 ; --관리자

DROP SEQUENCE seq_cally_member;
DROP SEQUENCE seq_cally_admin;

--식단관리
CREATE SEQUENCE seq_cally_c_sj_foods INCREMENT BY 1; --영양성분
CREATE SEQUENCE seq_cally_c_sj_adfood INCREMENT BY 1; --추천음식
CREATE SEQUENCE seq_cally_c_sj_today INCREMENT BY 1; --작성날짜
CREATE SEQUENCE seq_cally_c_sj_Re INCREMENT BY 1; --칼로리카운터
--삭제
DROP SEQUENCE seq_cally_c_sj_foods;
DROP SEQUENCE seq_cally_c_sj_adfood;
DROP SEQUENCE seq_cally_c_sj_today;

--데이터 삽입--------------------------------------------------------------------------
insert into c_member --회원
(MEM_NUM,mem_state,mem_id,mem_pw,mem_email,mem_name)
values (1,'y','rm','rm','rm@naver.com','김남준');
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
select * from c_member; --회원

insert into c_admin --관리자
values (1,'1','1','test1@naver.com');
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

insert into c_sj_foods
--영양성분
values (1,'사과.생것','','100','49','14.36','0.2','0.03','11.14','0','0','0.01','');
insert into c_sj_foods --영양성분
values (seq_cally_c_sj_foods.nextval,'바나나.생것','','100','79','21.94','1.1','0.1','14.63','0','0','0.04','');
insert into c_sj_foods --영양성분
values (seq_cally_c_sj_foods.nextval,'삼겁살.생것','','100','224','0','17.88','17.19','0','52','84.1','6.38','');
insert into c_sj_foods --영양성분
values (seq_cally_c_sj_foods.nextval,'김치볶음밥','','100','151','24','4.6','4.1','','358','','','');
insert into c_sj_foods --영양성분
values (seq_cally_c_sj_foods.nextval,'새우버거','롯데리아','150','699.75','0','17.78','40.05','13.03','598.5','','','');
select * from c_sj_foods; --영양성분

insert into c_sj_today -- 날짜
values (1,1,'2018-10-20','a.jpg','배고프다');
insert into c_sj_today -- 날짜
values (seq_cally_c_sj_today.nextval,1,'2018-10-21','b.jpg','배고프다2');
insert into c_sj_today -- 날짜
values (seq_cally_c_sj_today.nextval,1,'2018-10-23','c.jpg','배고프다3');
insert into c_sj_today -- 날짜
values (seq_cally_c_sj_today.nextval,2,'2018-10-20','aa.jpg','배고프다1');
insert into c_sj_today -- 날짜
values (seq_cally_c_sj_today.nextval,2,'2018-10-21','ba.jpg','배고프다21');
insert into c_sj_today -- 날짜
values (seq_cally_c_sj_today.nextval,2,'2018-10-23','ca.jpg','배고프다31');
insert into c_sj_today -- 날짜
values (seq_cally_c_sj_today.nextval,3,'2018-10-20','ab.jpg','배고프다2');
insert into c_sj_today -- 날짜
values (seq_cally_c_sj_today.nextval,3,'2018-10-21','bb.jpg','배고프다22');
insert into c_sj_today -- 날짜
values (seq_cally_c_sj_today.nextval,3,'2018-10-23','cb.jpg','배고프다32');
insert into c_sj_today -- 날짜
values (seq_cally_c_sj_today.nextval,4,'2018-10-20','ac.jpg','배고프다3');
insert into c_sj_today -- 날짜
values (seq_cally_c_sj_today.nextval,4,'2018-10-21','bc.jpg','배고프다23');
insert into c_sj_today -- 날짜
values (seq_cally_c_sj_today.nextval,4,'2018-10-23','cc.jpg','배고프다33');
insert into c_sj_today -- 날짜
values (seq_cally_c_sj_today.nextval,5,'2018-10-20','ad.jpg','배고프다4');
insert into c_sj_today -- 날짜
values (seq_cally_c_sj_today.nextval,5,'2018-10-21','bd.jpg','배고프다24');
insert into c_sj_today -- 날짜
values (seq_cally_c_sj_today.nextval,5,'2018-10-23','cd.jpg','배고프다34');
insert into c_sj_today -- 날짜
values (seq_cally_c_sj_today.nextval,6,'2018-10-20','ae.jpg','배고프다5');
insert into c_sj_today -- 날짜
values (seq_cally_c_sj_today.nextval,6,'2018-10-21','be.jpg','배고프다25');
insert into c_sj_today -- 날짜
values (seq_cally_c_sj_today.nextval,6,'2018-10-23','ce.jpg','배고프다35');
insert into c_sj_today -- 날짜
values (seq_cally_c_sj_today.nextval,7,'2018-10-20','af.jpg','배고프다6');
insert into c_sj_today -- 날짜
values (seq_cally_c_sj_today.nextval,7,'2018-10-21','bf.jpg','배고프다26');
insert into c_sj_today -- 날짜
values (seq_cally_c_sj_today.nextval,7,'2018-10-23','cf.jpg','배고프다36');
select * from c_sj_today; --작성날짜


insert into c_sj_Re values (1,1,1,1); -- 칼로리카운터
insert into c_sj_Re values (seq_cally_c_sj_Re.nextval,1,1,1,1); -- 칼로리카운터
insert into c_sj_Re values (seq_cally_c_sj_Re.nextval,1,2,1,2); -- 칼로리카운터
insert into c_sj_Re values (seq_cally_c_sj_Re.nextval,1,2,2,2); -- 칼로리카운터
insert into c_sj_Re values (seq_cally_c_sj_Re.nextval,1,3,1,3); -- 칼로리카운터
insert into c_sj_Re values (seq_cally_c_sj_Re.nextval,2,1,1,2); -- 칼로리카운터
insert into c_sj_Re values (seq_cally_c_sj_Re.nextval,2,1,2,1); -- 칼로리카운터
insert into c_sj_Re values (seq_cally_c_sj_Re.nextval,2,3,1,3); -- 칼로리카운터
insert into c_sj_Re values (seq_cally_c_sj_Re.nextval,3,1,2,1); -- 칼로리카운터
insert into c_sj_Re values (seq_cally_c_sj_Re.nextval,3,1,1,2); -- 칼로리카운터
insert into c_sj_Re values (seq_cally_c_sj_Re.nextval,4,1,2,1); -- 칼로리카운터
insert into c_sj_Re values (seq_cally_c_sj_Re.nextval,4,1,2,2); -- 칼로리카운터
select * from c_sj_Re; --칼로리카운터

insert into c_sj_adfood --추천음식
values (SEQ_CALLY_C_SJ_ADFOOD.nextval,'1','2','추천설명');
insert into c_sj_adfood --추천음식
values (SEQ_CALLY_C_SJ_ADFOOD.nextval,'1','3','추천설명2');
insert into c_sj_adfood --추천음식
values (SEQ_CALLY_C_SJ_ADFOOD.nextval,'1','4','추천설명3');

--퀄리문------------------------------------------------------------------------------------------------------------------------------------
--날짜 함수
CREATE OR REPLACE FUNCTION c_sj_day
(pDate IN Date, pFormat IN VARCHAR2)
RETURN VARCHAR2
IS
BEGIN
  -- 현재 날짜를 리턴
  RETURN TO_CHAR(pDate, pFormat);
END;


--일일 칼로리 카운터
SELECT
M.MEM_ID,c_sj_day(TDAY.DAY,'yyyy-MM-dd') 작성날짜
--,CAL.THE_CODE 아점저,CAL.AMOUNT 수량,F.DESC_KOR 식품
,SUM(F.NUTR_CONT1*CAL.AMOUNT) 총칼로리
,SUM(F.NUTR_CONT2*CAL.AMOUNT) 탄수,SUM(F.NUTR_CONT3*CAL.AMOUNT)단백,SUM(F.NUTR_CONT4*CAL.AMOUNT) 지방
FROM C_SJ_RE cal,C_SJ_TODAY tday,C_MEMBER m,C_SJ_FOODS f
WHERE
CAL.DOY_CODE =TDAY.DOY_CODE
and M.MEM_NUM=TDAY.MEM_NUM
and F.F_NO=CAL.F_NO 
--and M.MEM_ID ='rm'
--and TDAY.DAY ='2018-10-20'
GROUP BY M.MEM_ID,TDAY.DAY
;

--칼로리 평균
SELECT
  ROUND(SUM(총칼로리)/COUNT(*),1) Average,ROUND(SUM(탄수)/COUNT(*),1) car,ROUND(SUM(단백)/COUNT(*),1) Protein,ROUND(SUM(지방)/COUNT(*),1) fat
FROM(
SELECT
M.MEM_ID,c_sj_day(TDAY.DAY,'yyyy-MM-dd') 작성날짜
--,CAL.THE_CODE 아점저,CAL.AMOUNT 수량,F.DESC_KOR 식품
,SUM(F.NUTR_CONT1*CAL.AMOUNT) 총칼로리
,SUM(F.NUTR_CONT2*CAL.AMOUNT) 탄수,SUM(F.NUTR_CONT3*CAL.AMOUNT)단백,SUM(F.NUTR_CONT4*CAL.AMOUNT) 지방
FROM C_SJ_RE cal,C_SJ_TODAY tday,C_MEMBER m,C_SJ_FOODS f
WHERE
CAL.DOY_CODE =TDAY.DOY_CODE
and M.MEM_NUM=TDAY.MEM_NUM
and F.F_NO=CAL.F_NO 
and M.MEM_ID ='sj'
--and TDAY.DAY ='2018-10-20'
GROUP BY M.MEM_ID,TDAY.DAY
);

--최근 작성한 식단 3개-------------------------------
select 
*
from (
SELECT
M.MEM_ID,c_sj_day(TDAY.DAY,'yyyy-MM-dd') tday
,SUM(F.NUTR_CONT1*CAL.AMOUNT) cal
,SUM(F.NUTR_CONT2*CAL.AMOUNT) Carbohydrateeks,SUM(F.NUTR_CONT3*CAL.AMOUNT) Protein,SUM(F.NUTR_CONT4*CAL.AMOUNT) Fat
,TDAY.IMG
FROM 
C_SJ_RE cal,C_SJ_TODAY tday,C_MEMBER m,C_SJ_FOODS f
WHERE
CAL.DOY_CODE =TDAY.DOY_CODE
and M.MEM_NUM=TDAY.MEM_NUM
and F.F_NO=CAL.F_NO 
and M.MEM_ID = 'rm'
GROUP BY M.MEM_ID,TDAY.DAY,TDAY.IMG
ORDER BY TDAY.DAY DESC
)
where rownum <= 3;

--식품 그램당 칼로리
select 
DESC_KOR,SERVING_WT,NUTR_CONT1,NUTR_CONT2,NUTR_CONT3,NUTR_CONT4,
ROUND(nutr_cont1/SERVING_WT,2) g당칼로리,
ROUND(nutr_cont2/SERVING_WT,2) g당탄수,
ROUND(nutr_cont3/SERVING_WT,2) g당단백질,
ROUND(nutr_cont4/SERVING_WT,2) g당지방,
ROUND((nutr_cont2/SERVING_WT)*100,1) 탄수비율,
ROUND((nutr_cont3/SERVING_WT)*100,1) 단백비율,
ROUND((nutr_cont4/SERVING_WT)*100,1) 지방비율
from c_sj_foods;


--검색
select * from c_sj_foods  WHERE desc_kor = '새우버거';

--수정
 UPDATE c_sj_foods
     SET 
     img1 = ''
     ,img2 = ''
     ,img3 = ''
     ,img4 = ''
     WHERE desc_kor = '새우버거';



--회원건강정보 로그인
select t.mem_code,m.mem_id 
from c_te t,c_member m
WHERE
t.mem_code = m.mem_num
and m.mem_id = 'a'
;


-- 관리자 추천음식 셀렉트
select 
F.DESC_KOR, AF.EXP
from 
c_sj_adfood af,C_SJ_FOODS f
WHERE
AF.F_NO = F.F_NO
ORDER BY DBMS_RANDOM.VALUE
;

--날짜 테이블 검색
SELECT 
M.MEM_ID
,TDAY.DAY 
FROM C_SJ_TODAY tday,C_MEMBER m,c_sj_re
WHERE
M.MEM_ID ='rm'
and day = '2018-10-30'
AND M.MEM_NUM = TDAY.MEM_NUM




--칼로리카운터 뷰 sql문------------------------------------------------------------------------------------------------------

--투데이 컬럼생성 프로시져
CREATE OR REPLACE PROCEDURE p_sj_today_search(
test_M_mem_num c_member.mem_num%type, --아이디
test_sj_day date --날짜
)
is
m_num c_member.mem_num%type;
begin
select count(*) into m_num 
from c_member m,c_sj_today today WHERE m.MEM_NUM = test_M_mem_num AND today.day = test_sj_day and m.MEM_NUM = TODAY.MEM_NUM;

if m_num = 0 THEN 
insert into c_sj_today values(seq_cally_c_sj_today.nextval,test_M_mem_num,test_sj_day,'','');
END IF;
    commit;
end;
--
call p_sj_today_search(23,TO_DATE('2018-11-8','YYYY-MM-dd'))


--생성 투데이넘버 가져오기
SELECT
   today.doy_code
FROM c_sj_today today,c_member m
WHERE 
m.mem_num = today.mem_num
AND m.mem_num = 2
and today.day = TO_DATE('2018-11-07','YYYY-MM-dd')
;

-- re컬럼 넣기
insert into c_sj_Re values (1,1,1,1);


-- 칼로리합
SELECT
M.MEM_ID,c_sj_day(TDAY.DAY,'yyyy-MM-dd') tday
,SUM(F.NUTR_CONT1*CAL.AMOUNT) cal
,SUM(F.NUTR_CONT2*CAL.AMOUNT) Carbohydrateeks,SUM(F.NUTR_CONT3*CAL.AMOUNT) Protein,SUM(F.NUTR_CONT4*CAL.AMOUNT) Fat
,TDAY.IMG
FROM 
C_SJ_RE cal,C_SJ_TODAY tday,C_MEMBER m,C_SJ_FOODS f
WHERE
CAL.DOY_CODE =TDAY.DOY_CODE
and M.MEM_NUM=TDAY.MEM_NUM
and F.F_NO=CAL.F_NO 
and tday.doy_code = 1
GROUP BY M.MEM_ID,TDAY.DAY,TDAY.IMG;



-- 행 삭제
DELETE FROM c_sj_re WHERE re_no = 2;



-- api&re 등록 프로시저
create or replace PROCEDURE p_sj_api_foodup(
f_desc_kor VARCHAR2,
f_mn VARCHAR2,
f_serving_wt NUMBER,
f_nutr_cont1 NUMBER,
f_nutr_cont2 NUMBER,
f_nutr_cont3 NUMBER,
f_nutr_cont4 NUMBER,
f_nutr_cont5 NUMBER,
f_nutr_cont6 NUMBER,
f_nutr_cont7 NUMBER,
f_nutr_cont8 NUMBER,
f_nutr_cont9 NUMBER,

re_doy_code NUMBER,
re_the_code NUMBER,
re_amount NUMBER
)
is
p_f_desc_kor c_sj_foods.desc_kor%type;
begin

select count(*) into p_f_desc_kor 
from c_sj_foods f WHERE f.desc_kor = f_desc_kor;

if p_f_desc_kor = 0 THEN 
insert into c_sj_foods values (seq_cally_c_sj_foods.nextval,f_desc_kor,f_mn,f_serving_wt,f_nutr_cont1,f_nutr_cont2,f_nutr_cont3,f_nutr_cont4,f_nutr_cont5,f_nutr_cont6,f_nutr_cont7,f_nutr_cont8,f_nutr_cont9);
insert into c_sj_Re values (seq_cally_c_sj_Re.nextval,re_doy_code,re_the_code,re_amount,(select f.f_no from c_sj_foods f WHERE f.desc_kor = f_desc_kor));

ELSIF p_f_desc_kor = 1 THEN 
insert into c_sj_Re values (seq_cally_c_sj_Re.nextval,re_doy_code,re_the_code,re_amount,(select f.f_no from c_sj_foods f WHERE f.desc_kor = f_desc_kor));
 END IF;
commit;
end;

call p_sj_api_foodup('d','d',100,100,100,100,0.0,100,100,100,100,100,9,1,1);






-- 관리자페이지----------------------------------------------------------------------------------------------
CREATE VIEW V_SJ_SEXCAL AS
SELECT
m.mem_num ,m.mem_id,te.mem_sex ,today.day,today.doy_code
,re.f_no,re.amount, f.desc_kor ,f.nutr_cont1,f.nutr_cont2,f.nutr_cont3,f.nutr_cont4
FROM 
c_member m,c_sj_today today,c_te te,c_sj_re re,c_sj_foods f
WHERE 
m.mem_num = today.mem_num
AND te.mem_code = m.mem_num 
and m.mem_num = today.mem_num
and re.doy_code = today.doy_code
and f.f_no = re.f_no;

SELECT
   ROUND(sum(v.amount*v.nutr_cont1)/count(*),1) nutr_cont1,
   ROUND(sum(v.amount*v.nutr_cont2)/count(*),1) nutr_cont2,
   ROUND(sum(v.amount*v.nutr_cont3)/count(*),1) nutr_cont3,
   ROUND(sum(v.amount*v.nutr_cont4)/count(*),1) nutr_cont4
FROM v_sj_sexcal v 
WHERE 
v.mem_sex = 'm'
;

SELECT
   ROUND(sum(v.amount*v.nutr_cont1)/count(*),1) nutr_cont1,
   ROUND(sum(v.amount*v.nutr_cont2)/count(*),1) nutr_cont2,
   ROUND(sum(v.amount*v.nutr_cont3)/count(*),1) nutr_cont3,
   ROUND(sum(v.amount*v.nutr_cont4)/count(*),1) nutr_cont4
FROM v_sj_sexcal v 
WHERE 
v.mem_sex = 'w'
;