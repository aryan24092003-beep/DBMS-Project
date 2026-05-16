
---

# Step 3️⃣ Copy This Into `schema.sql`

```sql
CREATE DATABASE ticket_booking_system;

USE ticket_booking_system;

CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE
);

CREATE TABLE Shows (
    show_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_name VARCHAR(100),
    show_time DATETIME
);

CREATE TABLE Seats (
    seat_id INT PRIMARY KEY AUTO_INCREMENT,
    show_id INT,
    status ENUM('AVAILABLE', 'BOOKED') DEFAULT 'AVAILABLE',
    version INT DEFAULT 0,
    FOREIGN KEY (show_id) REFERENCES Shows(show_id)
);

CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    seat_id INT,
    booking_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (seat_id) REFERENCES Seats(seat_id)
);