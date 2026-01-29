-- 05_Queries.sql
USE MiniShopDB;
GO

-- 1. Se alla produkter och priser
SELECT ProductName, Price FROM Products;

-- 2. Se alla kunder
SELECT FullName, Email FROM Customers;

-- 3. Se vem som har gjort vilken order (Viktigaste frågan!)
SELECT 
    Orders.OrderId, 
    Customers.FullName, 
    Orders.OrderDate 
FROM Orders
JOIN Customers ON Orders.CustomerId = Customers.CustomerId;