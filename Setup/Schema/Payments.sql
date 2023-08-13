CREATE TABLE Payments (
    PaymentId UNIQUEIDENTIFIER PRIMARY KEY,
    TicketId UNIQUEIDENTIFIER,
    PaymentAmount DECIMAL(10, 2),
    PaymentDate DATETIME,
    PaymentStatus VARCHAR(50),
    FOREIGN KEY (TicketId) REFERENCES Tickets(TicketId)
);
