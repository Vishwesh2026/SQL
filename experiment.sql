-- exp1
use labinternal;
create table exp1_dept(dept_id int,dept_name varchar(20),primary key(dept_id));
select * from exp1_dept;

create table exp1_emp(emp_id int,ename char(10),dept_no int,foreign key(dept_no) references exp1_dept(dept_id));
select * from exp1_emp;
-- alter table exp1_emp modify ename varchar(100) not null;

insert into exp1_dept(dept_id ,dept_name) values(10,'CSE');

insert into exp1_emp(emp_id , ename, dept_no)
values(101,'vishu',10);

drop table exp1_emp;

drop table exp1_dept;

-- exp2

-- create dept table 

create table dept(
	deptno int(2),
    dname varchar(14),
    loc varchar(13),
    constraint pk_dept primary key(deptno));
select * from dept;
use labinternal;
create table emp(
empno int(20),
ename varchar(100),
job varchar(100),
mgr int(20),
hiredate date,
sal int(20),
comm int(20),
deptno int(20),
constraint pk_emp primary key(empno),
constraint fk_deptno foreign key(deptno) references dept(deptno));
select * from emp;
drop table emp;

-- insert records into dept table

insert into dept values('10','ACCOUNTING','NEW YORK'),
('20','RESEARCH','DALLAS'),
('30','SALES','CHICAGO'),
('40','OPERATIONS','BOSTON');

-- insert records into emp table

INSERT INTO emp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
VALUES
(7839,'KING','PRESIDENT',null,'1981-11-17',5000,0,10),
(7698,'BLAKE','MANAGER',7839,'1981-05-01',2850,0,30),
(7782,'CLARK','MANAGER',7839,'1981-06-09',2450,0,10),
(7566,'JONES','MANAGER',7839,'1981-04-02',2975,0,20),
(7788,'SCOTT','ANALYST',7566,'1987-06-13',3000,0,20),
(7902,'FORD','ANALYST',7566,'1981-12-03',3000,0,20),
(7369,'SMITH','CLERK',7902,'1980-12-17',800,0,20),
(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30),
(7521,'WARD','SALESMAN',7698,'1981-02-22',1250,500,30),
(7654,'MARTIN','SALESMAN',7698,'1981-9-28',1250,1400,30),
(7844,'TURNER','SALESMAN',7698,'1981-9-8',1500,0,30),
(7876,'ADAMS','CLERK',7788,'1987-7-13',1100,null,20),
(7900,'JAMES','CLERK',7698,'1981-12-3',950,null,30),
(7934,'MILLER','CLERK',7782,'1982-1-23',1300,null,10);

select * from emp;


--  1.Display the names of the employees who earn highest salary in their respective departments using in operator 

select ename,sal,deptno
from emp
where sal in (select max(sal) from emp group by deptno);

--   2.Display the names of the employees who earn highest salaries in their respective job groups 

select ename ,job,sal 
from emp 
where sal in (select max(sal) from emp group by job);

--  3.Display the names of the employees from department number 10 With salary greater than that of any employee working in other department

select ename,sal from emp where deptno = 10
and sal > any( select sal from emp where deptno not in (10));

--  4.Display the names of the employees from department number 10 With salary greater than that of all employee working in other department.

select ename,sal from emp where deptno = 10
and sal > all(select sal from emp where deptno not in (10));

--  Display department no, name of department which at least one employee.

select deptno,dname from dept d
where exists (select * from emp e where e.deptno = d.deptno);

--  Display department no, name of department which don’t have employee at all 

select deptno,dname from dept d
where not exists(select * from emp e where e.deptno = d.deptno);


--  Display the job titles in department 10 and 20 and observe the difference between UNION and UNION ALL 

select job from emp where deptno = 10
union
select job from emp where deptno =20;

select job from emp where deptno = 10
union all
select job from emp where deptno =20;

--  Display the common job titles in department 10 and 20 Select

Select job from emp where deptno =10 
Intersect
Select job from emp where deptno=20;







-- experiment 3



-- 1.Display the total number of employees working in the company.

select count(*) from emp;

--  2.Display the total salary paid to all employees.

select sum(sal) from emp;

--  3.Display the maximum salary from emp table.

select max(sal) from emp;

--  4.Display the minimum salary from emp table.

select min(sal) from emp;

--  5.Display the average salary from emp table.

select avg(sal) from emp;

--  6.Display the maximum salary being paid to ClERK

select max(sal) from emp where job = 'CLERK';

--  7.Display the maximum salary being paid to department number 20.

select max(sal) from emp where deptno = 20;

--  8.Display the minimum salary being paid to SALESMAN

select min(sal) from emp where job = 'SALESMAN';

--  9.Display the average salary drawn by MANAGERS.

select avg(sal) from emp where job = 'MANAGER';

--  10.Display the total salary drawn from ANALYST working in depart number 20.

select sum(sal) from emp where job = 'ANALYST' and deptno = 20;


--  11.Displays total salary paid to employees work in each department.

select deptno,sum(sal) from emp group by deptno;

--  12.Display number of employees,total salary paid to employees work in each deprtment 

select deptno department_no,count(*) no_of_employees,sum(sal) total_salary from emp group by deptno;

--  13.Displays the department no , job, total salary paid to employees group by deptno,job.

select deptno department_no ,job ,sum(sal) total_salary from emp group by deptno,job;

--  14.Display the department code ,total salary paid to employees group by deptno and MGR = 7698.

select deptno department_no,sum(sal) total_salary from emp where mgr = 7698 group by deptno;

--  15.Display the department no, number of employees of those groups that have more than 2 employees:

select deptno department_no,count(*) no_of_employees from emp group by deptno having count(*)>2;

--  16.Display the departments where the sum of salaries is $50,000 or more

select deptno,sum(sal) from emp group by deptno having sum(sal) >= 50000;

--  17.Display those department, sum(sal) and number of employees having more than 4 employees and sum of sal of the dept is more than 9000 from emp table

select deptno,sum(sal),count(*) from emp group by deptno having sum(sal) > 9000 and count(*) > 4;

-- 18.Display number of employees with year from emp table in which year more than 1 employees

select to_char(hiredate,'YYYY'),count(*) from emp group by to_char(hiredate,'YYYY') having count(*) > 1;

-- 19.create a view on a sales department staff of data in the emp table

create view sales_staff as select empno,ename,deptno from emp where deptno =10;















































