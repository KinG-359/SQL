create database Pizza;

use Pizza;
create table Orders(Order_ID int not null, Order_date date not null, Order_time time not null, primary key (Order_ID) );
select * from Orders;


create table Orders_details(Order_detail_ID int not null, Order_ID int not null, Pizza_ID text not null, Quantity int not null, primary key (Order_detail_ID) );

select*from Orders_details;
select * from pizza_types;


-- Retrieve the total number of order placed.
select* from orders;
select count(order_id) as total_order from orders;


-- Calculate the total revenue generate from pizza sales.
select * from orders_details;
select * from pizzas;
select round(sum(orders_details.Quantity * pizzas.price),2) as Total_revenue 
from orders_details join pizzas on orders_details.pizza_id=pizzas.pizza_id;


-- Identify the highest priced pizza. 
select*from pizzas;
select max(price) from pizzas;

select * from pizza_types;
select pizza_types.name, pizzas.price from pizza_types 
join pizzas on pizza_types.pizza_type_id = pizzas.pizza_type_id
order by pizzas.price desc limit 1;


-- Identify the most common pizza sized orderd. 
select * from orders_details;
select Quantity, count(order_detail_ID) from orders_details group by Quantity;

select* from pizzas;
select* from orders_details;

select pizzas.size, count(orders_details.Order_detail_ID) as order_count
from pizzas 
join orders_details on pizzas.pizza_id = orders_details.pizza_id
group by pizzas.size order by order_count desc;


-- List the top 5 most ordered pizza type along with their quantities.
select* from pizzas;
select * from pizza_types;
select * from orders_details;
select pizza_types.name, sum(orders_details.Quantity) as QTY from pizza_types 
join pizzas on pizza_types.pizza_type_id = pizzas.pizza_type_id
join orders_details
on orders_details.Pizza_ID = pizzas.pizza_id
group by pizza_types.name order by QTY desc limit 5;



-- Join the necessary tables to find the total quantity of each pizza category orderd.
select pizza_types.category, sum(orders_details.Quantity) as quantity from pizza_types
join pizzas on pizza_types.pizza_type_id = pizzas.pizza_type_id
join orders_details on pizzas.pizza_id = orders_details.Pizza_ID
group by pizza_types.category order by quantity desc;



-- Determine the distribution of orders by hour of the day.
select hour(Order_time) HR, count(order_id) from orders
group by HR;



-- Join the relevant tables to find the category wise distribution of pizzas.
select category, count(name) from pizza_types
group by category;



-- Group the order by date and calculate the average number of pizza ordered per day.
select* from orders;
select round(avg(QTY),0) from
(select orders.Order_Date, sum(orders_details.Quantity) as QTY from orders
join orders_details on orders.Order_ID = orders_details.Order_ID
group by orders.Order_Date) as Order_qty;



-- Determine the top 3 most orderd pizza types based on revenue.
select* from orders_details;
select * from pizzas;
select pizza_types.name, 
sum(orders_details.Quantity * pizzas.price) as revenue from pizza_types
join pizzas on pizzas.pizza_type_id = pizza_types.pizza_type_id
join orders_details on pizzas.pizza_id = orders_details.Pizza_ID
group by pizza_types.name order by revenue desc limit 3; 




-- Calculate the percentage contribution of each pizza type to total revenue.
select pizza_types.category, 
round(sum(orders_details.Quantity*pizzas.price) / (select 
round(sum(orders_details.Quantity*pizzas.price),2) as total_revenue
from orders_details
join pizzas on pizzas.pizza_id=orders_details.Pizza_ID)*100,2) as revenue
from pizza_types join pizzas on pizzas.pizza_type_id = pizza_types.pizza_type_id
join orders_details on pizzas.pizza_id = orders_details.Pizza_ID
group by pizza_types.category order by revenue desc; 




-- Analyze the cumulative revenue generated over time.
select * from orders;  
select order_date, sum(total_revenue) over (order by order_date) as cum_revenue from
(select orders.Order_Date,
sum(Orders_details.Quantity * pizzas.price) as total_revenue
from orders_details 
join pizzas on orders_details.Pizza_ID = pizzas.pizza_id
join orders on orders.order_id = orders_details.order_id
group by orders.Order_Date) as sales;




-- Determine the top 3 most orderd pizza types based on revenue for each pizza category.
select* from pizzas;
select name, revenue from
(select category, name, revenue,
rank() over(partition by category order by revenue desc) as rn
from
(select pizza_types.category, pizza_types.name,
sum(orders_details.Quantity*pizzas.price) as revenue
from pizza_types
join pizzas on pizzas.pizza_type_id = pizza_types.pizza_type_id
join orders_details on pizzas.pizza_id = orders_details.Pizza_ID
group by pizza_types.category, pizza_types.name) as A) as B
where rn <=3; 
