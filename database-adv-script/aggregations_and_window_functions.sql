SELECT Users.user_id, Users.first_name, Users.last_name, COUNT(Booking.booking_id) AS total_bookings
FROM Booking
JOIN Users ON Users.user_id = Booking.user_id
GROUP BY Users.user_id, Users.first_name, Users.last_name;

SELECT Property.property_id, Property.name, COUNT(Booking.booking_id) AS number_of_bookings,
RANK() OVER (ORDER BY COUNT(Booking.booking_id) DESC) AS rank
FROM Booking
JOIN Property ON Property.property_id = Booking.property_id
GROUP BY Property.property_id, Property.name;
