USE master;
GO

IF DB_ID('review_kantin') IS NULL
BEGIN
    CREATE DATABASE review_kantin;
END
GO

IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'aliifah_user')
BEGIN
    CREATE LOGIN aliifah_user
        WITH PASSWORD = N'Praktikum2026!',
             DEFAULT_DATABASE = review_kantin;
END
GO

USE review_kantin;
GO

IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'aliifah_user')
BEGIN
    CREATE USER aliifah_user FOR LOGIN aliifah_user;
END
GO

ALTER ROLE db_datareader ADD MEMBER aliifah_user;
ALTER ROLE db_datawriter ADD MEMBER aliifah_user;
GO

SELECT name, type_desc, authentication_type_desc
FROM sys.database_principals
WHERE name = 'aliifah_user';
GO