USE MiniShopDB;
GO

-- 1. Skapa en ny order för en kund (t.ex. Kund ID 1)
INSERT INTO Orders (CustomerId, Status, ShippingAddress)
VALUES (1, 'Pending', 'Kungsgatan 5, Malmö');

-- 2. VIKTIGT: Hämta ID:t för ordern vi just skapade
-- Utan denna rad vet vi inte vilket OrderId produkterna ska ha!
DECLARE @CurrentOrderId INT = SCOPE_IDENTITY();

-- 3. Lägg till produkterna i den ordern
INSERT INTO OrderItems (OrderId, ProductId, Quantity, UnitPrice)
VALUES
(@CurrentOrderId, 1, 1, 8999.00), -- En laptop
(@CurrentOrderId, 3, 1, 2499.00); -- En monitor
GO