SELECT Users.user_id, Users.first_name, Users.last_name, COUNT(Booking.booking_id) AS total_bookings
FROM Booking
JOIN Users ON Users.user_id = Booking.user_id
GROUP BY Users.user_id, Users.first_name, Users.last_name;

SELECT property_id, name, total_bookings,
ROW NUMBER() OVER (ORDER BY total_bookings DESC) as row_number
FROM (
    SELECT Property.property_id, Property.name, COUNT(Booking.booking_id) AS total_bookings
    FROM Booking
    JOIN Property ON Booking.property_id = Property.property_id
    GROUP BY Property.property_id, Property.name
) AS bookings_count;
