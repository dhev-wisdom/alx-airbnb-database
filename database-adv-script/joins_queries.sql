SELECT Booking.booking_id, Users.first_name, Users.last_name
FROM Booking
INNER JOIN Users ON Booking.user_id = Users.user_id;

SELECT Property.property_id, Property.name, Review.comment
FROM Property
LEFT JOIN Review ON Review.property_id = Property.property_id;

SELECT Users.first_name, Users.last_name, Booking.id
FROM Users
FULL OUTER JOIN Booking ON Users.user_id = Booking.user_id;