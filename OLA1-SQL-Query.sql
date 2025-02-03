create database ola1;
USE ola1;

#1 Retrieve all successfull bookings
Create View Successful_Bookings As
	Select * from bookings
	where Booking_Status = "Success";
select * from Successful_Bookings;

#2 Find the avg ride distance of each vehicle type
create view avg_ride_distance_for_each_vehicle as
Select Vehicle_Type, avg(Ride_Distance)
as avg_distance from bookings
group by Vehicle_Type;
select * from avg_ride_distance_for_each_vehicle;

#3 Get the total no. of cancelled rides by customers
Create View Canceled_Bookings As
Select * from bookings
where Booking_Status = "Canceled by Driver";
select * from Canceled_Bookings;

# Count of cancelled rides by customers
create view Canceled_rides as
select count(*) from bookings 
where Booking_Status = "Canceled by Customer";
select * from Canceled_rides;

#4 List the top 5 customers who booked the highest number of rides:
create view top_5_customers as
select Customer_ID, count(Booking_ID) as total_rides
from bookings
group by Customer_ID
order by total_rides desc limit 5;
select * from top_5_customers

#5 Get the number of rides cancelled by drivers due to personal and car-related issues:
create view cancelled_by_drivers_personal_car_related_issues as
	select count(*) from bookings
	where Canceled_Rides_by_Driver = "Personal & Car related issue";
select * from cancelled_by_drivers_personal_car_related_issues;

#6  Find the maximum and minimum driver ratings for Prime Sedan bookings
create view Max_min_rating_PrimeSedan as
	select max(Driver_Ratings) as max_rating,
	min(Driver_Ratings) as min_rating 
    from bookings 
	where Vehicle_Type = "Prime Sedan";
Select * from Max_min_rating_PrimeSedan;


#7 . Retrieve all rides where payment was made using UPI
create view Payment_upi as
select * from bookings where Payment_Method = "UPI";
select * from Payment_upi;

#8  Find the average customer rating per vehicle type:
create view avg_customer_rating as
	select Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating
	from bookings
	group by Vehicle_Type;
select * from avg_customer_rating;

#9 Calculate the total booking value of rides completed successfully:
Create View rides_completed_successfully as
	select sum(Booking_Value) as total_success_booking_value
	from bookings 
	where Booking_Status = "Success";
select * from rides_completed_successfully;

#10 List all incomplete rides along with the reason:
create view incomplete_rides_reason as
	Select Booking_ID, Incomplete_Rides_Reason
	from bookings
	where Incomplete_Rides = 'Yes';
select * from incomplete_rides_reason;

# Total incomplete rides 
select count(Incomplete_Rides) as incomplete_ride
from bookings
where Incomplete_Rides = 'Yes';
