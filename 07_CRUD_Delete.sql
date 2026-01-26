-- 07_CRUD_Delete.sql

USE MiniShopDB;
GO

-- Remove order lines first (junction table)
DELETE FROM OrderItems
WHERE OrderId = 3;
GO

-- Delete payment connected to new order
DELETE FROM Payments
WHERE OrderId = 3;
GO

-- Delete order
DELETE FROM Orders
WHERE OrderId = 3;
GO
