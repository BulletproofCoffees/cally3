--테이블 호출--------------------------------------------------------
-- 식단관리
select * from c_sj_Re; --식단작성
select * from c_sj_today; --날짜
select * from c_sj_foods; --영양성분
select * from c_sj_adfood; --추천음식
select * from c_sj_img; --이미지기록

--삭제
DROP TABLE c_sj_today; --날짜
DROP TABLE c_sj_foods; --영양성분
DROP TABLE c_sj_adfood; --추천음식
DROP TABLE c_sj_img; --이미지기록
DROP TABLE c_sj_Re; --식단작성

--시퀀스 생성----------------------------------------------------------------
--식단관리
CREATE SEQUENCE seq_cally_c_sj_foods INCREMENT BY 1; --영양성분
CREATE SEQUENCE seq_cally_c_sj_adfood INCREMENT BY 1; --추천음식

--삭제
DROP SEQUENCE seq_cally_c_sj_foods;
DROP SEQUENCE seq_cally_c_sj_adfood;

--식단관리 데이터 삽입----------------------------------------------------------------
insert into c_sj_foods --영양성분
values (seq_cally_c_sj_foods.nextval,'사과.생것','','','','','','100','49','14.36','0.2','0.03','11.14','0','0','0.01','');
insert into c_sj_foods --영양성분
values (seq_cally_c_sj_foods.nextval,'바나나,생것','','','','','','100','79','21.94','1.1','0.1','14.63','0','0','0.04','');
insert into c_sj_foods --영양성분
values (seq_cally_c_sj_foods.nextval,'삼겁살,생것','','','','','','100','224','0','17.88','17.19','0','52','84.1','6.38','');
insert into c_sj_foods --영양성분
values (seq_cally_c_sj_foods.nextval,'김치볶음밥','','','','','','100','151','24','4.6','4.1','','358','','','');
insert into c_sj_foods --영양성분
values (seq_cally_c_sj_foods.nextval,'새우버거','롯데리아','','','','','150','699.75','0','17.78','40.05','13.03','598.5','','','');

insert into c_sj_today -- 날짜
values ('2018-10-20');
insert into c_sj_today -- 날짜
values ('2018-10-21');
insert into c_sj_today -- 날짜
values ('2018-10-22');
insert into c_sj_today -- 날짜
values ('2018-10-23');
insert into c_sj_today -- 날짜
values ('2018-10-24');
insert into c_sj_today -- 날짜
values ('2018-10-25');
insert into c_sj_today -- 날짜
values ('2018-10-26');
insert into c_sj_today -- 날짜
values ('2018-10-27');
insert into c_sj_today -- 날짜
values ('2018-10-28');
insert into c_sj_today -- 날짜
values ('2018-10-29');
insert into c_sj_today -- 날짜
values ('2018-10-30');

 --식단작성 코드-아이디-날짜-아점저-수량-식품코드
insert into c_sj_Re
values ('1','2018-10-20','1','3','1');
insert into c_sj_Re --식단작성
values ('2','2018-10-20','1','2','2');
insert into c_sj_Re --식단작성
values ('3','2018-10-20','1','1','2');
insert into c_sj_Re --식단작성
values ('4','2018-10-20','1','1','1');
insert into c_sj_Re
values ('5','2018-10-20','1','1','2');
insert into c_sj_Re --식단작성
values ('6','2018-10-20','1','1','1');
insert into c_sj_Re --식단작성
values ('7','2018-10-20','1','1','2');
insert into c_sj_Re
values ('1','2018-10-20','3','1','3');
insert into c_sj_Re --식단작성
values ('2','2018-10-20','3','3','3');
insert into c_sj_Re --식단작성
values ('3','2018-10-20','3','2','3');
insert into c_sj_Re --식단작성
values ('4','2018-10-20','3','2','3');
insert into c_sj_Re
values ('5','2018-10-20','3','1','4');
insert into c_sj_Re --식단작성
values ('6','2018-10-20','3','2','5');
insert into c_sj_Re --식단작성
values ('7','2018-10-20','3','1','4');

insert into c_sj_Re
values ('1','2018-10-21','1','2','1');
insert into c_sj_Re --식단작성
values ('2','2018-10-21','1','4','2');
insert into c_sj_Re --식단작성
values ('3','2018-10-21','1','1','2');
insert into c_sj_Re --식단작성
values ('4','2018-10-21','1','2','1');
insert into c_sj_Re
values ('5','2018-10-21','1','3','2');
insert into c_sj_Re --식단작성
values ('6','2018-10-21','1','1','1');
insert into c_sj_Re --식단작성
values ('7','2018-10-21','1','1','2');
insert into c_sj_Re
values ('1','2018-10-21','3','2','3');
insert into c_sj_Re --식단작성
values ('2','2018-10-21','3','3','3');
insert into c_sj_Re --식단작성
values ('3','2018-10-21','3','3','3');
insert into c_sj_Re --식단작성
values ('4','2018-10-21','3','1','3');
insert into c_sj_Re
values ('5','2018-10-21','3','2','4');
insert into c_sj_Re --식단작성
values ('6','2018-10-21','3','3','5');
insert into c_sj_Re --식단작성
values ('7','2018-10-21','3','2','4');



insert into c_sj_img -- 이미지
values (1,'2018-10-20','a.img');
insert into c_sj_img -- 이미지
values (2,'2018-10-20','b.img');
insert into c_sj_img -- 이미지
values (3,'2018-10-20','c.img');
insert into c_sj_img -- 이미지
values (4,'2018-10-20','d.img');
insert into c_sj_img -- 이미지
values (5,'2018-10-20','e.img');
insert into c_sj_img -- 이미지
values (6,'2018-10-20','f.img');
insert into c_sj_img -- 이미지
values (7,'2018-10-20','g.img');
insert into c_sj_img -- 이미지
values (1,'2018-10-21','a1.img');
insert into c_sj_img -- 이미지
values (2,'2018-10-21','b2.img');
insert into c_sj_img -- 이미지
values (3,'2018-10-21','c3.img');
insert into c_sj_img -- 이미지
values (4,'2018-10-21','d4.img');
insert into c_sj_img -- 이미지
values (5,'2018-10-21','e5.img');
insert into c_sj_img -- 이미지
values (6,'2018-10-21','f6.img');
insert into c_sj_img -- 이미지
values (7,'2018-10-21','g7.img');






insert into c_sj_adfood --추천음식
values (SEQ_CALLY_C_SJ_ADFOOD.nextval,'2','2','추천설명');
insert into c_sj_adfood --추천음식
values (SEQ_CALLY_C_SJ_ADFOOD.nextval,'2','3','추천설명2');
insert into c_sj_adfood --추천음식
values (SEQ_CALLY_C_SJ_ADFOOD.nextval,'2','4','추천설명3');





--날짜 함수
CREATE OR REPLACE FUNCTION c_sj_day
(pDate IN Date, pFormat IN VARCHAR2)
RETURN VARCHAR2
IS
BEGIN
  -- 현재 날짜를 리턴
  RETURN TO_CHAR(pDate, pFormat);
END;















