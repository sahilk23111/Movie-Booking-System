CREATE DATABASE MovieTicketBooking;
USE MovieTicketBooking; -- Switch to the newly created database
CREATE TABLE Movies (
    MovieID INT PRIMARY KEY AUTO_INCREMENT,  -- Unique ID for each movie
    Title VARCHAR(100) NOT NULL,             -- Movie title
    Genre VARCHAR(50) NOT NULL,              -- Genre of the movie
    Duration INT NOT NULL,                    -- Duration in minutes
    ReleaseDate DATE NOT NULL                 -- Release date
);
CREATE TABLE Shows (
    ShowID INT PRIMARY KEY AUTO_INCREMENT,     -- Unique ID for each show
    MovieID INT NOT NULL,                      -- Foreign key to Movies table
    ShowTime TIME NOT NULL,                    -- Show start time
    ShowDate DATE NOT NULL,                    -- Date of the show
    TicketPrice DECIMAL(10, 2) NOT NULL,      -- Price of the ticket
    CONSTRAINT FK_Movie FOREIGN KEY (MovieID) 
        REFERENCES Movies(MovieID) ON DELETE CASCADE
);
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,  -- Unique ID for each customer
    Name VARCHAR(100) NOT NULL,                 -- Customer name
    Email VARCHAR(100) NOT NULL UNIQUE,         -- Customer email (unique)
    PhoneNumber VARCHAR(15) NOT NULL            -- Customer phone number
);
CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY AUTO_INCREMENT,     -- Unique ID for each booking
    CustomerID INT NOT NULL,                      -- Foreign key to Customers table
    ShowID INT NOT NULL,                          -- Foreign key to Shows table
    BookingDate DATETIME DEFAULT CURRENT_TIMESTAMP, -- Date and time of booking
    SeatsBooked INT NOT NULL,                     -- Number of seats booked
    CONSTRAINT FK_Customer FOREIGN KEY (CustomerID) 
        REFERENCES Customers(CustomerID) ON DELETE CASCADE,  
    CONSTRAINT FK_Show FOREIGN KEY (ShowID) 
        REFERENCES Shows(ShowID) ON DELETE CASCADE
);
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,      -- Unique ID for each payment
    BookingID INT NOT NULL,                        -- Foreign key to Bookings table
    Amount DECIMAL(10, 2) NOT NULL,               -- Amount paid
    PaymentDate DATETIME DEFAULT CURRENT_TIMESTAMP, -- Date and time of payment
    PaymentMode VARCHAR(20) NOT NULL,             -- Mode of payment (e.g., cash, credit)
    CONSTRAINT FK_Booking FOREIGN KEY (BookingID) 
        REFERENCES Bookings(BookingID) ON DELETE CASCADE
);
INSERT INTO Movies (Title, Genre, Duration, ReleaseDate) 
VALUES 
('Inception', 'Sci-Fi', 148, '2010-07-16'),
('The Dark Knight', 'Action', 152, '2008-07-18'),
('Interstellar', 'Sci-Fi', 169, '2014-11-07');
INSERT INTO Shows (MovieID, ShowTime, ShowDate, TicketPrice) 
VALUES 
(1, '14:30:00', '2024-10-31', 300.00),
(2, '18:00:00', '2024-10-31', 350.00),
(3, '20:45:00', '2024-10-31', 400.00);
INSERT INTO Customers (Name, Email, PhoneNumber) 
VALUES 
('Alice Johnson', 'alice@example.com', '9876543210'),
('Bob Smith', 'bob@example.com', '9876543211'),
('Charlie Brown', 'charlie@example.com', '9876543212');
INSERT INTO Bookings (CustomerID, ShowID, SeatsBooked) 
VALUES 
(1, 1, 2),  -- Alice books 2 seats for 'Inception'
(2, 2, 3),  -- Bob books 3 seats for 'The Dark Knight'
(3, 3, 1);  -- Charlie books 1 seat for 'Interstellar'
INSERT INTO Payments (BookingID, Amount, PaymentMode) 
VALUES 
(1, 600.00, 'Credit Card'),  -- Payment for Alice's booking
(2, 1050.00, 'UPI'),         -- Payment for Bob's booking
(3, 400.00, 'Cash');          -- Payment for Charlie's booking
SELECT * FROM Movies;
SELECT * FROM Shows;
SELECT * FROM Customers;
SELECT * FROM Payments;
SET FOREIGN_KEY_CHECKS = 0;
-- Insert your data here
SET FOREIGN_KEY_CHECKS = 1;











