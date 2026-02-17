-- #Task 1
Create Database AirCargo;
Use AirCargo;

-- #Task 2 ER Diagram Done

-- Task 3
SELECT * FROM passengers_on_flights
WHERE route_id BETWEEN 1 AND 25;

-- Task 4
Select Count(Class_ID) TOTAL_BC_PASSENGERS, Sum(Price_per_Ticket) Total_Price_OF_Tickets
From Ticket_Details
Where Class_ID = "Business";

-- Task 5
Select Customer_ID,
Concat_WS(' ', First_Name, Last_Name) AS Full_NAME,
Date_of_Birth,
Gender
From Customer;

-- Task 6
SELECT c.customer_id, c.first_name, c.last_name,t.p_date, t.aircraft_id,t.class_id 
FROM customer c 
INNER JOIN ticket_details t
ON c.customer_id=t.customer_id;

-- Task 7
select First_Name,last_name from customer
where customer_id in (select customer_id from ticket_details where brand = 'Emirates');

--  Task 8 
SELECT customer_id, first_name, last_name FROM customer
WHERE customer_id IN (SELECT customer_id FROM passengers_on_flights WHERE class_id = 'Economy Plus');

-- Better Approach 
select * from passengers_on_flights
where customer_id in (select distinct customer_id from passengers_on_flights where class_id = 'Economy Plus')
and class_id = 'Economy Plus';

-- Task 9
SELECT 
    IF(SUM(Price_Per_Ticket) > 10000, 
       'Revenue is Greater Than 10000', 
       'Revenue is Lesser Than 10000') AS revenue_status
FROM ticket_details;

-- Task 10
CREATE USER 'abc_123'@'localhost' IDENTIFIED BY 'PASS_123';
-- Grant
Grant Execute ON aircargo.*to 'abc_123'@'localhost';

-- Task 11
select Customer_id, max(Price_per_ticket) over (partition by class_id) as Max_Price from ticket_details;
-- Better
select distinct class_id, max(Price_per_ticket) over (partition by class_id) as Max_Price from ticket_details;

-- Task 12
select * from passengers_on_flights where route_id = 4;
create index idx_route_id on passengers_on_flights(route_id);
select * from passengers_on_flights where route_id = 4;

-- Task 13
Explain select * from passengers_on_flights where route_id = 4;

-- Task 14
Select customer_id, aircraft_id, sum(Price_per_ticket) as Total_Price from ticket_details
Group By customer_id, aircraft_id with rollup;

-- Task 15
create view BusinessClass as select customer_id,class_id,brand from ticket_details
where class_id = 'Business';
Select * From BusinessClass;

-- Task 16
call aircargo.Get_Customers_above_2k();

-- Task 17
select customer_id, sum(no_of_tickets) as total_tickets, sum(Price_per_ticket*no_of_tickets) as total_price from ticket_details
group by customer_id;

-- Task 18
select r.aircraft_id,avg(r.distance_miles) as average_distance,avg(p.total_passengers) as average_passengers from routes r
join
(select route_id, count(distinct customer_id) as total_passengers, count( distinct travel_date) as total_departures 
from passengers_on_flights p
group by route_id
having count( distinct travel_date)>1)as p
on r.route_id=p.route_id
group by r.aircraft_id;



