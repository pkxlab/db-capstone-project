-- Task 1: AddBookingProcedure: Adds a new booking record

DELIMITER //

CREATE PROCEDURE AddBooking (IN booking_id INT, IN booking_date DATE, IN table_number INT, IN customer_id INT, IN staff_id INT)
BEGIN
	INSERT INTO Bookings (BookingID, BookingDate, TableNumber, CustomerID, StaffID) 
    VALUES (booking_id, booking_date, table_number, customer_id, staff_id);
    SELECT "New booking added" AS Confirmation;
END

DELIMITER ;

CALL AddBooking (9, "2022-12-30", 3, 4, 1);



-- Task 2: UpdateBooking Procedure: to update existing bookings in the booking table;
DELIMITER //

CREATE PROCEDURE UpdateBooking(IN booking_id INT, IN booking_date DATE)
BEGIN
	UPDATE Bookings 
    SET BookingDate = booking_date
    WHERE BookingID = booking_id;
    SELECT CONCAT ('Booking', booking_id, 'updated');
END


DELIMITER ;

CALL UpdateBooking(9, '2022-12-17');



-- Task 3: CancelBooking: to cancel or remove a booking
DELIMITER //

CREATE PROCEDURE CancelBooking(IN booking_id INT)
BEGIN
	DELETE FROM Bookings
    WHERE BookingID = booking_id;
    SELECT CONCAT('Booking', booking_id, 'cancelled!')
END
DELIMITER ;

CALL CancelBooking(9);

