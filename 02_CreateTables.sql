USE MiniShopDB;
GO

-- 1. Kunder
CREATE TABLE Customers (
    CustomerId INT IDENTITY PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    Phone NVARCHAR(20),
    CreatedAt DATETIME DEFAULT GETDATE()
);

-- 2. Kategorier
CREATE TABLE Categories (
    CategoryId INT IDENTITY PRIMARY KEY,
    CategoryName NVARCHAR(50) NOT NULL UNIQUE
);

-- 3. Produkter
CREATE TABLE Products (
    ProductId INT IDENTITY PRIMARY KEY,
    ProductName NVARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL CHECK (Price >= 0),
    CategoryId INT REFERENCES Categories(CategoryId), -- Enkel FK-koppling
    IsActive BIT DEFAULT 1
);

-- 4. Ordrar
CREATE TABLE Orders (
    OrderId INT IDENTITY PRIMARY KEY,
    OrderDate DATETIME DEFAULT GETDATE(),
    Status NVARCHAR(20) DEFAULT 'Pending',
    ShippingAddress NVARCHAR(200),
    CustomerId INT REFERENCES Customers(CustomerId) -- Enkel FK-koppling
);

-- 5. Orderdetaljer
CREATE TABLE OrderItems (
    OrderId INT REFERENCES Orders(OrderId),
    ProductId INT REFERENCES Products(ProductId),
    Quantity INT NOT NULL CHECK (Quantity > 0),
    UnitPrice DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (OrderId, ProductId) -- Sätter ihop båda till en PK
);

-- 6. Betalningar
CREATE TABLE Payments (
    PaymentId INT IDENTITY PRIMARY KEY,
    Amount DECIMAL(10,2) NOT NULL,
    PaymentMethod NVARCHAR(20), -- Ex: 'Kort', 'Swish'
    PaidAt DATETIME DEFAULT GETDATE(),
    OrderId INT UNIQUE REFERENCES Orders(OrderId)
);