USE MiniShopDB;
GO

DECLARE @Email NVARCHAR(255) = 'david.hassan@email.com';
DECLARE @CustomerId INT;

-- 1) create a customer if dont exist 
IF NOT EXISTS (SELECT 1 FROM dbo.Customers WHERE Email = @Email)
BEGIN
    INSERT INTO dbo.Customers (FullName, Email, Phone)
    VALUES ('David Hassan', @Email, '0707777777');
END

-- 2) Get customerId
SELECT @CustomerId = CustomerId
FROM dbo.Customers
WHERE Email = @Email;

-- 3) Create new and and new OrderId
DECLARE @OrderId INT;

INSERT INTO dbo.Orders (CustomerId, Status, ShippingAddress)
VALUES (@CustomerId, 'Created', 'Kungsgatan 5, Malmö');

SET @OrderId = SCOPE_IDENTITY();

-- 4) Put in items on new orders
INSERT INTO dbo.OrderItems (OrderId, ProductId, Quantity, UnitPrice)
VALUES
(@OrderId, 1, 1, 8999.00),
(@OrderId, 2, 2, 799.00);
GO
