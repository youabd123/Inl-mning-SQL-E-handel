-- 03_SeedData.sql
USE MiniShopDB;
GO

-- Categories
INSERT INTO Categories (CategoryName)
VALUES
('Electronics'),
('Clothing'),
('Books');
GO


-- Customers
INSERT INTO Customers (FullName, Email, Phone)
VALUES
('Anna Svensson', 'anna.svensson@email.com', '0701111111'),
('Erik Johansson', 'erik.johansson@email.com', '0702222222'),
('Sara Nilsson', 'sara.nilsson@email.com', '0703333333'),
('Jonas Berg', 'jonas.berg@email.com', '0704444444'),
('Lina Karlsson', 'lina.karlsson@email.com', '0705555555'),
('Mohammed Ali', 'mohammed.ali@email.com', '0706666666');
GO

-- Products
INSERT INTO Products (CategoryId, SKU, ProductName, Price, IsActive)
VALUES
(1, 'ELEC-001', 'Laptop', 8999.00, 1),
(1, 'ELEC-002', 'Headphones', 799.00, 1),
(1, 'ELEC-003', 'Monitor', 2499.00, 1),
(1, 'ELEC-004', 'Keyboard', 499.00, 1),
(2, 'CLOT-001', 'T-Shirt', 199.00, 1),
(2, 'CLOT-002', 'Hoodie', 599.00, 1),
(3, 'BOOK-001', 'SQL Basics', 299.00, 1),
(3, 'BOOK-002', 'C# Fundamentals', 349.00, 1);
GO

-- Orders
INSERT INTO Orders (CustomerId, Status, ShippingAddress)
VALUES
(1, 'Created', 'Storgatan 1, Stockholm'),
(2, 'Paid', 'Parkvägen 10, Göteborg'),
(3, 'Created', 'Ringvägen 5, Uppsala'),
(4, 'Paid', 'Kungsgatan 12, Malmö'),
(5, 'Created', 'Drottninggatan 8, Stockholm'),
(6, 'Paid', 'Storgatan 22, Västerås');
GO
-- OrderItems

INSERT INTO OrderItems (OrderId, ProductId, Quantity, UnitPrice)
VALUES
(1, 1, 1, 8999.00),
(1, 2, 1, 799.00),
(2, 3, 2, 199.00),
(3, 4, 1, 299.00),
(4, 1, 1, 8999.00),
(5, 2, 2, 799.00),
(6, 5, 1, 2499.00);
GO

-- Payments
INSERT INTO Payments (OrderId, Amount, PaymentMethod)
VALUES
(2, 398.00, 'card'),
(4, 8999.00, 'swish'),
(6, 2499.00, 'invoice');
GO