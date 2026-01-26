-- 05_CRUD_Select.sql
USE MiniShopDB;
GO

-- Enkel SELECT

SELECT *
FROM Customers;
GO

-- Filtrerad SELECT
SELECT *
FROM Orders
WHERE Status = 'Created';
GO

-- SELECT med JOIN (Orders + Customers)
SELECT
    o.OrderId,
    o.OrderDate,
    o.Status,
    c.FullName,
    c.Email
FROM Orders o
JOIN Customers c ON o.CustomerId = c.CustomerId;
GO

-- Join OrderItems with Products to get product details
SELECT
    oi.OrderId,
    p.ProductName,
    oi.Quantity,
    oi.UnitPrice
FROM OrderItems oi
JOIN Products p ON oi.ProductId = p.ProductId;
GO
