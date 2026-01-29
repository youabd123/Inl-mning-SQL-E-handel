-- 03_SeedData.sql
USE MiniShopDB;
GO

-- 1. Kategorier
INSERT INTO Categories (CategoryName)
VALUES 
('Electronics'), 
('Clothing'), 
('Books');
GO

-- 2. Kunder
INSERT INTO Customers (FullName, Email, Phone)
VALUES 
('Anna Svensson', 'anna.svensson@email.com', '0701111111'),
('Erik Johansson', 'erik.johansson@email.com', '0702222222'),
('Sara Nilsson', 'sara.nilsson@email.com', '0703333333'),
('Jonas Berg', 'jonas.berg@email.com', '0704444444'),
('Lina Karlsson', 'lina.karlsson@email.com', '0705555555'),
('Mohammed Ali', 'mohammed.ali@email.com', '0706666666');
GO

-- 3. Produkter (Här har vi tagit bort SKU för att matcha 02_CreateTables)
INSERT INTO Products (ProductName, Price, CategoryId, IsActive)
VALUES 
('Laptop', 8999.00, 1, 1),
('Headphones', 799.00, 1, 1),
('Monitor', 2499.00, 1, 1),
('Keyboard', 499.00, 1, 1),
('T-Shirt', 199.00, 2, 1),
('Hoodie', 599.00, 2, 1),
('SQL Basics', 299.00, 3, 1),
('C# Fundamentals', 349.00, 3, 1);
GO

-- 4. Ordrar
INSERT INTO Orders (CustomerId, Status, ShippingAddress)
VALUES 
(1, 'Paid', 'Storgatan 1, Stockholm'),
(2, 'Paid', 'Parkvägen 10, Göteborg'),
(3, 'Pending', 'Ringvägen 5, Uppsala'),
(4, 'Paid', 'Kungsgatan 12, Malmö'),
(5, 'Pending', 'Drottninggatan 8, Stockholm'),
(6, 'Paid', 'Storgatan 22, Västerås');
GO

-- 5. Orderdetaljer (Kopplar produkter till ordrar)
INSERT INTO OrderItems (OrderId, ProductId, Quantity, UnitPrice)
VALUES 
(1, 1, 1, 8999.00),
(1, 2, 1, 799.00),
(2, 3, 2, 2499.00),
(3, 7, 1, 299.00),
(4, 1, 1, 8999.00),
(5, 6, 1, 599.00),
(6, 5, 2, 199.00);
GO

-- 6. Betalningar (1-till-1 koppling till vissa ordrar)
INSERT INTO Payments (Amount, PaymentMethod, OrderId)
VALUES 
(9798.00, 'Kort', 1),
(4998.00, 'Swish', 2),
(8999.00, 'Kort', 4),
(398.00, 'Faktura', 6);
GO