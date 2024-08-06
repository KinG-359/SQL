
create database Customers;
show databases;
use Customers;


--  Write a SQL query to create a table named ‘Customers’ with the following columns present in it
-- CustomerID, FirstName, LastName, Address, City, PostalCode, Country, and also insert the data as given
-- below in the Customers Table


create table customers (Customer_id int, First_name text, Last_name text, Address varchar(200), City text, Postal_code varchar(200), Country text);
show tables;
describe customers;
select*from customers;
use customers;
show tables;
select * from customers;

insert into customers (Customer_id, First_name, Last_name, Address, City, Postal_code, Country) values (18, 'Harry', 'Potter', '67 Atlanta', 'Nantes', 44000, 'France'),
																										(19, 'Doctor', 'Who', '35 King George', 'London', 'WX36FW', 'UK'),
																										(20, 'James', 'Bond', 'Kirchgasse 6',	'Graz',	8010, 'Australia'),
																										(21, 'Ram', 'Sharma', 'Sector 43', 'Delhi', 5442030, 'India'),
																										(22, 'Shyam', 'Goel', 'Sector 47', 'Chandigarh', 28034, 'India'),
																										(23, 'Raj', 'Rao', 'Sector 50', 'Mumbai',	59000, 'India'),
																										(21, 'Ram', 'Sharma', 'Sector 43', 'Delhi', 5442030, 'India'),
																										(22, 'Shyam', 'Goel', 'Sector 47', 'Chandigarh', 28034, 'India');
                                                                                                        
                                                                                                        
select * from customers;

show tables;

-- Write a SQL query to create a table named ‘Categories’ with the following columns present in it :
-- CategoryID, CategoryName, Description

create table Categories (Category_id int, Category_name text, Description text);
insert into Categories (Category_id, Category_name, Description) values (1, 'Beverages', 'Soft drinks, coffees, teas, beers, and ales'),
																		(2, 'Condiments', 'Sweet and savory sauces, relishes, spreads, and seasonings'),
                                                                        (3, 'Confections','Deserts, candies, and sweet breads'),
                                                                        (4, 'Dairy Products', 'Cheeses'),
                                                                        (5, 'Grains', 'Breads, crackers, pasta, and cereal');
 
select* from Categories;

 -- Write a SQL query to create a table named ‘Payment’ with the following columns present in it :
 -- PaymentID, PaymentType

 create table Payment (Pay_id int, Payment_type text);
 insert into Payment (Pay_id, Payment_type) values (1, 'COD'),
													(2, 'UPI'),
                                                    (3, 'Credit card'),
                                                    (4, 'Debit card');
                                                    
select * from Payment;

--  Write a SQL query to create a table named ‘Orders’ with the following columns present in it : OrderID,
-- CustomerID, OrderDate,ShipperID, Pay_ID

create table orders (Order_id int, Customer_id int, order_date varchar(200), Shipper_id int, Pay_id int);
insert into orders (Order_id, Customer_id, order_date, Shipper_id, Pay_id) values (10248, 18, 1996-07-04, 3, 1),
																				  (10249, 19, 1996-07-05, 1, 2),
                                                                                  (10250, 20, 1996-07-08, 2, 3),
                                                                                  (10251, 21, 1996-07-08, 1, 4),
                                                                                  (10252, 22, 1996-07-09, 2, 1),
                                                                                  (10253, 23, 1996-07-10, 2, 2),
                                                                                  (10254, 18, 1996-07-11, 2, 3),
                                                                                  (10255, 19, 1996-07-12, 3, 4),
                                                                                  (10256, 20, 1996-07-15, 2, 2);
                                                                                  
																				
select * from orders;

 -- Write a SQL query to create a table named ‘Shipper’ with the following columns present in it :
-- ShipperID, ShipperName, Phone

create table Shippers (Shipper_id int, Shipper_name text, Phone int);
insert into Shippers (Shipper_id, Shipper_name, Phone) values (1, 'Speedy express', 5559831),
															  (2, 'United package', 5553199),
                                                              (3, 'Federal shipping', 5559931);
                                                              
													
select * from Shippers;


-- Write a SQL query to create a table named ‘OrderDetails’ with the following columns present in it :
-- OrderDetailsID, OrderID, ProductID, OrderNo, Units

create table Order_details (Order_detail_id int, Order_id int, Product_id int, Units int);
insert into Order_details (Order_detail_id, Order_id, Product_id, Units) values (1, 10248, 1, 12),
																				(2, 10249, 2, 9),
                                                                                (3, 10250, 3, 10),
                                                                                (4, 10251, 4, 6),
                                                                                (5, 10252, 5, 40),
                                                                                (6, 10253, 6, 20),
                                                                                (7, 10254, 7, 0),
                                                                                (8, 10254, 8, 21),
                                                                                (9, 10255, 9, 35),
                                                                                (10, 10255, 10, 25);
                                                                                
select*from Order_details;


-- Write a SQL query to create a table named ‘Product’ with the following columns present in it :
-- ProductID, ProductName, ProductPrice, SupplierID, CategoryID, Units,UnitInStock, DiscountAvailable

create table Product (Product_id int, Product_name text, Supplier_id int, Category_id int, Price int, Units int, Unit_in_stock int, Discount int);
insert into Product(Product_id, Product_name, Supplier_id, Category_id, Price, Units, Unit_in_stock, Discount) values (1, 'Chai', 1, 1, 18, 12, 15, 2),
																										 (2, 'Soft drinks', 1, 1, 19, 9, 25, 3),
                                                                                                         (3, 'Seasonings', 1, 2, 10, 10, 19, 4),
                                                                                                         (4, 'Candies', 2, 3, 22, 6, 100, 5 ),
																											(5, 'Sweet bread', 2, 3, 29, 40, 50, 3),
                                                                                                         (6, 'Cheese', 3, 4, 25, 20, 70, 6),
                                                                                                         (7, 'Pasta', 3, 5, 30, 0, 8, 8),
                                                                                                         (8, 'Cereals', 3, 5, 40, 21, 25, 10),
                                                                                                         (9, 'Coffee', 4, 1, 97, 35, 40, 13),
                                                                                                         (10, 'Savory sauces', 4, 2, 80, 25, 29, 20);
                                                                                                         
select * from Product;


-- Write a SQL query to create a table named ‘Suppliers’ with the following columns present in it:
-- SupplierID, SupplierName, CategoryID, City, PostalCode, Country, Phone, Email, CustomerID

create table Suppliers (Supplier_id int, Supplier_name text, Category_id int, City text, Postal_code varchar(200), Country text, Phone int, Customer_id int);
insert into Suppliers (Supplier_id, Supplier_name, Category_id, City, Postal_code, Country, Phone, Customer_id) values 
(1, 'Rakesh Traders', 1, 'New Mexico', 23145, 'UK', 55522, 18),
(2, 'Sumit Co.', 2, 'New Orieans', 70117, 'USA', 55500, 19),
(3, 'Ramesh and Sons', 3, 'New Jersey', 45372, 'USA', 5544432, 20),
(4, 'Iyer Company', 2, 'New Delhi', 13579, 'India', 657890, 21),
(5, 'Sunrise', 5, 'Navi Mumbai', 87654, 'India', 1234567, 22),
(6, 'Ram Traders', 3, 'Chandigarh', 65432, 'India', 543278, 21),
(7, 'Sohan Co.', 4, 'Jaipur', 12678, 'India', 127845, 21),
(8, 'Mohan and Sons', 1, 'Bhopal', 43521, 'India', 453216, 22),
(9, 'jindal Company', 2, 'California', 67898, 'USA', 6754324, 20),
(10, 'Modi and Company', 4, 'Noida', 23590, 'India', 345678, 18);
                                                                                                     
select * from Suppliers;


-- Write a SQL query to create a table named ‘Employees’ with the following columns present in it:
-- EmployeeID, EmployeeName, and Salary.


create table Employee (Employee_id int, Name text, Department text);
insert into Employee (Employee_id, Name, Department) values (1, 'Rohan', 'HR'),
															(2, 'Mohan', 'Marketing'),
                                                            (3, 'Sohan', 'Sales'),
                                                            (4, 'Rahul', 'Developmemt');

select * from Employee;

show tables;

select* from Employee;

-- Write a SQL query to delete all the data from the Employee Table without deleting the table
-- structure

delete  from Employee;
select* from Employee;


--  Write a SQL query to remove the Employee Table completely.

drop table Employee;


-- Write a SQL statement to change the CustomerID from 18 to 50 in the Customers Table
select* from customers;
update customers set customer_id = 50 where customer_id = 18;  
select* from customers;


-- Write a SQL statement to delete a row that has Units equal to zero in the OrderDetails Table

select * from Order_details;
delete from Order_details where Units = 0;
select* from Order_details;