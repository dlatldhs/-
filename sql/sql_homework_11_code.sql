CREATE TABLE NewBook (
    bookid number,
    bookname varchar2(20),
    publisher varchar2(20),
    price number,
    PRIMARY KEY(bookid)
);

CREATE TABLE NewBook (
    bookname varchar2(20) NOT null,
    publisher varchar2(20) unique,
    price number default 10000 check(price > 1000),
    PRIMARY KEY(bookname,publisher)
);

drop table NewBook; -- 삭제

INSERT
    INTO NewBook
    values('A책', 'A출판사', 2000);
commit;

insert into NewBook values('B책','B출판사',2000);

insert into NewBook values('C책','C출판사',1500);
commit;

select * from newbook;

insert 
    into Newbook(bookname,publisher) 
    values('E책','E출판사');
commit;
select * from NewBook;

create table NewCustomer (
    custid number primary key,
    name VARCHAR2(40),
    address varchar2(40),
    phone varchar2(30)
);

create table NewOrders(
    orderid number,
    custid number not null,
    bookid number not null,
    saleprice number,
    primary key(orderid),
    foreign key(custid) 
        references NewCustomer(custid)
        on delete cascade
);
drop table NewOrders;
drop table NewCustomer;

drop table NewBook;
create table NewBook(
    bookid number,
    bookname varchar2(20),
    publisher varchar2(20),
    price number
    );
    
alter table NewBook add isbn varchar2(13);

alter table NewBook 
modify isbn number;

delete from Newbook;

alter table NewBook DROP COLUMN isbn;

select * from NewBook;

alter table NewBook
Add primary key(bookid);

alter table NewBook
add constraint book_pp primary key(bookid);

alter table NewBook
Add primary key(bookid);

insert into Book(bookid,bookname,price,publisher) values(15,'스포츠 의학',90000,'한솔의학서적');

update customer
set address = '부산'
WHERE custid = 5;
commit;
select * from customer;

delete from customer
WHERE custid=5;
SELECT * FROM customer;

-- 199 page
-- 극장 테이블
CREATE TABLE Theater(
    Theater_id number(8) primary key,
    Theater_name varchar2(20) NOT NULL,
    Theater_address varchar2(20) NOT NULL
);
insert into Theater values(1,'롯데','잠실');
insert into Theater values(2,'메가','강남');
insert into Theater values(3,'대한','잠실');
select * from Theater;

-- 상영관 테이블
CREATE TABLE ScreenHall(
    Theater_id number(8),
    ScreenHall_id number(8) check(ScreenHall_id < 10),
    Movie_name varchar2(20) NOT NULL,
    price number(8) check(price < 20000),
    seats number(8), -- 좌석수
    primary key(Theater_id,ScreenHall_id),
    foreign key(Theater_id) REFERENCES Theater(Theater_id) ON DELETE CASCADE
);
DROP TABLE ScreenHall;
insert into ScreenHall values(1,1,'어려운 영화',15000,48);
insert into ScreenHall values(3,1,'멋진 영화',7500,120);
insert into ScreenHall values(3,2,'재밌는 영화',8000,110);
select * from ScreenHall;
delete from ScreenHall;

-- 예약 table
CREATE TABLE Reservation(
    Theater_id number(8),
    ScreenHall_id number(8) check(ScreenHall_id < 10),
    Client_id number(8),
    seat_num number(8),
    Today DATE,
    primary key(Theater_id,ScreenHall_id,Client_id),
    FOREIGN KEY(Theater_id,ScreenHall_id) REFERENCES ScreenHall(Theater_id,ScreenHall_id) ON DELETE CASCADE,
    FOREIGN KEY(Client_id) REFERENCES Clients(Client_id) ON DELETE CASCADE
);
DROP TABLE Reservation;
insert into Reservation values(3,2,3,15,'2020-09-01');
insert into Reservation values(3,1,4,16,'2020-09-01');
insert into Reservation values(1,1,9,48,'2020-09-01');
select * from Reservation;
delete from Reservation;

-- 고객 테이블
CREATE TABLE Clients(
    Client_id number(8) primary key,
    Client_name varchar2(20),
    Client_address varchar2(20)
);

insert into Clients values(3,'홍길동','강남');
insert into Clients values(4,'김철수','잠실');
insert into Clients values(9,'박영희','강남');
select * from Clients;
delete from Clients;

-- 1. 모든 극장의 이름과 위치
SELECT
    Theater_name,
    Theater_address
FROM Theater;
-- 2. 잠실에 있는 극장
SELECT
    theater_name
FROM Theater
WHERE theater_address = '잠실';
-- 3. 잠실에 사는 고객의 이름 오름차순
SELECT
    Client_name
FROM Clients
WHERE client_address = '잠실';
-- 4. 가격이 8000 이하 영화 극장번호 상영관 번호 영화 제목
SELECT
    Theater_id,
    ScreenHall_id,
    Movie_name
FROM ScreenHall
WHERE price <= 8000;
-- 5. 극장 위치와 고객의 주소가 같은 고객을 보이시오.
SELECT client_name
FROM Clients,Theater
WHERE client_address = theater_address;

-- 극장의 수는 몇 개인가 ?
select count(theater_name)
FROM Theater;
-- 상영되는 영화의 평균 가격은 얼마인가 ?
select AVG(price)
FROM ScreenHall;
-- 2020년 9월 1일에 영화를 관람한 고객의 수는 얼마인가 ?
select
    SUM(seats)
FROM ScreenHall,Reservation
WHERE Reservation.Today = '2020-09-01';

-- 대한 극장에서 상영된 영화제목을 보이시오.
select movie_name
FROM ScreenHall
WHERE theater_id = (select theater_id
                       FROM Theater
                       WHERE theater_name = '대한');

-- 대한 극장에서 영화를 본 고객의 이름
select *
FROM Clients
WHERE client_id IN (3,4);
                    select client_id
                    FROM reservation
                    WHERE theater_id = (SELECT theater_id
                                        FROM theater
                                        WHERE theater_name = '대한');
-- 대한 극장의 전체 수입
SELECT sum(price)
FROM screenhall
WHERE theater_id = 3;

-- 극장별 상영관 수
SELECT
    theater_id,
    count(screenhall_id)
FROM screenhall
GROUP BY theater_id;

-- 잠실에 있는 극장의 상영관
select theater_name
from theater
where theater_address = '잠실';

-- 2020 9 1 극장별 평균 관람 고객 수
select 
    theater_id,
    sum(seat_num)
FROM reservation
GROUP BY theater_id;

-- 2020 9 1 가장 많은 고객이 관람한 영화
select movie_name
from screenhall
WHERE SEATS = (select max(seat_num)
               FROM reservation); -- 48

-- 각 테이블에 데이터를 삽입하는 insert 문ㅇ르 하나씩 실행시키기
--- 극장
    INSERT INTO Theater values(4,'장미','남포');
    select * from theater;
--- 상영관
    INSERT INTO Screenhall values(4,1,'범죄도시2',8000,120);
    select * from screenhall;
--- 예약
    INSERT INTO Reservation values(4,1,12,19,'2022-04-25');
    select * from Reservation;
--- clients
    INSERT INTO Clients values(12,'임시온','부산');
    select * from clients;

-- 영화 가격 10% 인상
select * from screenhall;
UPDATE screenhall
SET price = price*1.1;

-- 12

-- Salesperson 테이블
CREATE TABLE Salesperson(
    name VARCHAR2(20) PRIMARY KEY,
    age NUMBER,
    salary NUMBER);
    drop table salesperson;
    INSERT INTO salesperson values('Zion.t','33',9000);
    INSERT INTO salesperson values('Lil boi','31',6500);
    INSERT INTO salesperson values('SUPER BEE','28',7000);
    select * from salesperson;

-- Order 테이블 
CREATE TABLE Order(
    custname VARCHAR2(20),
    salesperson VARCHAR2(20),
    amount DATE,
    PRIMARY KEY(custname,salesperson),
    foreign key(salesperson) REFERENCES Salesperson(name) ON DELETE CASCADE,
    foreign key(custname) REFERENCES Custname3(name) ON DELETE CASCADE
    );

-- 이미 마당에 CUSTOMER 하고 CUSTOMER 2 가 있어서 3으로 대체
CREATE TABLE Customer3(
    name VARCHAR2(20) PRIMARY KEY,
    city VARCHAR2(20),
    industrytype VARCHAR2(20)
    );
    
