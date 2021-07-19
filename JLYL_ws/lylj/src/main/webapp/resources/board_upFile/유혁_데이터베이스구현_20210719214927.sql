--À¯Çõ

--1.
create tablespace TEST
datafile 'C:\oraclexe\mydata\test.dbf'size 48m
autoextend on next 10m;

create user T_USER
identified by T_USER123
default tablespace test;

create user T_USER2
identified by T_USER123
default tablespace test;

--2.
grant connect,resource to T_USER;
grant connect,resource to T_USER2;
grant create view to T_USER;
grant create view to T_USER2;

grant resource, connect to T_USER with admin option;

--3.
select * from dba_tablespaces;
select * from dba_users;

--4.
create table MEMBER
(
    no  number  primary key,
    userid  char(15)    unique  not null,
    name    varchar2(15)    not null,
    pwd     char(20)    not null,
    hp      char(15),
    regdate date    default sysdate
);

--5.

--6.



--7.
create or replace view v_MEMBER
as
select no, userid, name, pwd, hp, regdate
from member
where regdate between '2021-04-01' and '2021-04-30';

--8.
select * from v_MEMBER;

--9.
create sequence MEMBER_SEQ
start with 250
increment by 1
nocache;

--10.
insert into member
values(MEMBER_SEQ.nextval, 'user','À¯Àú','user123','010-000-0000', default);
