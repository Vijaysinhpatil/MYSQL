create database store;
use store;

-- creating tables for customers and orders

create table customer_details(
    cust_id int primary key,
    name varchar(30),
    city varchar(30)
);

insert into customer_details
(cust_id , name , city )
values
(1 , "Alice" , "Mumbai"),
(2 , "Bob" , "Delhi"),
(3 , "Charlie" , "Bangalore"),
(4 , "David" , "Mumbai");

create table order_details(
  order_id int primary key,
  cust_id int,
  amount int
);

insert into order_details
( order_id , cust_id , amount )
values
(101 , 1 , 500),
(102 , 1 , 900),
(103 , 2 , 300),
(104 , 5 , 700);

select * from order_details;
select * from customer_details;

-- inner Joins

select * 
from customer_details
inner join order_details
on customer_details.cust_id = order_details.cust_id;

-- Left join

select * 
from customer_details c
left join order_details o
on c.cust_id = o.cust_id;

-- right join

select *
from customer_details c
right join order_details o
on c.cust_id = o.cust_id;