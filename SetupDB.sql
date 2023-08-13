-- Создание базы данных "RailwayTicketSales"
CREATE DATABASE RailwayTicketSales;

USE RailwayTicketSales;

CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Name VARCHAR(50),
    LastName VARCHAR(50),
    Login VARCHAR(20) UNIQUE,
    Password VARCHAR(100),
    Email VARCHAR(100)
);

CREATE TABLE Stations (
    StationID INT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(200)
);

CREATE TABLE Trains (
    TrainID INT PRIMARY KEY,
    Number VARCHAR(20),
    Type VARCHAR(50)
);

CREATE TABLE Schedule (
    ScheduleID INT PRIMARY KEY,
    TrainID INT,
    Departure DATETIME,
    Arrival DATETIME,
    DepartureStation INT,
    ArrivalStation INT,
    FOREIGN KEY (TrainID) REFERENCES Trains(TrainID),
    FOREIGN KEY (DepartureStation) REFERENCES Stations(StationID),
    FOREIGN KEY (ArrivalStation) REFERENCES Stations(StationID)
);

CREATE TABLE Tickets (
    TicketID INT PRIMARY KEY,
    UserID INT,
    ScheduleID INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ScheduleID) REFERENCES Schedule(ScheduleID)
);

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    TicketID INT,
    PaymentAmount DECIMAL(10, 2),
    PaymentDate DATETIME,
    PaymentStatus VARCHAR(50),
    FOREIGN KEY (TicketID) REFERENCES Tickets(TicketID)
);
