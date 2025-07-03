SELECT 
    Booking.booking_id, 
    Property.property_id,
    Property.name AS property_name,
    Property.description,
    Property.pricepernight,
    Users.first_name AS user_first_name,
    Users.last_name AS user_last_name,
    Booking.start_date,
    Booking.end_date,
    Booking.total_price,
    Booking.status,
    Payment.amount 
FROM Booking
JOIN Users ON Booking.user_id = Users.user_id
JOIN Property ON Booking.property_id = Property.property_id
LEFT JOIN Payment ON Booking.booking_id = Payment.booking_id;


EXPLAIN SELECT
    Booking.booking_id, 
    Property.property_id,
    Property.name AS property_name,
    Property.description,
    Property.pricepernight,
    Users.first_name AS user_first_name,
    Users.last_name AS user_last_name,
    Booking.start_date,
    Booking.end_date,
    Booking.total_price,
    Booking.status,
    Payment.amount 
FROM Booking
JOIN Users ON Booking.user_id = Users.user_id
JOIN Property ON Booking.property_id = Property.property_id
LEFT JOIN Payment ON Booking.booking_id = Payment.booking_id
WHERE Users.user_id = 'u1' AND 
    Booking.booking_id = 'b1' AND 
    Property.property_id = 'p1' AND 
    Payment.payment_id = 'pyt1';


CREATE INDEX idx_booiking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);


SELECT 
    b.booking_id, 
    p.property_id,
    p.name AS property_name,
    p.description,
    p.pricepernight,
    u.first_name AS user_first_name,
    u.last_name AS user_last_name,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    pay.amount 
FROM Booking As b
JOIN Users u ON Booking.user_id = Users.user_id
JOIN Property p ON Booking.property_id = Property.property_id
JOIN Payment pay ON Booking.booking_id = Payment.booking_id;