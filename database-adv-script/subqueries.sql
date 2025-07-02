SELECT property_id, name FROM Property
WHERE property_id IN (
    SELECT property_id FROM Review
    GROUP BY property_id HAVING AVG(rating) > 4.0
);

SELECT user_id, first_name, last_name FROM Users
WHERE (
    SELECT COUNT(*) FROM Booking WHERE Booking.user_id = Users.user_id
) > 3;