USE LittleLemonDB;
SHOW TABLES;

-- Task 1: INSERT statement;
-- Little Lemon wants to populate the Bookings table of their database with some records of data;

INSERT INTO Bookings
VALUES
(1, '2022-10-10', 5, 1, 1),
(2, '2022-11-12', 3, 3, 3),
(3, '2022-10-11', 2, 2, 2),
(4, '2022-10-13', 2, 1, 1);


-- Task 2: Stored Procedure called CheckBooking: to check whether a table in the restaurant is already booked;
-- The procedure should have two input parameters in the form of booking date and table number;
-- You can also create a variable (temp_table) in the procedure to check the status of each table

DELIMITER //

CREATE PROCEDURE CheckBooking (IN booking_date DATE, IN table_number INT)
BEGIN 
DECLARE temp_table INT DEFAULT 0;
SELECT COUNT(temp_table) INTO temp_table
	FROM Bookings WHERE BookingDate = booking_date AND TableNumber = table_number;
    IF temp_table > 0
		THEN SELECT CONCAT('Table', table_number, 'is already booked') AS 'Booking Status';
    ELSE SELECT CONCAT ('Table', table_number, 'is already booked') AS 'Booking Status';
    END IF;
END
END 
DELIMITER ;

CALL CheckBooking('2022-11-12', 3);


-- Task 3: Procedure called AddValidBooking;
-- The procedure should include two input parameters in the form of booking date and table number;
-- It also requires at least one variable and should begin with a START TRANSACTION statement;
-- Your INSERT statement must add a new booking record using the input parameter's values.
-- Use an IF ELSE statement to check if a table is already booked on the given date. 
-- If the table is already booked, then rollback the transaction. If the table is available, then commit the transaction. 

DELIMITER //

CREATE PROCEDURE AddValidBooking (IN booking_date DATE, IN table_number INT)
BEGIN
	DECLARE temp_table INT DEFAULT 0;
    SELECT COUNT(temp_table) INTO temp_table FROM Bookings WHERE BookingDate = booking_date AND TableNumber = table_number;
    START TRANSACTION;
    IF temp_table > 0 THEN
		SELECT CONCAT ('Table', table_number, 'is already booked - booking cancelled!')
		ROLLBACK;
    ELSE
		INSERT INTO Bookings (BookingDate, TableNumber) VALUES (booking_date, tableNumber);
		COMMIT;
	END IF;
END //

DELIMITER ;

CALL AddValidBooking('2022-12-17', 6);
    
    