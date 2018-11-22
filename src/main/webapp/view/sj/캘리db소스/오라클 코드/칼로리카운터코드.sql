--테이블 호출--------------------------------------------------------
--공유
select * from c_member c; --회원
select * from c_admin; --관리자
select * from c_te; --회원건강
-- 식단관리
select * from c_sj_Re; --식단작성
select * from c_sj_today; --날짜
select * from c_sj_foods; --영양성분
select * from c_sj_adfood; --추천음식
select * from c_sj_img; --이미지기록

--일일 총칼로리--------------------------------------
select 
a.mem_id 아이디,c_sj_day(b.day,'yyyy-MM-dd') 먹은날짜,SUM(b.f_no*f.nutr_cont1) 총칼로리,SUM(b.f_no*f.nutr_cont2) 탄수화물,SUM(b.f_no*f.nutr_cont3) 단백질,SUM(b.f_no*f.nutr_cont4) 지방
from c_member a,c_sj_re b,c_sj_foods f,c_sj_today d
--WHERE
--and a.mem_id = 'rm'
--and d.day ='2018-10-23'
GROUP BY a.mem_id,b.day
;

--일별 총칼로리보기-----------------------------------------------
select 
a.mem_id 아이디,c_sj_day(b.day,'yyyy-MM-dd') 먹은날짜,SUM(b.f_no*f.nutr_cont1) 먹은총칼로리
from c_member a,c_sj_re b,c_sj_foods f,c_sj_today d
--WHERE
--and a.mem_id = 'rm'
--and d.day ='2018-10-23'
GROUP BY a.mem_id,b.day
;

--모두 합산-------------------------------------------------------
select SUM(plus) 총합칼로리 from (
select 
a.mem_id 아이디,c_sj_day(b.day,'yyyy-MM-dd') 먹은날짜,SUM(b.f_no*f.nutr_cont1) plus
from c_member a,c_sj_re b,c_sj_foods f,c_sj_today d
WHERE
a.mem_id = 'rm'
--and d.day ='2018-10-23'
GROUP BY a.mem_id,b.day
),c_member
;

--홈화면------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--최근 작성한 식단 3개-------------------------------
select * from (
select 
a.mem_id 아이디,c_sj_day(b.day,'yyyy-MM-dd') 작성날짜,i.img 이미지,SUM(b.f_no*f.nutr_cont1) 총칼로리,SUM(b.f_no*f.nutr_cont2) 탄수화물,SUM(b.f_no*f.nutr_cont3) 단백질,SUM(b.f_no*f.nutr_cont4) 지방
from c_sj_img i,c_member a,c_sj_re b,c_sj_foods f
WHERE 
i.mem_num =a.mem_num 
and i.day = b.day
and i.mem_num = b.mem_num
and a.mem_id = 'rm'
GROUP BY a.mem_id,b.day,i.img
ORDER BY b.day DESC
) 
where rownum <= 3
;

select * from c_sj_adfood;

--칼로리 작성------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--식단 등록
insert into c_sj_Re
values ('아이디코드','2018-00-00','아점저코드','수량','식품코드');

--검색------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select * from c_sj_foods  WHERE desc_kor = '새우버거';
select 
 f_no 식품코드,
    DESC_KOR 식품명, 
    SERVING_WT 일회제공량,
    nutr_cont1 칼로리 ,
    nutr_cont2 탄수화물,
    nutr_cont3 단백질,
    nutr_cont4 지방,
    ROUND(nutr_cont1/SERVING_WT,1) g당칼로리,
    ROUND(nutr_cont2/SERVING_WT,1) g당탄수,
    ROUND(nutr_cont3/SERVING_WT,1) g당단백질,
    ROUND(nutr_cont4/SERVING_WT,1) g당지방,
    ROUND((nutr_cont2/SERVING_WT)*100,1) 탄수비율,
    ROUND((nutr_cont3/SERVING_WT)*100,1) 단백비율,
    ROUND((nutr_cont4/SERVING_WT)*100,1) 지방비율,
    nutr_cont5,
    nutr_cont6,
    nutr_cont7,
    nutr_cont8,
    nutr_cont9,
    img1,
    img2,
    img3,
    img4
    from c_sj_foods 
    WHERE desc_kor = ''
   ;

--식품 등록
insert into c_sj_foods
values (seq_cally_c_sj_foods.nextval,'식품명','이미지1','이미지2','이미지3','이미지3','1회제공량 (g)','열량 (kcal)','탄수화물 (g)','단백질 (g)','지방 (g)','당류 (g)','나트륨 (mg)','콜레스테롤 (mg)','포화지방산 (g)','트랜스지방산 (g)');

--식품 수정
 UPDATE c_sj_foods
     SET 
     img1 = ''
     ,img2 = ''
     ,img3 = ''
     ,img4 = ''
     WHERE F_NO = '';
     
--관리자-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DELETE c_sj_adfood WHERE f_no = '2'; --삭제
