create database test;

use test;

create table addresses (
id int,
house_number int,
city varchar(30),
postcode varchar(30) );

create table people (
id int,
first_name varchar(20),
last_name varchar(20),
address_id int );

create table pets (
id int,
name varchar(20),
species varchar(20),
owner_id int );

show tables;
describe addresses;

alter table addresses add primary key(id);
alter table pets add primary key(id);
alter table people add primary key(id);

alter table people add constraint FK_PeopleAddress foreign key(address_id) references addresses(id);
alter table pets add constraint FK_OwnerId foreign key(owner_id) references people(id);

alter table people add column email varchar(20);

alter table people modify email varchar(25);

alter table people add constraint u_email unique(email);

describe pets;
describe people;
