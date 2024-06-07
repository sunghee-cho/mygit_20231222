use empdb;
select * from empdb;

drop table if exists membergroup;
create table membergroup
(gid int primary key auto_increment, 
-- auto_increment는 pk 먼저 조건지정되어야함. auto_increment 는 제약조건이 아니므로 컬럼옆에만 기술 가능
-- 따라서 auto_increment 선언할 컬럼의 pk는 컬럼레벨만 가능
gname varchar(20) not null  -- not null 제약조건은 컬럼레벨만 가능
 );


drop table if exists member1;
/*create table member1
(id varchar(10) primary key,
password int not null,
name varchar(10),
phone varchar(13) unique,
email varchar(30) check (email like '%@%'),
ref int references membergroup(gid) on delete cascade on update cascade);*/

create table member1
(id varchar(10) primary key,
password int not null,
name varchar(10),
phone varchar(13) unique,
email varchar(30) check (email like '%@%'),
ref int ,
foreign key(ref) references membergroup(gid) on delete cascade on update cascade);

desc membergroup;
desc member1;
-- 제약조건 확인
select * from information_schema.table_constraints where table_name = 'member1';
-- 외래키 제약조건 삭제
alter table member1 drop foreign key ref_fk; -- 확인한 키이름
-- 다른 제약조건 삭제
alter table member1 drop constraint member1_chk_1; -- 확인한 키이름
-- 제약조건 확인
select * from information_schema.table_constraints where table_name = 'member1';
-- 외래키 다시 추가
alter table member1 add constraint ref_fk foreign key(ref) 
references membergroup(gid) on delete cascade on update cascade;
--   다른 제약조건 추가
alter table member1 add constraint mem_email_ck check( phone like '010-%' );
-- 제약조건 확인
select * from information_schema.table_constraints where table_name = 'member1';
-- drop table if exists member;
create table member2
(memberid varchar(30) ,
password varchar(100) not null,
membername varchar(30),
phone varchar(30) ,
constraint mem_id_pk primary key(memberid),
constraint mem_email_ck check( phone like '010-%' ),
constraint ref_fk foreign key(ref) references membergroup(gid) on delete cascade on update cascade ) ;

select now(), sysdate()  ;

drop table if exists board;
create table board
(seq int primary key auto_increment,-- auto_incement는 int타입만(decimal타입불가)
title varchar(100) not null,
contents varchar(4000), 
writer varchar(30) ,
time datetime default now(), -- date or time 타입도 가능
password decimal(5,0), 
viewcount decimal(10,0), 
constraint board_view_ck check (viewcount >= 0),
constraint board_writer_fk foreign key(writer) references member1(id) 
on delete cascade on update cascade);



