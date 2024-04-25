
CREATE TABLE LOCATION
(LCODE int(3) PRIMARY KEY,
NAME VARCHAR(10));

CREATE TABLE JOB
(JCODE int(3) PRIMARY KEY,
NAME varchar(15));

CREATE TABLE DEPT
(DEPTNO int(2) PRIMARY KEY,
NAME  VARCHAR(10),
LOCATION int(3) REFERENCES LOCATION(LCODE));

CREATE TABLE EMPLOYEE
(EMPNO int(2) PRIMARY KEY,
ENAME VARCHAR(10),
JOB int(3) REFERENCES JOB(JCODE),
MGR_NO int(2) REFERENCES EMPLOYEE(EMPNO),
HIREDATE DATE,
SALARY int(10),
COMMISSION int(8),
DEPTNO int(2) REFERENCES DEPT(DEPTNO));

INSERT INTO LOCATION VALUES(122,'KAKINADA');
INSERT INTO LOCATION VALUES(124,'HYDERABAD');
INSERT INTO LOCATION VALUES(123,'BANGALORE');
INSERT INTO LOCATION VALUES(167,'VIJAYAWADA');

INSERT INTO JOB VALUES(667,'CLERK');
INSERT INTO JOB VALUES(668,'STAFF');
INSERT INTO JOB VALUES(669,'ANALYST');
INSERT INTO JOB VALUES(671,'VICE PRESIDENT');
INSERT INTO JOB VALUES(672,'PRESIDENT');

INSERT INTO DEPT VALUES(10,'ACCOUNTING',122);
INSERT INTO DEPT VALUES(20,'RESEARCH',124);
INSERT INTO DEPT VALUES(30,'SALES',123);
INSERT INTO DEPT VALUES(40,'OPERATIONS',167);
INSERT INTO DEPT VALUES(12,'RESEARCH',122);
INSERT INTO DEPT VALUES(13,'SALES',122);
INSERT INTO DEPT VALUES(14,'OPERATIONS',122);
INSERT INTO DEPT VALUES(23,'SALES',124);
INSERT INTO DEPT VALUES(24,'OPERATIONS',124);
INSERT INTO DEPT VALUES(34,'OPERATIONS',123);
INSERT INTO DEPT VALUES(43,'SALES',167);

INSERT INTO employee VALUES (1,'Venkat',672,null,STR_TO_DATE('01-FEB-2006', '%d-%b-%Y'),1200000,10000,40);
INSERT INTO employee VALUES (2,'Nirmala',671,1,STR_TO_DATE('02-MAR-2007', '%d-%b-%Y'),800000,50000,20);
INSERT INTO employee VALUES (3,'Pradeep',669,1,STR_TO_DATE('10-OCT-2005', '%d-%b-%Y'),1000000,null,40);
INSERT INTO employee VALUES (4,'Srinivas',669,1,STR_TO_DATE('08-MAY-2005', '%d-%b-%Y'),1000000,null,30);
INSERT INTO employee VALUES (5,'Krishna',668,2,STR_TO_DATE('09-OCT-2005', '%d-%b-%Y'),500000,20000,12);
INSERT INTO employee VALUES (6,'Deepa',668,3,STR_TO_DATE('09-NOV-2007', '%d-%b-%Y'),600000,null,23);
INSERT INTO employee VALUES (7,'Keerthi',668,4,STR_TO_DATE('05-JUN-2006', '%d-%b-%Y'),600000,null,24);
INSERT INTO employee VALUES (8,'Aravind',671,1,STR_TO_DATE('21-JAN-2006', '%d-%b-%Y'),800000,600000,30);
INSERT INTO employee VALUES (9,'Srikanth',668,8,STR_TO_DATE('18-NOV-2006', '%d-%b-%Y'),400000,500000,34);
INSERT INTO employee VALUES (10,'Suresh',667,3,STR_TO_DATE('12-DEC-2008', '%d-%b-%Y'),120000,null,23);
INSERT INTO employee VALUES (11,'Rahul',667,9,STR_TO_DATE('11-MAR-2008', '%d-%b-%Y'),80000,null,30);
INSERT INTO employee VALUES (12,'Kumar',667,4,STR_TO_DATE('16-MAR-2008', '%d-%b-%Y'),120000,null,20);



CREATE TABLE sailors (
    sid INT NOT NULL,
    sname VARCHAR(20),
    rating INT,
    age DECIMAL(4, 1),
    PRIMARY KEY (sid)
);


CREATE TABLE boats (
    bid INT NOT NULL,
    bname VARCHAR(20),
    color VARCHAR(20),
    PRIMARY KEY (bid)
);


create table Reserves 
(sid int,
bid int,
day date,
primary key (sid,bid,day),
foreign key (sid) references Sailors(sid) ON DELETE CASCADE,
foreign key (bid) references Boats(bid) ON DELETE CASCADE);




INSERT INTO SAILORS VALUES (22,'DUSTIN',7,45);
INSERT INTO SAILORS VALUES (29,'BRUTUS',1,33);
INSERT INTO SAILORS VALUES (31,'LUBBER',8,55.5);
INSERT INTO SAILORS VALUES (32,'ANDY',8,25);
INSERT INTO SAILORS VALUES (58,'RUSTY',10,35);
INSERT INTO SAILORS VALUES (64,'HORATIO',7,35);
INSERT INTO SAILORS VALUES (71,'ZORBA',10,16);
INSERT INTO SAILORS VALUES (74,'DUNKON',9,40);
INSERT INTO SAILORS VALUES (85,'ARDHAR',3,23.5);
INSERT INTO SAILORS VALUES (95,'BOB',3,63.5);

INSERT INTO BOATS VALUES (101,'INTERLAKE','BLUE');
INSERT INTO BOATS VALUES (102,'INTERLAKE','RED');
INSERT INTO BOATS VALUES (103,'CLIPPER','GREEN');
INSERT INTO BOATS VALUES (104,'MARINE','RED');


INSERT INTO RESERVES VALUES(22,101,STR_TO_DATE('10-OCT-1998', '%d-%b-%Y'));
INSERT INTO RESERVES VALUES(22,102,STR_TO_DATE('10-OCT-1998', '%d-%b-%Y'));
INSERT INTO RESERVES VALUES(22,103,STR_TO_DATE('10-AUG-1998', '%d-%b-%Y'));
INSERT INTO RESERVES VALUES(22,104,STR_TO_DATE('10-JUL-1998', '%d-%b-%Y'));
INSERT INTO RESERVES VALUES(31,102,STR_TO_DATE('11-OCT-1998', '%d-%b-%Y'));
INSERT INTO RESERVES VALUES(31,103,STR_TO_DATE('11-JUN-1998', '%d-%b-%Y'));
INSERT INTO RESERVES VALUES(31,104,STR_TO_DATE('11-DEC-1998', '%d-%b-%Y'));
INSERT INTO RESERVES VALUES(64,101,STR_TO_DATE('09-MAY-1998', '%d-%b-%Y'));
INSERT INTO RESERVES VALUES(64,102,STR_TO_DATE('09-AUG-1998', '%d-%b-%Y'));
INSERT INTO RESERVES VALUES(74,103,STR_TO_DATE('09-AUG-1998', '%d-%b-%Y'));





-- SET - 1
-- 1)  a)CEIL() Function The CEIL() function in SQL is used to round up a number to the nearest 
-- whole number. If the number is already a whole number, it returns the same number.
SELECT CEIL(10.75);
-- b) MONTHS_BETWEEN() Function The MONTHS_BETWEEN() function in SQL is used to get the number of 
-- months between two dates.
-- the below query in the MYSQL form SELECT TIMESTAMPDIFF(MONTH, '2023-01-01', '2023-12-31') AS Months;
SELECT MONTHS_BETWEEN(TO_DATE('2023-12-31','YYYY-MM-DD'), TO_DATE('2023-01-01','YYYY-MM-DD')) AS Months;


-- 2) Find the names of the employee whose names is exactly five Characters in length
SELECT ename FROM employee
WHERE LENGTH(ename) = 5;

-- 3) Employees working under either Pradeep or Srinivas

SELECT * FROM employee
WHERE MGR_NO IN (SELECT EMPNO FROM EMPLOYEE WHERE ENAME = 'Pradeep' OR ENAME = 'Srinivas');

-- 4) Display the name of the employee who earns highest salary.
SELECT ENAME
FROM EMPLOYEE
WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEE);

-- 5) Find all sids who have a rating of 10 or have reserved boat 104
SELECT DISTINCT sid
FROM sailors
WHERE rating = 10 
OR sid IN (SELECT sid FROM reserves WHERE bid = 104);

-- 6) Write PL/SQL code to find specificc Employee salary for given Empno from EMPLOYEE table

DECLARE
    v_empno EMPLOYEE.EMPNO%TYPE := 123; -- Replace 123 with the desired employee number
    v_salary EMPLOYEE.SALARY%TYPE;
BEGIN
    SELECT SALARY INTO v_salary
    FROM EMPLOYEE
    WHERE EMPNO = v_empno;

    IF v_salary IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('The salary of employee ' || v_empno || ' is: ' || v_salary);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Employee ' || v_empno || ' not found.');
    END IF;
END;
/

 
 
 
 
 -- SET - 2
 -- 1) Discuss these functions with example SQL Queries   a) SQRT()    b) LAST_DAY()
 -- 1) a)The SQRT() function in SQL is used to calculate the square root of a numeric value. 
 -- It takes a single argument, which is the numeric value for which you want to find the square root.
 
SELECT SQRT(576) FROM DUAL;

 -- 1) b)The LAST_DAY() function in SQL is used to find the last day of the month for a given date or datetime expression. 
 -- It returns the date of the last day of the month for the input date.
 
SELECT LAST_DAY(STR_TO_DATE('15-AUG-1947', '%d-%b-%Y')) FROM DUAL;


-- 2) Display the names of employees whose names have second alphabet A in their names.

SELECT ENAME
FROM EMPLOYEE
WHERE SUBSTRING(ENAME, 2, 1) = 'A';

-- 3) All employees reporting to the PRESIDENT
SELECT e.EMPNO, e.ENAME
FROM EMPLOYEE e
JOIN DEPT d ON e.DEPTNO = d.DEPTNO
WHERE d.NAME = 'PRESIDENT';


-- 4) Display the names of employees who are working as Clerks, Salesman or Analyst and drawing a salary more than 250000.
SELECT ENAME
FROM EMPLOYEE e
JOIN JOB j ON e.JOB = j.JCODE
WHERE j.NAME IN ('CLERK', 'SALESMAN', 'ANALYST') 
AND e.SALARY > 250000;


-- 5) Find the names of aliors who have reserved a red or a green boat 
SELECT DISTINCT s.sname
FROM sailors s
JOIN Reserves r ON s.sid = r.sid
JOIN boats b ON r.bid = b.bid
WHERE b.color IN ('RED', 'GREEN');

-- 6) Write a PL/SQL program to display a sailor details with sid = 31
DECLARE
    v_sid sailors.sid%TYPE := 31;
    v_sname sailors.sname%TYPE;
    v_rating sailors.rating%TYPE;
    v_age sailors.age%TYPE;
BEGIN
    SELECT sname, rating, age
    INTO v_sname, v_rating, v_age
    FROM sailors
    WHERE sid = v_sid;

    IF v_sname IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Sailor ID: ' || v_sid);
        DBMS_OUTPUT.PUT_LINE('Sailor Name: ' || v_sname);
        DBMS_OUTPUT.PUT_LINE('Rating: ' || v_rating);
        DBMS_OUTPUT.PUT_LINE('Age: ' || v_age);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Sailor with ID ' || v_sid || ' not found.');
    END IF;
END;
/



-- SET-3
-- 1) Discuss these functions with Example SQL Queries    a) Sysdate    b) GREATEST()
-- a) SYSDATE
-- The SYSDATE function in SQL is used to retrieve the current system date and time from the database server. It returns a DATE data type value representing the current date and time.'
SELECT SYSDATE FROM DUAL;

-- b) GREATEST()
-- The GREATEST() function in SQL is used to return the greatest value from a list of expressions. It can take multiple arguments and returns the highest value among them. The arguments can be of any numeric or date/time data type.
SELECT GREATEST(10, 5, 15, 8) AS greatest_value FROM DUAL;



-- 2) Display the Employee names for employees whose name ends with Alphabet S.
SELECT ENAME
FROM EMPLOYEE
WHERE RIGHT(ENAME, 1) = 'S';


-- 3) Employees in ACCOUNTING department 
SELECT ENAME
FROM EMPLOYEE e
JOIN DEPT d ON e.DEPTNO = d.DEPTNO
WHERE d.NAME = 'ACCOUNTING';

-- 4) Display the names of employees working in depart number 10 or 20 or 40 or employees working as CLERKS,SALESMAN or ANALYST
SELECT ENAME
FROM EMPLOYEE e
JOIN DEPT d ON e.DEPTNO = d.DEPTNO
JOIN JOB j ON e.JOB = j.JCODE
WHERE d.DEPTNO IN (10, 20, 40)
   OR j.NAME IN ('CLERK', 'SALESMAN', 'ANALYST');

-- 5) FInd the colors of boats reserved by a sailor named Rusty
SELECT DISTINCT b.color
FROM sailors s
JOIN Reserves r ON s.sid = r.sid
JOIN boats b ON r.bid = b.bid
WHERE s.sname = 'Rusty';

-- 6) Write a PL/SQL program to display all information about a sailor using % rowtype data type
DECLARE
    v_sailor sailors%ROWTYPE;
BEGIN
    SELECT *
    INTO v_sailor
    FROM sailors
    WHERE sid = 31;

    IF v_sailor.sid IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Sailor ID: ' || v_sailor.sid);
        DBMS_OUTPUT.PUT_LINE('Sailor Name: ' || v_sailor.sname);
        DBMS_OUTPUT.PUT_LINE('Rating: ' || v_sailor.rating);
        DBMS_OUTPUT.PUT_LINE('Age: ' || v_sailor.age);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Sailor with ID 31 not found.');
    END IF;
END;
/



-- Set - 4
-- 1)Discuss these funtions with EXAMPLE SQL Queries    a) INITCAP()    b) ADD_MONTHS()
-- a) INITCAP():

-- Description: The INITCAP function in SQL capitalizes the first letter of each word in a string and converts the rest of the letters to lowercase.
SELECT INITCAP('hello world') AS init_cap_text FROM DUAL;

-- ADD_MONTHS():

-- Description: The ADD_MONTHS function in SQL adds a specified number of months to a date and returns the resulting date.
SELECT ADD_MONTHS(SYSDATE, 3) AS future_date FROM DUAL;

-- 2)Display the maximum salary being paid to depart number 20
SELECT MAX(SALARY) AS max_salary
FROM EMPLOYEE
WHERE DEPTNO = 20;

-- 3)Find the minimum salary in the ACCOUNTING department 
SELECT MIN(SALARY) AS min_salary
FROM EMPLOYEE e
JOIN DEPT d ON e.DEPTNO = d.DEPTNO
WHERE d.NAME = 'ACCOUNTING';

-- 4) Display the names of the employee who are not working as SALEMAN OR CLERK OR ANALYST
SELECT ENAME
FROM EMPLOYEE
WHERE JOB NOT IN (SELECT JCODE FROM JOB WHERE NAME IN ('SALESMAN', 'CLERK', 'ANALYST'));

-- 5) Find the names of sailors who have reserveed boat no 120
SELECT DISTINCT s.sname
FROM sailors s
JOIN Reserves r ON s.sid = r.sid
WHERE r.bid = 120;

-- 6) Write PL/SQl program to print welcome messege after insertion for each row in sailors table using trigger
CREATE OR REPLACE TRIGGER welcome_message_trigger
AFTER INSERT ON sailors
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Welcome, ' || :NEW.sname || '! Your record has been successfully inserted.');
END;
/





-- SET - 5
-- 1) Discuss these functions with Example SQL Queries    a) CONCAT()   b) NEXTDAY()
-- Description: The CONCAT function in SQL concatenates two or more strings together.
SELECT CONCAT('Hello ', 'World') AS concatenated_text FROM DUAL;
-- Description: The NEXT_DAY function in SQL returns the date of the first weekday that is later than a specified date.
SELECT NEXT_DAY(SYSDATE, 'FRIDAY') AS next_friday FROM DUAL;



-- 2) Display the employee number and name who do not earn any comm.
SELECT EMPNO, ENAME
FROM EMPLOYEE
WHERE COMMISSION IS NULL;

-- 3) The job ids of all the employees who are managers of other employees
SELECT DISTINCT e.JOB
FROM EMPLOYEE e
WHERE e.EMPNO IN (SELECT MGR_NO FROM EMPLOYEE WHERE MGR_NO IS NOT NULL);

-- 4) Display the employee names who are working in Kakinada
SELECT e.ENAME
FROM EMPLOYEE e
JOIN DEPT d ON e.DEPTNO = d.DEPTNO
JOIN LOCATION l ON d.LOCATION = l.LCODE
WHERE l.NAME = 'KAKINADA';

-- 5) Find the average age of sailor for each rating level that at least 2 sailors  
SELECT rating, AVG(age) AS average_age
FROM sailors
GROUP BY rating
HAVING COUNT(*) >= 2;

-- 6) Write a PL/SQL program to find factorial of a given number by using function
CREATE OR REPLACE FUNCTION factorial(n IN NUMBER) RETURN NUMBER IS
    result NUMBER := 1;
BEGIN
    IF n < 0 THEN
        RETURN -1; -- Return -1 for negative numbers (error condition)
    ELSIF n = 0 THEN
        RETURN 1; -- Return 1 for 0
    ELSE
        FOR i IN 1..n LOOP
            result := result * i;
        END LOOP;
        RETURN result;
    END IF;
END factorial;
/

SET SERVEROUTPUT ON;

DECLARE
    num NUMBER := 5; -- Change the value of num to calculate factorial for a different number
BEGIN
    DBMS_OUTPUT.PUT_LINE('Factorial of ' || num || ' is: ' || factorial(num));
END;
/


-- SET -6

-- 1) Discuss these functions with Example SQL QUeris   a) SYSdate    b) RPAD()

-- Description: The SYSDATE function in SQL returns the current date and time from the database server's operating system.

SELECT SYSDATE FROM DUAL;

-- Description: The RPAD function in SQL pads a string with a specified character (or characters) on the right side until the string reaches a specified length.

SELECT RPAD('Hello', 10, '-') AS padded_text FROM DUAL;




-- 2) Display the names of all the employees who are working in dept number 10.
SELECT ENAME
FROM EMPLOYEE
WHERE DEPTNO = 10;

-- 3)Names of employees who do not have a manager
SELECT ENAME
FROM EMPLOYEE
WHERE MGR_NO IS NULL;

-- 4) Display the names of the employees from department number 30 with salary greater 
-- than that of all employee working in other departments 
SELECT ENAME
FROM EMPLOYEE
WHERE DEPTNO = 30
AND SALARY > ALL (SELECT SALARY FROM EMPLOYEE WHERE DEPTNO != 30);


-- 5) Find the names of sailors who have reserved at least one boat

SELECT DISTINCT s.sname
FROM sailors s
JOIN Reserves r ON s.sid = r.sid;

-- 6) Write a PL/SQL program to handle divide by zero exception
DECLARE
    dividend NUMBER := 10; -- Change the value of dividend as needed
    divisor NUMBER := 0;   -- Change the value of divisor as needed
    result NUMBER;
BEGIN
    BEGIN
        result := dividend / divisor;
        DBMS_OUTPUT.PUT_LINE('Result: ' || result);
    EXCEPTION
        WHEN ZERO_DIVIDE THEN
            DBMS_OUTPUT.PUT_LINE('Error: Division by zero');
    END;
END;
/


-- SET - 7

-- 1) DIscuss these functions with Example SQL Queries     a) MOD()        b)  POWER()

-- Description: The MOD function in SQL returns the remainder of a division operation.
SELECT MOD(10, 3) AS remainder FROM DUAL;

-- Description: The POWER function in SQL returns a number raised to the power of another number.
SELECT POWER(2, 3) AS result FROM DUAL;





-- 2) Display the maximum salary being paid to CLERK
SELECT MAX(SALARY) AS max_salary
FROM EMPLOYEE e
JOIN JOB j ON e.JOB = j.JCODE
WHERE j.NAME = 'CLERK';

-- 3) Display the names of the employee who are not working as MANAGERS
SELECT ENAME
FROM EMPLOYEE
WHERE JOB != (SELECT JCODE FROM JOB WHERE NAME = 'MANAGER');

-- 4) Dispay the names of the employees from department number 40 with salary greater than that of all employee working in other departments
SELECT ENAME
FROM EMPLOYEE
WHERE DEPTNO = 40
AND SALARY > ALL (SELECT SALARY FROM EMPLOYEE WHERE DEPTNO != 40);

-- 5) Find the names of sailors who have reserved both read and green boat 
SELECT DISTINCT s.sname
FROM sailors s
JOIN Reserves r ON s.sid = r.sid
JOIN boats b ON r.bid = b.bid
WHERE b.color IN ('RED', 'GREEN')
GROUP BY s.sname
HAVING COUNT(DISTINCT b.color) = 2;

-- 6) Write a PL/SQL program to find the biggest of 3 numbers
DECLARE
    num1 NUMBER := 10; -- Change the values of num1, num2, and num3 as needed
    num2 NUMBER := 20;
    num3 NUMBER := 15;
    biggest NUMBER;
BEGIN
    IF num1 >= num2 AND num1 >= num3 THEN
        biggest := num1;
    ELSIF num2 >= num1 AND num2 >= num3 THEN
        biggest := num2;
    ELSE
        biggest := num3;
    END IF;

    DBMS_OUTPUT.PUT_LINE('The biggest number is: ' || biggest);
END;
/




-- SET - 8

-- 1) Discuss these functions with Example SQL Queries   a) SUBSTR()   b) LTRIM()
-- Description: The SUBSTR function in SQL extracts a substring from a string.
SELECT SUBSTR('Hello World', 7) AS substring_text FROM DUAL;
-- Description: The LTRIM function in SQL removes leading spaces from a string.
SELECT LTRIM('   Hello World   ') AS trimmed_text FROM DUAL;





-- 2) Display the average salary drawn by MANAGERS
SELECT AVG(SALARY) AS average_salary
FROM EMPLOYEE e
JOIN JOB j ON e.JOB = j.JCODE
WHERE j.NAME = 'MANAGER';

-- 3) Display the names of the employees who earn highest salary in their respective departments
SELECT e.ENAME
FROM EMPLOYEE e
WHERE (e.DEPTNO, e.SALARY) IN (
    SELECT DEPTNO, MAX(SALARY)
    FROM EMPLOYEE
    GROUP BY DEPTNO
);


-- 4) Display the names of the employees who earn highest salaries in their repective job groups
SELECT e.ENAME
FROM EMPLOYEE e
WHERE (e.JOB, e.SALARY) IN (
    SELECT JOB, MAX(SALARY)
    FROM EMPLOYEE
    GROUP BY JOB
);

-- 5) Find the sids of sailors witha age over 20 who have not reserved a red boat 
SELECT sid
FROM sailors
WHERE age > 20
AND sid NOT IN (
    SELECT r.sid
    FROM Reserves r
    JOIN boats b ON r.bid = b.bid
    WHERE b.color = 'RED'
);

-- 6) Write a PL/SQL program to find a sum of 1 to n number 
DECLARE
    n NUMBER := 10; -- Change the value of n as needed
    sum NUMBER := 0;
BEGIN
    FOR i IN 1..n LOOP
        sum := sum + i;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('The sum of numbers from 1 to ' || n || ' is: ' || sum);
END;
/



-- SET - 9 

-- 1) Discuss these functions with Example SQL Queries      a) TO_DATE()       b) LENGTH()

-- Description: The TO_DATE function in SQL converts a string into a date value.
SELECT TO_DATE('2022-12-31', 'YYYY-MM-DD') AS converted_date FROM DUAL;

-- Description: The LENGTH function in SQL returns the length of a string in characters.
SELECT LENGTH('Hello World') AS string_length FROM DUAL;


-- 2) Display the employee no,salary and total salary for all the employees
SELECT EMPNO, SALARY, 
       (SELECT SUM(SALARY) FROM EMPLOYEE) AS total_salary
FROM EMPLOYEE;

-- 3) Display the employee names who are working in 'Operations' department 
SELECT e.ENAME
FROM EMPLOYEE e
JOIN DEPT d ON e.DEPTNO = d.DEPTNO
WHERE d.NAME = 'OPERATIONS';

-- 4) Display the employee number and name for employee working as clerk and earning  highest salary among clerks
SELECT EMPNO, ENAME
FROM EMPLOYEE
WHERE JOB = (SELECT JCODE FROM JOB WHERE NAME = 'CLERK')
AND SALARY = (SELECT MAX(SALARY) FROM EMPLOYEE WHERE JOB = (SELECT JCODE FROM JOB WHERE NAME = 'CLERK'));

-- 5) FInd the colors of boat reserved by a sailor named Lubber
SELECT DISTINCT b.color
FROM sailors s
JOIN Reserves r ON s.sid = r.sid
JOIN boats b ON r.bid = b.bid
WHERE s.sname = 'Lubber';

-- 6) Write PL/SQL code to find Fatorial of a given number 
DECLARE
    num NUMBER := 5; -- Change the value of num to calculate factorial for a different number
    factorial_result NUMBER := 1;
BEGIN
    IF num < 0 THEN
        DBMS_OUTPUT.PUT_LINE('Factorial is not defined for negative numbers.');
    ELSE
        FOR i IN 1..num LOOP
            factorial_result := factorial_result * i;
        END LOOP;
        
        DBMS_OUTPUT.PUT_LINE('Factorial of ' || num || ' is: ' || factorial_result);
    END IF;
END;
/



-- SET - 10 

-- 1) Discuss these functions with Example SQL Queries      a) TRANSLATE()    b) TO_CHAR()
-- Description: The TRANSLATE function in SQL replaces a set of characters in a string with another set of characters.
SELECT TRANSLATE('hello world', 'aeiou', '12345') AS translated_text FROM DUAL;

-- Description: The TO_CHAR function in SQL converts a numeric, date, or timestamp value into a string.
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') AS formatted_date FROM DUAL;


-- 2) Display the names of all the employee whose job code is 667
SELECT ENAME
FROM EMPLOYEE
WHERE JOB = 667;

-- 3) Display the names of employees whose name starts with alphabet S
SELECT ENAME
FROM EMPLOYEE
WHERE ENAME LIKE 'S%';

-- 4) Display the name sof employee whose job role is 'Staff' and earns salary more than the highest salary of any 'Clerk'
SELECT ENAME
FROM EMPLOYEE
WHERE JOB = (SELECT JCODE FROM JOB WHERE NAME = 'Staff')
AND SALARY > (SELECT MAX(SALARY) FROM EMPLOYEE WHERE JOB = (SELECT JCODE FROM JOB WHERE NAME = 'Clerk'));
 
-- 5) FInd the names of sailors who have reserved all boats called Interlake
SELECT s.sname
FROM sailors s
WHERE NOT EXISTS (
    SELECT b.bid
    FROM boats b
    WHERE b.bname = 'Interlake'
    AND NOT EXISTS (
        SELECT 1
        FROM Reserves r
        WHERE r.bid = b.bid
        AND r.sid = s.sid
    )
);

-- 6) Write PL/SQL program to find out the reverse of a given number 
DECLARE
    num NUMBER := 12345; -- Change the value of num to find reverse for a different number
    reversed_num NUMBER := 0;
    remainder NUMBER;
BEGIN
    WHILE num > 0 LOOP
        remainder := MOD(num, 10);
        reversed_num := reversed_num * 10 + remainder;
        num := TRUNC(num / 10);
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('Reverse of ' || num || ' is: ' || reversed_num);
END;
/










select * from job;
select * from sailors;
select * from reserves;
select * from boats; 
select * from employee;
select * from dept;
select * from location;














 
 
 
 










