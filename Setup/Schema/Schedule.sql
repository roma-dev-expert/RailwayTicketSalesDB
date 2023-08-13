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