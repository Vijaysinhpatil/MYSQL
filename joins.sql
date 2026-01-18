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


-- exclusive join
select *
from customer_details as a
left join order_details as b
on a.cust_id = b.cust_id
where b.cust_id is null;

-- exclusive join
select * 
from customer_details as a
right join order_details as b
on a.cust_id = b.cust_id
where a.cust_id is null;

-- subqueries
SELECT * FROM 
order_details 
where amount > (
    select avg(amount)
    from order_details
);
-- subqueries with select

select name,
(
    select count(*)
    from order_details o
    where o.cust_id = c.cust_id
) as order_count
from customer_details c;

-- subquery with from
select  
      summary.cust_id , 
      summary.avg_amount
from
	(
	   select 
             cust_id , 
             avg(amount) as avg_amount
	   from order_details
	   group by cust_id
	) as summary;

-- creating a view

create view view1 as
select cust_id , name from customer_details;

select * from view1;

create view view2 as
select c.cust_id , c.name , o.order_id
from customer_details c
inner join order_details o 
on c.cust_id = o.cust_id;

select * from view2;

drop view view1;
