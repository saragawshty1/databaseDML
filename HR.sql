create database HR
---------------------------------------
 create  table employees(
 Employee_id INT primary key identity(1,1),
 First_name nvarchar(30),
Last_name nvarchar(30),
email varchar(25),
phone_number nvarchar(20),
Hire_date datetime,
jop_id varchar(10),
salary int ,
commession_pct int,
manager_id int ,
Dep_id int 

   )
 ----------------------------------------------------
create  table Regions(
 Region_ID INT PRIMARY KEY identity(1,1),
 Regoin_Name  nvarchar(25),
  
 )
 ------------------------------------------------
create table countries(
 country_id char(2) PRIMARY KEY ,
 country_name  nvarchar(40),
 Region_ID INT,
   
 )
 ----------------------------------------------------
 
 ------------------------------------------------
 create  table Departments(
 Dep_id INT PRIMARY KEY identity(1,1),
 Dep_Name  nvarchar(30),
 manager_id int,
 Location_id int 
  )
  ---------------------------------------------
 create table Locations(
 Location_id INT PRIMARY KEY identity(1,1),
street_address nvarchar(20),
Postal_code nvarchar(12),
city nvarchar(30),
state_province varchar(12),
country_id char(2)
)
 -------------------------------------------
 create  table jops (
 jop_id varchar(10) primary key  ,
 jop_title varchar(35),
Min_Salary int,
Max_Salary int
   
 )
 --------------------------
 create  table jop_grades(
Grade_level varchar(2) primary key ,
Lowest_Sal int ,
Highest_Sal int 
  )
  --------------------------------------------------
  create  table jop_History(
 Employee_id int    ,
 start_date datetime   ,
 end_date datetime ,
 jop_id varchar(10),
 Dep_id int,
 primary key(Employee_id ,start_date)
   )
   ----------------------------------
   
 ------------------------------------------

alter table jop_History ADD CONSTRAINT  emp_his FOREIGN KEY  (Employee_id)
REFERENCES  employees(Employee_id)

alter table employees  ADD CONSTRAINT emp_dep FOREIGN KEY  (Dep_id)
REFERENCES departments(Dep_id)

alter table jop_History ADD CONSTRAINT  dep_his FOREIGN KEY  (Dep_id)
REFERENCES  departments(Dep_id)


alter table countries  ADD CONSTRAINT con_reg FOREIGN KEY  (Region_ID)
REFERENCES Regions(Region_ID)

alter table  locations  ADD CONSTRAINT loc_coun FOREIGN KEY  (country_id)
REFERENCES countries(country_id)

alter table departments  ADD CONSTRAINT dep_loc FOREIGN KEY ( location_id)
REFERENCES locations(location_id)

alter table employees ADD CONSTRAINT emp_jops FOREIGN KEY  (jop_id)
REFERENCES jops(jop_id)

alter table  jop_history  ADD CONSTRAINT jop_his FOREIGN KEY  (jop_id)
REFERENCES jops(jop_id)