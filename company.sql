 
 create database CompanyDB
 ------------------------------
 create schema sales
  ----------------------------
  create table sales.employees(
  employeeID int primary key identity(1,1),
  FirstName varchar(30),
  LastName varchar(30),
  salary decimal)
  -------------------------------------
  alter table sales.employees add hire_date datetime
  ---------------------------
  -----•Select all columns from the "employees" table.
  select * from sales.employees
  ----•	Retrieve only the "first_name" and "last_name" columns from the "employees" table.
  select FirstName,LastName from sales.employees
  ---•	Retrieve “full name” as a one column from "first_name" and "last_name" columns from the "employees" table.
  select FirstName+' '+LastName as fullName from sales.employees
  ----------------•	Show the average salary of all employees.
  select avg(salary) from sales.employees
  ----------------•	Select employees whose salary is greater than 50000.
  select * from sales.employees where salary>50000
  ------•	Retrieve employees hired in the year 2020.
  select * from sales.employees where year( hire_date)=  '2020'
  ----------•	List employees whose last names start with 'S.'
  select *  from sales.employees where lastname like 's%'
  ------------•	Display the top 10 highest-paid employees.•	List employees with salaries in descending order
  select top(10)* from sales.employees order by salary desc
  ---•	Find employees with salaries between 40000 and 60000.
  select * from sales.employees where salary between 40000 and 60000
  ---•	Show employees with names containing the substring 'man.'
  select FirstName,LastName   from sales.employees where FirstName like '%man%' or LastName like '%man%'
  --------•	Display employees with a NULL value in the "hire_date" column.
  select  * from sales.employees where hire_date is null
  ---•	Select employees with a salary in the set (40000, 45000, 50000).
  select  * from sales.employees where salary in (40000, 45000, 50000)
  ---•	Retrieve employees hired between '2020-01-01' and '2021-01-01.'
  select  * from sales.employees where hire_date between '2020-01-01' and '2021-01-01.'
  -----•	List employees with salaries in descending order
  select * from sales.employees order by salary desc
  ----•	Show the first 5 employees ordered by "last_name" in ascending order.
  select top(5)* from sales.employees order by lastname asc
  --------------•	Display employees with a salary greater than 55000 and hired in 2020
  select * from sales.employees where salary>55000 and year( hire_date)=  '2020'
  ----•	Select employees whose first name is 'John' or 'Jane'
  select  * from sales.employees where FirstName='John' or  FirstName= 'Jane'
  ---•	List employees with a salary less than or equal to 55000 and a hire date after '2022-01-01.'
  select * from sales.employees where salary<=55000 and  hire_date > '2022-01-01'
  -----•	Retrieve employees with a salary greater than the average salary.
  select * from sales.employees group by salary ,FirstName,lastname,employeeID,hire_date
  having salary> avg(salary)
  ---another way
  select * from sales.employees where salary>(select avg(salary)from sales.employees)
  ------•	Display the 3rd to 7th highest-paid employees.
    select * from sales.employees
	order by salary desc
	OFFSET 2 ROWS 
FETCH NEXT 5 ROWS ONLY;
-----------•	List employees hired after '2021-01-01' in alphabetical order.
select * from sales.employees where hire_date > '2021-01-01'  order by  firstname asc 
--•	Retrieve employees with a salary greater than 50000 and last name not starting with 'A.'
select * from sales.employees where salary>50000 and LastName not like 'A%'
--•	Display employees with a salary that is not NULL.
select * from sales.employees where salary is not null
----•	Show employees with names containing 'e' or 'i' and a salary greater than 45000.
select * from sales.employees where salary>45000 and( FirstName like'%e%'or FirstName like'%i%'  OR LastName LIKE '%e%' OR LastName LIKE '%i%')