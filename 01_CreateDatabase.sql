-- 01_CreateDatabase.sql
-- Skapar databasen MiniShopDB
-- Om databasen redan finns tas den bort först

IF DB_ID('MiniShopDB') IS NOT NULL
BEGIN
    ALTER DATABASE MiniShopDB
    SET SINGLE_USER
    WITH ROLLBACK IMMEDIATE;

    DROP DATABASE MiniShopDB;
END
GO

CREATE DATABASE MiniShopDB;
GO
