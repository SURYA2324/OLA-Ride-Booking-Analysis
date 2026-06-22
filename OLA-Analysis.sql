use OLA;

select * from bookings;

-- describe bookings;
-- alter table bookings rename column ï»¿Date to Date;

-- 1. Retrieve all successful bookings:
create view Successful_Bookings as
select * from bookings where booking_status = 'Success';
select * from Successful_Bookings;

-- 2. Find the average ride distance for each vehicle type:
create view ride_distance_for_each_vehicle as
select  Vehicle_Type ,avg(ride_distance) as Avg_Distance from bookings group by Vehicle_Type;
select * from ride_distance_for_each_vehicle;

-- 3. Get the total number of cancelled rides by customers:
create view cancelled_rides_customers as
select count(*) from bookings 
where booking_status='cancelled by customer';

select * from cancelled_rides_customers;

-- 4. List the top 5 customers who booked the highest number of rides:
create view Top_5_customers as
select customer_ID,count(Booking_ID) as total_rides
from bookings group by customer_ID
order by total_rides desc limit 5;

select * from top_5_customers;

-- select customer_ID,count(Booking_ID) as total_rides
-- from bookings group by customer_ID order by total_rides desc;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view Rides_cancelled_by_Drivers_P_C_Issues as
select count(*) from bookings 
where cancelled_rides_by_driver='personal & car related issues';

select * from Rides_cancelled_by_Drivers_P_C_Issues;

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view Min_Max_driver_ratings as
select max(driver_ratings) as Max_rating,
Min(driver_ratings) as Min_rating 
from bookings where vehicle_type='Prime Sedan';

select * from min_max_driver_ratings;

-- 7. Retrieve all rides where payment was made using UPI:
create view UPI_Payment as
select * from bookings where payment_method='UPI';

select * from UPI_Payment;

-- 8. Find the average customer rating per vehicle type:
create view avg_cust_rating as 
select vehicle_type,avg(customer_rating) as avg_customer_rating
from bookings
group by vehicle_type;

select * from avg_cust_rating;

-- 9. Calculate the total booking value of rides completed successfully:
create view Total_Successful_value as
select sum(booking_value) as total_successful_value 
from bookings 
where booking_status='success';

select * from Total_Successful_Value;

-- 10. List all incomplete rides along with the reason:
create view Incomplete_Rides_Reason as
select Booking_ID,incomplete_rides_reason from bookings
where Incomplete_Rides='Yes';

select * from Incomplete_Rides_Reason;




