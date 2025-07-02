SELECT Booking.booking_id, Users.first_name, Users.last_name
FROM Booking
INNER JOIN Users ON Booking.user_id = Users.user_id;

SELECT Property.name, Review.comment
FROM Review
LEFT JOIN Property ON Property.property_id = Review.property_id;

SELECT Users.first_name, Users.last_name, Booking.id
FROM Users
FULL OUTER JOIN Booking ON Users.user_id = Booking.user_id;