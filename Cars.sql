create database Cars;
use Cars;

-- Read Data. 
select * from cars.`car dekho`;


-- Total cars: To get a count of total records.
select count(*) from cars.`car dekho`;


-- The manager ask the employee how many cars will b availabe in 2023?
select count(*) from cars.`car dekho` where year=2023;



-- The manager ask the employee how many cars will b availabe in 2020, 2021, 2022?
select count(*) from cars.`car dekho` where year in (2020, 2021, 2022) group by year;



-- Client asked me to print the total of all cars by year I dont see all the details.
select year, count(*) from cars.`car dekho` group by year;




-- Client asked to car dealer agent how many deisel cars will there be in 2020?
select count(*) from cars.`car dekho` where year = 2020 and fuel = "Diesel";




-- client requested a car dealer agent how many petrols cars will be there in 2020?
select count(*) from cars.`car dekho` where year = 2020 and fuel = "Petrol";




-- The manager told the employee to give a print all the fuel cars (Petrol, CNG, Diesel) come by all year.
select year, count(*) from cars.`car dekho` where fuel = "Petrol" group by year;
select year, count(*) from cars.`car dekho` where fuel = "Diesel" group by year;
select year, count(*) from cars.`car dekho` where fuel = "CNG" group by year;



-- Manager said there were more than 100 cars in a given year, which year had more than 100 cars?
select year, count(*) from cars.`car dekho` group by year having count(*)>100; 





-- The manager said to the employee all cars count details between 2015 and 2023 we need a complete list.
select count(*) from cars.`car dekho` where year between 2015 and 2023;




-- The manager said to the employee all cars details between 2015 to 2023 we need complete list.
select * from cars.`car dekho` where year between 2015 and 2023;