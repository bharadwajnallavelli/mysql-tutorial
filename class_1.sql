--- To create database
create database bigdata_db;

--- To list down all databases
show databases;

--- To drop a database
drop database bigdata_db;

--- Select database
use bigdata_db;

--- To create a table
create table if not exists employee (
    id int,
    name varchar(50)
);

--- To list down all tables
show tables;
show create table employee;

--- Drop table
drop table employee;

--- To create a table
create table if not exists employee (
    id int,
    name varchar(50),
    salary double,
    hiring_data date
);

--- Insert data into table
insert into employee values(1,'user1',5000.00,'2022-10-15');
--- Below insert should fail
insert into employee values(2,'user2',4000.00);
insert into employee(id,name,salary) values(2,'user2',4000.00);
--- Insert multiple rows of data
insert into employee values(3,'user3',5000.00,'2022-10-23'),(4,'user4',6000.00,'2022-09-13');

--- Select query
select * from employee;

--- Integrity contraints
create table if not exists employee_with_constraints (
    id int not null,
    name varchar(50) not null,
    salary double,
    hiring_data date default '2021-09-15',
    unique (id),
    check (salary > 1000)
);

--- Insert integrity contant failure
--- Below line should throw error
insert into employee_with_constraints values('user5',5000.00,'2022-01-01');
--- Below insert should throw error
insert into employee_with_constraints values(3,null,3000,'2021-09-15');
--- Insert correct data
insert into employee_with_constraints values(5,'user5',6000.00,'2022-01-01');
--- Below will fail with duplicate id
insert into employee_with_constraints values(5,'user6',7000.00,'2022-01-01');
insert into employee_with_constraints values(6,'user6',7000.00,null);
insert into employee_with_constraints(id,name,salary) values(3,'Mukesh',2400);

--- Integrity contraints with alias name
create table employee_with_constraints_tmp (
    id int not null,
    name varchar(20) not null,
    salary double,
    hiring_data date default '2022-09-15',
    constraint unique_id unique(id),
    constraint salary_check check(salary > 1000)
);

--- Insert data
insert into employee_with_constraints_tmp values(1,'user1',1500);
