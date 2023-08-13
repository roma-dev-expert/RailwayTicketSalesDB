CREATE DATABASE RailwayTicketSales;

USE RailwayTicketSales;

CREATE TABLE Users (
    UserId UNIQUEIDENTIFIER PRIMARY KEY,
    Name VARCHAR(50),
    LastName VARCHAR(50),
    Login VARCHAR(20) UNIQUE,
    Password VARCHAR(100),
    Email VARCHAR(100)
);

CREATE TABLE Stations (
    StationId UNIQUEIDENTIFIER PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(200)
);

CREATE TABLE Trains (
    TrainId UNIQUEIDENTIFIER PRIMARY KEY,
    Number VARCHAR(20),
    Type VARCHAR(50)
);

CREATE TABLE Schedule (
    ScheduleId UNIQUEIDENTIFIER PRIMARY KEY,
    TrainId UNIQUEIDENTIFIER,
    Departure DATETIME,
    Arrival DATETIME,
    DepartureStation UNIQUEIDENTIFIER,
    ArrivalStation UNIQUEIDENTIFIER,
    FOREIGN KEY (TrainId) REFERENCES Trains(TrainId),
    FOREIGN KEY (DepartureStation) REFERENCES Stations(StationId),
    FOREIGN KEY (ArrivalStation) REFERENCES Stations(StationId)
);

CREATE TABLE Tickets (
    TicketId UNIQUEIDENTIFIER PRIMARY KEY,
    UserId UNIQUEIDENTIFIER,
    ScheduleId UNIQUEIDENTIFIER,
    Price DECIMAL(10, 2),
    FOREIGN KEY (UserId) REFERENCES Users(UserId),
    FOREIGN KEY (ScheduleId) REFERENCES Schedule(ScheduleId)
);

CREATE TABLE Payments (
    PaymentId UNIQUEIDENTIFIER PRIMARY KEY,
    TicketId UNIQUEIDENTIFIER,
    PaymentAmount DECIMAL(10, 2),
    PaymentDate DATETIME,
    PaymentStatus VARCHAR(50),
    FOREIGN KEY (TicketId) REFERENCES Tickets(TicketId)
);

--Data
INSERT INTO Users (UserId, Name, LastName, Login, Password, Email)
VALUES
    ('00000000-0000-0000-0000-000000000001', 'John', 'Doe', 'johndoe', 'password123', 'john@example.com'),
    ('00000000-0000-0000-0000-000000000002', 'Jane', 'Smith', 'janesmith', 'securepass', 'jane@example.com');

INSERT INTO Stations (StationId, Name, Address)
VALUES
    ('00000000-0000-0000-0000-000000000001', 'Central Station', '123 Main St, City'),
    ('00000000-0000-0000-0000-000000000002', 'North Station', '456 Park Ave, Town');

INSERT INTO Trains (TrainId, Number, Type)
VALUES
    ('00000000-0000-0000-0000-000000000001', 'T123', 'Express'),
    ('00000000-0000-0000-0000-000000000002', 'S456', 'Local');
										  
INSERT INTO Schedule (ScheduleId, TrainId, Departure, Arrival, DepartureStation, ArrivalStation)
VALUES
    ('00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001', '2023-08-01 08:00:00', '2023-08-01 10:00:00', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000002'),
    ('00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000002', '2023-08-01 09:00:00', '2023-08-01 11:00:00', '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000001');

INSERT INTO Tickets (TicketId, UserId, ScheduleId, Price)
VALUES
    ('00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001', 25.00),
    ('00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000002', 15.50);

INSERT INTO Payments (PaymentId, TicketId, PaymentAmount, PaymentDate, PaymentStatus)
VALUES
    ('00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001', 25.00, '2023-08-01 08:30:00', 'Paid'),
    ('00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000002', 15.50, '2023-08-01 09:30:00', 'Paid');