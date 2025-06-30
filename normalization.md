# Database Normalization to 3NF – Airbnb Clone

## Objective

This document outlines the normalization process applied to the Airbnb database schema. The goal is to ensure that the database design is fully normalized up to **Third Normal Form (3NF)** to eliminate redundancy, prevent anomalies, and improve data integrity.

---

## 🧱 Step 1: First Normal Form (1NF)

**Rule:**  
- All attributes must contain atomic (indivisible) values.
- Each record (row) must be unique.

**✅ Applied:**  
- All columns in the schema contain atomic values (no lists or nested structures).
- Each table has a primary key ensuring uniqueness.
- There are no multivalued or repeating fields.

---

## 🧱 Step 2: Second Normal Form (2NF)

**Rule:**  
- Must be in 1NF.
- All non-key attributes must be **fully functionally dependent** on the entire primary key (not just a part).

**✅ Applied:**  
- All tables either have a single-column primary key (UUIDs), or in the case of many-to-many relationships (like messaging), foreign keys act as compound identifiers in unique indexes.
- No partial dependencies exist. For example:
  - In the `Booking` table, attributes like `start_date`, `end_date`, and `total_price` depend on the full primary key `booking_id`, not a portion of it.

---

## 🧱 Step 3: Third Normal Form (3NF)

**Rule:**  
- Must be in 2NF.
- No **transitive dependencies** — i.e., non-key attributes should depend only on the primary key, not on other non-key attributes.

**✅ Applied:**  
- In `User`, `email`, `phone_number`, etc. depend only on `user_id`.
- In `Property`, `host_id`, `pricepernight`, `location`, etc. depend directly on `property_id`.
- In `Booking`, all columns depend directly on `booking_id`.
- `Payment` and `Review` tables also follow 3NF rules — their attributes only depend on their own primary keys.

---

## 🔄 Normalization Observations

- **Redundancy avoided**: For example, `User` and `Property` are clearly separated; host details are not repeated in `Property` rows.
- **Junction relationships** (like Messaging and Bookings) use foreign keys to avoid repetition.
- **No derived or computed fields** (e.g., `total_price` could be derived but is stored for performance reasons — still acceptable).

---

## 🔧 Optimization Note

All ENUMs (e.g., `role`, `status`, `payment_method`) are controlled and **non-redundant**. No need to normalize them further unless the business logic demands dynamic updates to those values (in which case they could be moved to separate lookup tables).

---

## ✅ Final Verdict

> The current schema is in **Third Normal Form (3NF)**:
- No partial or transitive dependencies
- Each table serves a single logical purpose
- Relationships are defined through foreign keys
- Data is efficiently organized with no unnecessary duplication

No further structural changes are required for normalization purposes.


