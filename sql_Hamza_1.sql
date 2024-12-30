create database hamza_sql_1

create table customer_table(
C_id int PRIMARY KEY,
C_name nvarchar(20),
C_address varchar(50),
C_city nvarchar(15)
);

select * from order_table
select * from customer_table


insert into customer_table values(1001,'Hamza','Liaquatabad','Karachi')
insert into customer_table values(1002,'Ali','Nazimabad','Karachi')
insert into customer_table values(1003,'Talal','DHA','Islamabad')
insert into customer_table values(1004,'Rameez','Gulshan','Karachi')
insert into customer_table values(1005,'Abdullah','Liaquatabad','Karachi')
insert into customer_table values(1006,'Anfal','Highway','Lahore')


create table order_table(
Or_id int PRIMARY KEY,
Or_item nvarchar(20),
Or_quantity int,
Or_price money,
C_id int REFERENCES customer_table(C_id)
);

insert into order_table values(101,'Mouse',10,1500,1003)
insert into order_table values(102,'Kayboard',20,1000,1006)
insert into order_table values(103,'Graphic Card',12,10000,1005)
insert into order_table values(104,'HDMI Cable',24,800,1004)
insert into order_table values(105,'DPI Cable',23,1200,1002)
insert into order_table values(106,'Motherboard',8,8000,1001)


--View records using where clause

select * from customer_table
where C_name = 'Hamza'

select * from customer_table
where C_id <= 1005 

select * from order_table
where Or_price between 10000 AND 12000

select * from customer_table
where C_city IN('Karachi')


select * from customer_table
where C_city NOT IN('Karachi')


select * from customer_table
where C_name like 'H___a'

select * from customer_table
where C_name like '%a'


select * from customer_table
where C_name like 'H%%a'


---Group by with all and where
select Or_item, sum (Or_price) as 'Total Price'
from order_table
where Or_item like 'M%' OR Or_item like 'k%'
group by all Or_item

---Truncate table
truncate table order_table
select * from order_table

---Order by clause
select C_name from customer_table
order by C_name desc
select C_name from customer_table
order by C_name asc

---Group by with null
select Or_item, sum(Or_price) as 'Total Ammount'
from order_table
where Or_item IS null
group by all Or_item

select top 3 * from order_table;
select * from order_table
select top 20 percent * from order_table;
select distinct Or_item from order_table;

select * from order_table

select Or_item, sum (Or_price) as Total_price
from order_table
group by Or_item
having Or_item in ('Graphic Card');

select Or_item, sum (Or_price) as Total_price
from order_table
where Or_item in ('Graphic Card')
group by Or_item

select Or_item, sum (Or_price) as Total_price
from order_table
where Or_item in ('Graphic Card', 'Mouse', 'Motherboard')
group by Or_item
having sum(Or_price) >= 1000;



create table personal_table (
PersonID int,
FirstName nvarchar (25),
Gender nvarchar (5),
Age int,
ContactNo int

);

select * from person_table

select * from order_table2



create table person_table(
PersonID int PRIMARY KEY,
FirstName nvarchar(20),
Gender varchar(5),
Age int,
ContactNo int
);

insert into person_table values(1001,'Hamza','Male',20, 0337-8022639)
insert into person_table values(1002,'Ali','Male',21, 0333-5684125)
insert into person_table values(1003,'Anabiii','Female',24, 0321-9854127)
insert into person_table values(1004,'Maha','Female',20, 0315-5424127)
insert into person_table values(1005,'Sabih','Male',19, 0378-52389412)
insert into person_table values(1006,'Bilal','Male',25, 0322-6547231)
insert into person_table values(1007,'Hamza','Male',20, 0322-6521348)
insert into person_table values(1008,'Asad','Male',20, 0322-234578)



create table order_table2(
OrderId int PRIMARY KEY,
OrderNumber nvarchar(20),
PersonID int REFERENCES person_table(PersonID),
OrderPrice money,
);

select * from order_table2

insert into order_table2 values(101,'A21RA',1001,50000)
insert into order_table2 values(102,'BN21RA',1002,5000)
insert into order_table2 values(103,'LA21RA',1005,25000)
insert into order_table2 values(104,'UY21RA',1006,6000)
insert into order_table2 values(105,'RE21RA',1007,450000)
insert into order_table2 values(106,'OP21RA',1008,9000)

---INNER JOIN
select order_table2.OrderId, order_table2.OrderNumber, order_table2.PersonID
from order_table2 INNER JOIN person_table
on order_table2.PersonID = person_table.PersonID

---RIGHT JOIN
SELECT order_table2.OrderId, order_table2.OrderNumber, order_table2.PersonID FROM order_table2 RIGHT JOIN person_table
ON order_table2.PersonID = person_table.PersonID;


---LEFT JOIN
SELECT order_table2.OrderId, order_table2.OrderNumber, order_table2.PersonID FROM order_table2 RIGHT JOIN person_table
ON order_table2.PersonID = person_table.PersonID;


---FULL JOIN
SELECT * 
FROM order_table2
FULL JOIN person_table
ON order_table2.PersonID = person_table.PersonID;

---SELFJOIN
create table Employee_Manager (
Emp_Id int,
Emp_name varchar(25),
Manager_Id int
);
select * from Employee_Manager

insert into Employee_Manager values(1,'Ali',4);
insert into Employee_Manager values(2,'Hamza',3);
insert into Employee_Manager values(3,'Talal',1);
insert into Employee_Manager values(4,'Rameez',5);
insert into Employee_Manager values(5,'Abdullah',2);


select M.Emp_name as Manager,E.Emp_name as Employee from Employee_Manager as E
inner join Employee_Manager as M
on E.Emp_Id = M.Manager_Id;


create table rider_table(
OrderId int PRIMARY KEY,
OrderNumber nvarchar(20),
CustomerId int REFERENCES person_table(PersonID),
OrderPrice money,
);

insert into rider_table values(101,'A21RA',1001,50000)
insert into rider_table values(102,'BN21RA',1002,5000)
insert into rider_table values(103,'LA21RA',1005,25000)
insert into rider_table values(104,'UY21RA',1006,6000)
insert into rider_table values(105,'RE21RA',1007,450000)
insert into rider_table values(106,'OP21RA',1008,9000)

select * from rider_table

SELECT * 
FROM order_table2
FULL JOIN person_table,rider_table
 ON order_table2.PersonID = person_table.PersonID = rider_table.OrderId;


 SELECT *
FROM order_table2 thirdjoin
FULL JOIN person_table p ON thirdjoin.PersonID = p.PersonID
FULL JOIN rider_table r ON thirdjoin.OrderId = r.OrderId;



create procedure rider_data
as
begin
select * from rider_table
end

exec rider_data

create procedure three_table
as
begin
 SELECT *
FROM order_table2 thirdjoin
FULL JOIN person_table p ON thirdjoin.PersonID = p.PersonID
FULL JOIN rider_table r ON thirdjoin.OrderId = r.OrderId;
end

exec three_table

create procedure three_table
as
begin
 SELECT *
FROM order_table2 thirdjoin
FULL JOIN person_table p ON thirdjoin.PersonID = p.PersonID
FULL JOIN rider_table r ON thirdjoin.OrderId = r.OrderId;
end


create procedure person_data(
@name nvarchar(30),
@gender nvarchar (6),
@age int
)
as
begin
select * from person_table
where FirstName = @name
and Gender = @gender and Age = @age
end

exec person_data 'Hamza', 'Male', 20



create trigger tr_db_hamza
on database
for CREATE_TABLE
as
begin
print 'You Have Just Created A New Table :)'
end


create table order_table3(
OrderId int PRIMARY KEY,
OrderNumber nvarchar(20),
PersonID int,
OrderPrice money,
);

create trigger tr_db_hamza1
on database
for CREATE_TABLE
as
begin
Rollback
print 'You are not allowed to createa a table :)'
end

create table order_table5(
OrderId int PRIMARY KEY,
OrderNumber nvarchar(20),
PersonID int,
OrderPrice money,
);


disable trigger tr_db_hamza1 on all server



---------------------------------------------------------------------------------------------------------------

create table journals
(
title_id varchar (10),
title varchar(20),
type varchar(20),
price int)

select * from journals

insert into journals values('J1', 'Tech Journal', 'technology', 100)
insert into journals values('J2', 'Oracle Magazine', 'technology', 100)
insert into journals values('J3', 'Open Source Training', 'technology', 200)
insert into journals values('J3', 'Open Source Training', 'technology', 200)

delete from journals
create table books(
title_id varchar(10),
title varchar(20),
genre varchar(20),
edition int
)

insert into books values('A101', 'The Ice Storm', 'finction', 1)
insert into books values('A102', 'Pride and Prejudice', 'finction', 1)
insert into books values('A107', 'World Famous M....', 'compilation', 1)
insert into books values('A110', 'Blink', 'business', 2)

delete from books
select * from books
select * from journals

--------------------UNION--NO REPETITION OF DATA IN UNION-----------------------------
select title_id,title from journals
union
select title_id,title from books
create table publications(

title_id varchar(10),
title varchar(20),
genre varchar(20),
edition int
)

insert into publications values('A101','The Ice Storm', 'finction',1)
insert into publications values('A109','Ema', 'finction',1)
insert into publications values('A107','World Famous M....', 'compilation',1)
insert into publications values('A112','The Power Of Now', 'business',2)

select * from publications

-------------------UNION ALL----GETGET ALL UNCOMMON AND COMMON ROWS IN UNOION ALL-----------------------------------------------------------------
select title_id,title from books
union all
select title_id,title from publications

select * from books
select * from publications


-------------------INTERSECT-----TO GET COMMON ROWS IN BOTH TABLES---------------------------------------------------------------------------------------------------------------
select title_id,title from books
intersect
select title_id,title from publications

-------------------EXCEPT-----TO GET UNCOMMON ROWS FROM BOTH TABLES---------------------------------------------------------------------------------------------------------------
select title_id,title from books
except
select title_id,title from publications







---------------------------------------------------------------------------------------------------------------------------------------


create table new_product(
p_id int PRIMARY KEY,
p_name nvarchar(20),
p_address varchar(50),
p_city nvarchar(15),
p_price money
);

select * from new_product
select * from customer_table


insert into new_product values(101,'Mouse','Liaquatabad','Karachi',1500)
insert into new_product values(102,'Motherboard','Nazimabad','Islamabad',12000)
insert into new_product values(103,'Graphic Card','Gulshan','Karachi',60000)
insert into new_product values(104,'Ram','Lyari','Karachi',1200)
insert into new_product values(105,'SSD','DHA','Lahore',7000)
insert into new_product values(106,'Keyboard','Gulistan-e-Johar','Karachi',1000)



create table new_order(
Or_id int PRIMARY KEY,
Or_item nvarchar(20),
Or_quantity int,
Or_price money,
product_id int REFERENCES new_product(p_id)
);

insert into new_order values(01,'Mouse',1,1500,101)
insert into new_order values(02,'Kayboard',2,3000,102)
insert into new_order values(03,'Graphic Card',2,24000,103)
insert into new_order values(04,'SSD',4,7000,104)
insert into new_order values(05,'Ram',3,1200,105)
insert into new_order values(06,'Ram',8,1200,106)



--------------------------------------------------------SUB QUERIES------------------------------------------------------------------------------


select * from new_product
select * from new_order



select * from new_product
where p_id = 
(select p_id from new_product where p_name = 'Mouse')


select * from new_order 
where product_id in
(select p_id from new_product where p_name in ('Ram' , 'Mouse'))

select * from new_order
where exists
(select p_id from new_product where p_id = new_order.product_id and  p_name = 'Mouse')


select * from new_order 
where product_id in
(select p_id from new_product where p_price in (7000 , 12000))



-----------------------------------------------------CREATE VIEW---------------------------------------------------------------------------------
create view new_product_view
as
select p_name, p_address from new_product

select * from new_product_view

-----------------------------------------------------ALTER VIEW---------------------------------------------------------------------------------
alter view new_product_view
as
select * from new_product

select * from new_product_view



-----------------------------------------------------VIEW WITH ENCRYPTION---------------------------------------------------------------------------------

create view p_view_1
with encryption
as
select p_name,p_address,p_city from new_product

select * from p_view_1


exec sp_helptext p_view_1


-----------------------------------------------------VIEW WITH SCHEMABINDING---------------------------------------------------------------------------------

create view p_view
with schemabinding
as select p_name,p_price from dbo.new_product

select * from p_view

---To view defincation of view
----METHOD 1

exec sp_helptext new_product_view

---Method 2
select definition from sys.sql_modules
where object_id=object_id('new_product_view')

---Method 3
select object_definition(object_id('new_product_view'))as defn

select * from new_product_view

DELETE FROM new_product_view WHERE p_id = 105;


------------INSERT WITH VIEW--------------------------
INSERT INTO new_product(p_id, p_name, p_price)
VALUES (10, 'Monitor', 5000);



CREATE VIEW simple_view AS
SELECT p_id, p_name, p_price
FROM new_product;

INSERT INTO simple_view (p_id, p_name, p_price)
VALUES (108, 'New Product', 50);



select * from new_product




-----------UPDATE WITH VIEW------------------------

UPDATE simple_view
SET p_price = 55.00
WHERE p_id = 108;


----------------DELETE WITH VIEW--------------------
DELETE FROM simple_view
WHERE p_id = 107;








-------------------------------------------------------------------------------------------------------------------------------------

create table FullTimeEmployees (
id int,
name varchar (50),
gender varchar (50),
designation varchar (50),
salary money
);

insert into FullTimeEmployees values(1,'Hamza','Male','Manager',55000);
insert into FullTimeEmployees values(2,'Rameez','Male','Assistant',15000);
insert into FullTimeEmployees values(3,'Taimoor','Male','Accountant',15000);
insert into FullTimeEmployees values(4,'Ali','Male','Operator',15000);
insert into FullTimeEmployees values(5,'Talal','Male','Director',35000);
insert into FullTimeEmployees values(6,'Anabii','Female','Assistant',25000);
insert into FullTimeEmployees values(1,'Taimoor','Male','Manager',25000);


select * from FullTimeEmployees


create index IX_FTE_Salary
on FullTimeEmployees (salary asc);

select * from FullTimeEmployees
where salary > 10000 and salary < 22000;

sp_helpindex FullTimeEmployees;

drop index FullTImeEmployees.IX_FTE_Salary;


------------------------------------------------------------------------------------------------------------------------------------

create clustered index CTX_FTE_ID
on FullTimeEmployees (Id Asc);

create nonclustered index NTX_FTE_NAME
on FullTimeEmployees (name Asc);

create nonclustered index NTX_FTE_GENDER_SALARY
on FullTimeEmployees (gender asc, salary asc);


exec sp_rename NTX_FTE_NAME,new_name ;

create unique index CTX_FTE_UNIQUE
on FullTimeEmployees (Id Asc);


------------------------------------------------------------------------------------------------------------------------------------

begin try 
select * from FullTimeEmployees
where salary > 10000 and salary < 22000;
end try
begin catch
print 'Error Found Fix The Error'
end catch

begin try 
select * from FullTimeEmployees
where salary > 10000 and salary < 22000;
end try
begin catch
select ERROR_LINE()
select ERROR_MESSAGE()
select ERROR_NUMBER()
select ERROR_PROCEDURE()
select ERROR_SEVERITY()
select ERROR_STATE()
end catch



create procedure p_1
as
begin try 
select 10 / 0
end try
begin catch
select ERROR_LINE()
select ERROR_MESSAGE()
select ERROR_NUMBER()
select ERROR_PROCEDURE()
select ERROR_SEVERITY()
select ERROR_STATE()
end catch


begin try
select 10 / 0
end try
begin catch
exec p_1
end catch
------------------------------------------------TCL (TRANSFER CONTROL LANGUAGE)---------------------------------------------------------------------------------------

begin transaction
select M.Emp_name as Manager,E.Emp_name as Employee from Employee_Manager as E
inner join Employee_Manager as M
on E.Emp_Id = M.Manager_Id;
commit transaction
select * from order_table2