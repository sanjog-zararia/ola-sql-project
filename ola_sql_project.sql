-- =========================================================
-- OLA Data Analyst Project - SQL Work
-- =========================================================

CREATE DATABASE Ola;
USE Ola;

-- Note: Assumes a table named `bookings` already exists/loaded
-- with columns matching the OLA dataset (Date, Time, Booking_ID,
-- Booking_Status, Customer_ID, Vehicle_Type, Pickup_Location,
-- Drop_Location, V_TAT, C_TAT, cancelled_Rides_by_Customer,
-- cancelled_Rides_by_Driver, Incomplete_Rides,
-- Incomplete_Rides_Reason, Booking_Value, Payment_Method,
-- Ride_Distance, Driver_Ratings, Customer_Rating)

-- =========================================================
-- 1. Retrieve all successful bookings
-- =========================================================
CREATE VIEW Successful_Bookings AS
SELECT * FROM bookings
WHERE Booking_Status = 'Success';

-- =========================================================
-- 2. Average ride distance for each vehicle type
-- =========================================================
CREATE VIEW ride_distance_for_each_vehicle AS
SELECT Vehicle_Type, AVG(Ride_Distance) AS avg_distance
FROM bookings
GROUP BY Vehicle_Type;

-- =========================================================
-- 3. Total number of cancelled rides by customers
-- =========================================================
CREATE VIEW cancelled_rides_by_customers AS
SELECT COUNT(*) AS total_cancelled_by_customer
FROM bookings
WHERE Booking_Status = 'cancelled by Customer';

-- =========================================================
-- 4. Top 5 customers who booked the highest number of rides
-- =========================================================
CREATE VIEW Top_5_Customers AS
SELECT Customer_ID, COUNT(Booking_ID) AS total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC
LIMIT 5;

-- =========================================================
-- 5. Rides cancelled by drivers - personal & car-related issues
-- =========================================================
CREATE VIEW Rides_cancelled_by_Drivers_P_C_Issues AS
SELECT COUNT(*) AS total_cancelled
FROM bookings
WHERE cancelled_Rides_by_Driver = 'Personal & Car related issue';

-- =========================================================
-- 6. Max and min driver ratings for Prime Sedan bookings
-- =========================================================
CREATE VIEW Max_Min_Driver_Rating AS
SELECT MAX(Driver_Ratings) AS max_rating, MIN(Driver_Ratings) AS min_rating
FROM bookings
WHERE Vehicle_Type = 'Prime Sedan';

-- =========================================================
-- 7. All rides paid via UPI
-- =========================================================
CREATE VIEW UPI_Payment AS
SELECT * FROM bookings
WHERE Payment_Method = 'UPI';

-- =========================================================
-- 8. Average customer rating per vehicle type
-- =========================================================
CREATE VIEW AVG_Cust_Rating AS
SELECT Vehicle_Type, AVG(Customer_Rating) AS avg_customer_rating
FROM bookings
GROUP BY Vehicle_Type;

-- =========================================================
-- 9. Total booking value of successfully completed rides
-- =========================================================
CREATE VIEW total_successful_ride_value AS
SELECT SUM(Booking_Value) AS total_successful_ride_value
FROM bookings
WHERE Booking_Status = 'Success';

-- =========================================================
-- 10. Incomplete rides with reason
-- =========================================================
CREATE VIEW Incomplete_Rides_Reason AS
SELECT Booking_ID, Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides = 'Yes';

-- =========================================================
-- Retrieve all results
-- =========================================================
SELECT * FROM Successful_Bookings;
SELECT * FROM ride_distance_for_each_vehicle;
SELECT * FROM cancelled_rides_by_customers;
SELECT * FROM Top_5_Customers;
SELECT * FROM Rides_cancelled_by_Drivers_P_C_Issues;
SELECT * FROM Max_Min_Driver_Rating;
SELECT * FROM UPI_Payment;
SELECT * FROM AVG_Cust_Rating;
SELECT * FROM total_successful_ride_value;
SELECT * FROM Incomplete_Rides_Reason;
