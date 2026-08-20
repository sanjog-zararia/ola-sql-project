# OLA Data Analyst Project — SQL

SQL analysis on a simulated OLA ride-booking dataset (Bengaluru city, 1 month, ~25,000 rows, 62% successful booking rate).

## Dataset Columns
Date, Time, Booking_ID, Booking_Status, Customer_ID, Vehicle_Type, Pickup_Location, Drop_Location, V_TAT, C_TAT, cancelled_Rides_by_Customer, cancelled_Rides_by_Driver, Incomplete_Rides, Incomplete_Rides_Reason, Booking_Value, Payment_Method, Ride_Distance, Driver_Ratings, Customer_Rating

## Business Questions Answered
1. Retrieve all successful bookings
2. Average ride distance per vehicle type
3. Total rides cancelled by customers
4. Top 5 customers by ride count
5. Rides cancelled by drivers (personal & car-related issues)
6. Max/min driver ratings for Prime Sedan
7. All rides paid via UPI
8. Average customer rating per vehicle type
9. Total booking value of successful rides
10. Incomplete rides with reasons

## File
- `ola_sql_project.sql` — database creation, views for each question, and result queries

## Tech
MySQL (views + aggregate functions: AVG, COUNT, SUM, MAX/MIN, GROUP BY, ORDER BY)
