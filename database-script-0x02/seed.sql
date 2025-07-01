INSERT INTO Users(user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES('u1', 'Chinonso', 'Agbo', 'nonsowisdom62@gmail.com', 'hashed_pass_xv1', '08105517862', 'host');

INSERT INTO Users(user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES('u2', 'Favour', 'Dilim', 'favouragbo29@gmail.com', 'hashed_pass_xv2', '081055182768', 'guest');

INSERT INTO Property(property_id, host_id, name, description, location, pricepernight)
VALUES('p1', 'u1', 'Royal Villa', 'A lovely place in Lekki', 'Lekki Lagos', 200000.00);

INSERT INTO Booking(booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES('b1', 'p1', 'u1', '2025-08-05 00:30', '2025-08-12 00:30', 250000.00, 'confirmed');

INSERT INTO Payment(payment_id, booking_id, amount, payment_method)
VALUES('pyt1', 'b1', 250000.00, 'credit_card');

INSERT INTO Review(review_id, user_id, property_id, rating, comment)
VALUES('r1', 'u2', 'p1', 4, 'The place is really nice and homely');

INSERT INTO Message(message_id, sender_id, receiver_id, message_body)
VALUES('m1', 'u1', 'u2', 'Meet me at the lounge by 8pm');