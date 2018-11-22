CREATE TABLE test_guest(m_title NVARCHAR2(100));
INSERT INTO test_member VALUES ('김영재');
select * from test_guest;


 SELECT * FROM 테이블명;--테이블보기
DROP TABLE 테이블명;--테이블삭제
 CREATE sequence 생성명 start with 1 increment BY 1 NOCYCLE; ---시퀀스생성
  DROP SEQUENCE 시퀀스명; ---시퀀스삭제
  
  ALTER TABLE 테이블명 DROP PRIMARY KEY;--기본키 삭제
  ALTER TABLE 테이블명 DROP CONSTRAINT 컬럼명;--fk삭제
 
  --테이블생성
  CREATE TABLE 이름( 
  no NUMBER(크기) NOT NULL, --번호
   이름  VARCHAR2(30) , -- 제목 
    이름 DATE DEFAULT SYSDATE, -- 작성일
     constraint 생성명 primary key(컬럼명),--기본키 생성
      CONSTRAINT 키생성명 FOREIGN KEY(컬럼명) REFERENCES 부모테이블명(부모컬럼명)--rf키생성
 );
 
--컬럼추가 
 ALTER TABLE 테이블명
ADD 추가할 컬럼명  데이터 유형;



--table_seq라는 시퀀스의 증가값을 원하는 시작값으로 가도록 변경한다. 여기서는 300으로 정하겠습니다.(-300도 됩니다.)
ALTER SEQUENCE 시퀀스이름
INCREMENT BY 증가값
NOCACHE
NOCYCLE;
--시퀀스를 호출합니다. 원하는 값만큼 증가한걸 확인 하실 수 있습니다.
SELECT table_seq.nextval FROM dual;


DELETE FROM 테이블명; --데이터 삭제


CREATE OR REPLACE VIEW 뷰명 AS .....SELECT ... ; --뷰생성
DROP VIEW 뷰명;--뷰삭제

 