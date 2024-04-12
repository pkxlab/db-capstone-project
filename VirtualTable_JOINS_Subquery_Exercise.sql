-- Task 1: Orders View;
-- Little Lemon needs to create a virtual table called OrdersView that focuses on OrderID, Quantity and Cost columns within the Orders table for all orders with a quantity greater than 2;

USE LittleLemonDB;
SHOW TABLES;

CREATE VIEW OrdersView AS
SELECT OrderID, OrderQty, TotalCost
FROM Orders
WHERE OrderQty > 2;

SELECT * FROM OrdersView;



-- Task 2: JOIN Clause for Customers, Orders, Bookings, & Menu tables;
-- Little Lemon needs information from four tables on all customers with orders that cost more than $150;

SELECT Customers.CustomerID, Customers.CustomerFirstName, Customers.CustomerLastName, 
Bookings.BookingID,
Orders.OrderID, Orders.TotalCost,
Menu.MenuID, Menu.Course, Menu.Starter
FROM Customers INNER JOIN Bookings ON Customers.CustomerID = Bookings.CustomerID
INNER JOIN Orders ON Bookings.BookingID = Orders.BookingID
INNER JOIN Menu ON Orders.MenuID = Menu.MenuID
WHERE Orders.TotalCost > 150
ORDER BY Orders.TotalCost ASC;


-- Task 3: Subquery and ANY operator;
-- Little Lemon need you to find all menu items for which more than 2 orders have been placed;


SELECT Menu.MenuID
FROM Menu
WHERE Menu.MenuID = ANY 
(SELECT Orders.MenuID FROM Oders
GROUP BY Orders.MenuID
HAVING COUNT(Orders.MenuID) > 2);



