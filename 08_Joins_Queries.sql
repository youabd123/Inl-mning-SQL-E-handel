USE MiniShopDB;
GO
-- Here I check which customers have bought what by joining three tables
SELECT 
    o.OrderId, 
    c.FullName, 
    o.OrderDate, 
    p.ProductName, 
    oi.Quantity
FROM Orders o
JOIN Customers c ON o.CustomerId = c.CustomerId
JOIN OrderItems oi ON o.OrderId = oi.OrderId
JOIN Products p ON oi.ProductId = p.ProductId;
GO

-- Shows customers who have spent more than 1000 SEK in total
SELECT 
    c.FullName, 
    SUM(oi.Quantity * oi.UnitPrice) AS TotalOrderValue
FROM Customers c
JOIN Orders o ON c.CustomerId = o.CustomerId
JOIN OrderItems oi ON o.OrderId = oi.OrderId
GROUP BY c.FullName
HAVING SUM(oi.Quantity * oi.UnitPrice) > 1000;
GO

-- Calculates the average price per category to see what is more expensive
WITH CategoryStats AS (
    SELECT CategoryId, AVG(Price) AS AvgPrice
    FROM Products
    GROUP BY CategoryId
)
SELECT cat.CategoryName, cs.AvgPrice
FROM Categories cat
JOIN CategoryStats cs ON cat.CategoryId = cs.CategoryId;
GO

-- 4. Businessquestion top 3 best selling product
SELECT TOP 3 
    p.ProductName, 
    SUM(oi.Quantity) AS UnitsSold
FROM OrderItems oi
JOIN Products p ON oi.ProductId = p.ProductId
GROUP BY p.ProductName
ORDER BY UnitsSold DESC;
GO