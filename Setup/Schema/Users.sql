CREATE TABLE Users (
    UserId UNIQUEIDENTIFIER PRIMARY KEY,
    Name VARCHAR(50),
    LastName VARCHAR(50),
    Login VARCHAR(20) UNIQUE,
    Password VARCHAR(100),
    Email VARCHAR(100)
);