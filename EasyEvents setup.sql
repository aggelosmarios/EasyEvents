CREATE DATABASE EasyEvents;
GO

USE EasyEvents;
GO

-- Δημιουργία Πίνακα Χώρων Διεξαγωγής
CREATE TABLE Venues (
    VenueID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(255) NOT NULL,
    Address NVARCHAR(255) NOT NULL,
    Capacity INT NOT NULL,
    Contact NVARCHAR(50) NULL
);

-- Δημιουργία Πίνακα Εκδηλώσεων
CREATE TABLE Events (
    EventID INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(255) NOT NULL,
    Description NVARCHAR(MAX),
    Date DATETIME NOT NULL,
    VenueID INT NOT NULL,
    MaxParticipants INT,
    FOREIGN KEY (VenueID) REFERENCES Venues(VenueID)
);

-- Δημιουργία Πίνακα Συμμετεχόντων
CREATE TABLE Participants (
    ParticipantID INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(255) NOT NULL,
    Email NVARCHAR(255) NOT NULL UNIQUE,
    Phone NVARCHAR(50)
);

-- Δημιουργία Πίνακα Χρηστών
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),   
    Username NVARCHAR(50) NOT NULL UNIQUE,  
    Email NVARCHAR(255) NOT NULL UNIQUE,    
    Password NVARCHAR(255) NOT NULL,        
    Role NVARCHAR(50) NOT NULL 
        CHECK (Role IN ('Admin', 'Organizer', 'Participant')), 
    ParticipantID INT NULL,  
    CreatedAt DATETIME DEFAULT GETDATE(),   
    CONSTRAINT FK_Users_Participants 
        FOREIGN KEY (ParticipantID) 
        REFERENCES Participants(ParticipantID) 
        ON DELETE SET NULL
);

-- Δημιουργία Πίνακα Παραγγελιών
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT NOT NULL,
    TotalAmount DECIMAL(10,2) NOT NULL,
    OrderStatus NVARCHAR(50) CHECK (OrderStatus IN ('Pending', 'Completed', 'Failed')),
    OrderDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE
);

-- Δημιουργία Πίνακα Εισιτηρίων
CREATE TABLE Tickets (
    TicketID INT PRIMARY KEY IDENTITY(1,1),
    EventID INT NOT NULL,
    ParticipantID INT NOT NULL,
    PurchaseDate DATETIME DEFAULT GETDATE(),
    OrderID INT NULL,
    PaymentStatus NVARCHAR(50) CHECK (PaymentStatus IN ('Pending', 'Paid', 'Failed')),
    PaymentMethod NVARCHAR(50) NULL, 
    TransactionID NVARCHAR(255) NULL UNIQUE, 
    FOREIGN KEY (EventID) REFERENCES Events(EventID),
    FOREIGN KEY (ParticipantID) REFERENCES Participants(ParticipantID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE SET NULL
);

-- Δημιουργία Πίνακα Πληρωμών
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY IDENTITY(1,1),
    TicketID INT NOT NULL UNIQUE,
    Amount DECIMAL(10,2) NOT NULL,
    PaymentStatus NVARCHAR(50) CHECK (PaymentStatus IN ('Pending', 'Paid', 'Failed')),
    PaymentMethod NVARCHAR(50) NOT NULL,
    TransactionID NVARCHAR(255) UNIQUE,
    PaymentDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (TicketID) REFERENCES Tickets(TicketID) ON DELETE CASCADE
);

-- Δημιουργία Πίνακα Ειδοποιήσεων
CREATE TABLE Notifications (
    NotificationID INT PRIMARY KEY IDENTITY(1,1),
    ParticipantID INT NOT NULL,
    Message NVARCHAR(MAX) NOT NULL,
    SentDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ParticipantID) REFERENCES Participants(ParticipantID)
);

ALTER TABLE Tickets 
ADD Price DECIMAL(10,2) NOT NULL DEFAULT 0;

