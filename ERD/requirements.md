# Entity-Relationship Diagram: Airbnb Database Design

## Objective

This document outlines the entities, attributes, and relationships in the Airbnb-style application database, based on the provided specification. The design ensures data normalization, referential integrity, and scalability.

---

## 🧱 Entities and Attributes

### 1. **User**
Represents all users of the platform, including guests, hosts, and admins.

- `user_id`: UUID, Primary Key, Indexed
- `first_name`: VARCHAR, NOT NULL
- `last_name`: VARCHAR, NOT NULL
- `email`: VARCHAR, UNIQUE, NOT NULL
- `password_hash`: VARCHAR, NOT NULL
- `phone_number`: VARCHAR, Nullable
- `role`: ENUM ('guest', 'host', 'admin'), NOT NULL
- `created_at`: TIMESTAMP, default: `CURRENT_TIMESTAMP`

---

### 2. **Property**
Represents properties listed by hosts for booking.

- `property_id`: UUID, Primary Key, Indexed
- `host_id`: Foreign Key → `User(user_id)`
- `name`: VARCHAR, NOT NULL
- `description`: TEXT, NOT NULL
- `location`: VARCHAR, NOT NULL
- `pricepernight`: DECIMAL, NOT NULL
- `created_at`: TIMESTAMP, default: `CURRENT_TIMESTAMP`
- `updated_at`: TIMESTAMP, auto-updated on row change

---

### 3. **Booking**
Represents a guest booking a property for a specific date range.

- `booking_id`: UUID, Primary Key, Indexed
- `property_id`: Foreign Key → `Property(property_id)`
- `user_id`: Foreign Key → `User(user_id)` (guest)
- `start_date`: DATE, NOT NULL
- `end_date`: DATE, NOT NULL
- `total_price`: DECIMAL, NOT NULL
- `status`: ENUM ('pending', 'confirmed', 'canceled'), NOT NULL
- `created_at`: TIMESTAMP, default: `CURRENT_TIMESTAMP`

---

### 4. **Payment**
Represents payment transactions for bookings.

- `payment_id`: UUID, Primary Key, Indexed
- `booking_id`: Foreign Key → `Booking(booking_id)`
- `amount`: DECIMAL, NOT NULL
- `payment_date`: TIMESTAMP, default: `CURRENT_TIMESTAMP`
- `payment_method`: ENUM ('credit_card', 'paypal', 'stripe'), NOT NULL

---

### 5. **Review**
Represents user-generated reviews on properties.

- `review_id`: UUID, Primary Key, Indexed
- `property_id`: Foreign Key → `Property(property_id)`
- `user_id`: Foreign Key → `User(user_id)` (guest)
- `rating`: INTEGER (1–5), NOT NULL
- `comment`: TEXT, NOT NULL
- `created_at`: TIMESTAMP, default: `CURRENT_TIMESTAMP`

---

### 6. **Message**
Represents private messages between users (host ↔ guest).

- `message_id`: UUID, Primary Key, Indexed
- `sender_id`: Foreign Key → `User(user_id)`
- `recipient_id`: Foreign Key → `User(user_id)`
- `message_body`: TEXT, NOT NULL
- `sent_at`: TIMESTAMP, default: `CURRENT_TIMESTAMP`

---

## 🔗 Relationships Between Entities

| Relationship                              | Type           | Description                                      |
|-------------------------------------------|----------------|--------------------------------------------------|
| User → Property                            | One-to-Many    | A host can list many properties                  |
| User → Booking                             | One-to-Many    | A guest can make many bookings                   |
| Property → Booking                         | One-to-Many    | A property can have multiple bookings            |
| Booking → Payment                          | One-to-One     | Each booking has one payment                     |
| User → Review                              | One-to-Many    | A guest can write multiple reviews               |
| Property → Review                          | One-to-Many    | A property can have many reviews                 |
| User → Message (as sender/recipient)       | Many-to-Many   | Users can send messages to one another           |

---

## 📌 Notes

- UUIDs are used as primary keys for scalability and uniqueness.
- `ENUM`s are used for controlled states (e.g., role, status, payment method).
- Foreign keys ensure referential integrity across related tables.
- Timestamps help in tracking creation and modification activities.

---

## 🖼️ ER Diagram

See the attached ER diagram file `entity_relationship_diagram.drawio.svg` for the visual representation.

