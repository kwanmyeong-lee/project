--유혁

--1.
--(1)
create table emp3
(
    emp_no  number  not null,
    emp_name    varchar(40) not null,
    emp_hdate   date,
    emp_mgr_no  number,
    dept_no number
);

create table dept3
(
    dept_no number not null,
    dept_name   varchar2(30) not null,
    dept_area   varchar2(20)
);

--(2)
alter table emp3
add constraint pk_emp3_emp_no primary key(emp_no);

alter table dept3
add constraint pk_dept3_dept_no primary key(dept_no);


--(3)
alter table emp3
add constraint fk_emp3_dept_no foreign key(dept_no) references dept3(dept_no);


--(4)
insert into dept3
values(10, '영업부', '서울');
insert into dept3
values(20, '총무부', '서울');

--(5)
insert into emp3
values(1001,'홍길동','2010-03-02',1000,10);

--(6)
update emp3
set emp_name='김서정', emp_hdate='2020-09-01'
where emp_no=1001;

--2.
create view v_emp3
as
select e.emp_no, e.emp_name, e.emp_hdate, d.dept_no, d.dept_name
from emp3 e join dept3 d
on e.dept_no=d.dept_no;

--3.


--4.
select e.*, 
    (select dept_name from dept3 d
     where e.dept_no=d.dept_no) "부서장명"
from emp3 e
order by e.dept_no desc;


--5.
select emp_no, emp_name, dept_no 
from emp3 
where dept_no in (select dept_no from dept3 
                   where dept_area='서울');