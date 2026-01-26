-- 06_CRUD_Update.sql
USE MiniShopDB;
GO

-- Information about customers
UPDATE Customers
SET Phone = '0705555555'
WHERE Email = 'jonas.berg@email.com';
GO

-- Costumers orders
UPDATE Orders
SET Status = 'Paid',
    OrderDate = SYSDATETIME()
WHERE OrderId = 3;
GO

-- Details about orders
UPDATE OrderItems
SET Quantity = 3
WHERE OrderId = 3 AND ProductId = 2;
GO