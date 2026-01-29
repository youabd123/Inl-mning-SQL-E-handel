-- 06_UpdateData.sql
USE MiniShopDB;
GO

-- 1. Uppdatera telefonnummer för en kund
UPDATE Customers
SET Phone = '0709999999'
WHERE Email = 'jonas.berg@email.com';
GO

-- 2. Uppdatera status på en order
UPDATE Orders
SET Status = 'Paid',
    OrderDate = GETDATE()
WHERE OrderId = 1; -- Ändrade till 1 så vi är säkra på att den finns
GO

-- 3. Ändra antal för en specifik produkt i en order
UPDATE OrderItems
SET Quantity = 5
WHERE OrderId = 1 AND ProductId = 2;
GO