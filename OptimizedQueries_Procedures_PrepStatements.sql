-- Task 1: Creating a Procedure;
-- Little Lemon need you to create a procedure that displays the maximum ordered quantity in the Orders table;

CREATE PROCEDURE GetMaxQuantity()
SELECT MAX(OrderQty) AS "Max Quantity in Order" 
FROM Orders;


CALL GetMaxQuantity();



-- Task 2: Little Lemon need you to help them to create a prepared statement called GetOrderDetail;
-- The statement should accept one input argument, the CustomerID value, from a variable;
-- The statement should return the order id, the quantity and the order cost from the Orders table;

PREPARE GetOrderDetail 
FROM
'SELECT OrderID, OrderQty, TotalCost FROM Orders WHERE CustomerID = ?';

SET @id = 1;
EXECUTE GetOrderDetail USING @id;



-- Task 3: create a stored procedure called CancelOrder;
--  Little Lemon want to use this stored procedure to delete an order record based on the user input of the order id;

DELIMITER //

CREATE PROCEDURE CancelOrder(IN order_id INT)
BEGIN
	DELETE FROM Orders WHERE OrderID = order_id;
END //

DELIMITER ;

CALL CancelOrder(5);
