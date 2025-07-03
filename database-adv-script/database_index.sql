EXPLAIN ANALYZE SELECT * FROM Booking WHERE user_id='u1';

CREATE INDEX idx_user_email ON Users(email);

CREATE INDEX idx_property_host_id ON Property(host_id);

CREATE INDEX idx_booking_property_id ON Booking(property_id);

CREATE INDEX idx_booiking_user_id ON Booking(user_id);

EXPLAIN ANALYZE SELECT * FROM Booking WHERE user_id='u1';