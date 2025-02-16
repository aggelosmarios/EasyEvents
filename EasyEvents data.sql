USE EasyEvents;
GO

-- Εισαγωγή δεδομένων στους χώρους διεξαγωγής
INSERT INTO Venues (Name, Address, Capacity, Contact)
VALUES 
('Athens Conference Center', '123 Main Street, Athens', 500, '2101234567'),
('Thessaloniki Music Hall', '45 Aristotelous Str, Thessaloniki', 1000, '2310123456'),
('Patras Event Center', '22 Korinthou, Patras', 750, '2610123456'),
('Crete Expo Hall', '10 Heraklion Rd, Crete', 1200, '2810123456'),
('Larisa Cultural Hall', '5 Egnatia, Larisa', 400, '2410123456');

-- Εισαγωγή εκδηλώσεων
INSERT INTO Events (Title, Description, Date, VenueID, MaxParticipants)
VALUES 
('Tech Conference 2024', 'A conference about the latest tech trends.', '2024-06-15', 1, 300),
('Music Festival 2024', 'Enjoy live music performances.', '2024-07-20', 2, 800),
('Startup Summit', 'A networking event for entrepreneurs.', '2024-09-10', 3, 500),
('Health & Wellness Expo', 'Discover new wellness trends.', '2024-08-25', 4, 1000),
('Gaming Convention', 'The biggest gaming convention of the year.', '2024-11-10', 5, 600);

-- Εισαγωγή συμμετεχόντων
INSERT INTO Participants (FullName, Email, Phone)
VALUES 
('John Doe', 'john.doe@example.com', '6901234567'),
('Maria Papadopoulou', 'maria.papadopoulou@example.com', '6945678910'),
('George Nikolakopoulos', 'george.nikola@example.com', '6987654321'),
('Elena Vasileiou', 'elena.vas@example.com', '6991234567'),
('Dimitris Karamanlis', 'd.karamanlis@example.com', '6956789012'),
('Eleni Fotiadou', 'eleni.fotiadou@example.com', '6912345678'),
('Kostas Michailidis', 'kostas.michailidis@example.com', '6934567890'),
('Sophia Georgiou', 'sophia.georgiou@example.com', '6978912345'),
('Nikos Papageorgiou', 'nikos.pap@example.com', '6982345678'),
('Anna Stylianou', 'anna.styl@example.com', '6909876543');

-- Εισαγωγή χρηστών
INSERT INTO Users (Username, Email, Password, Role, ParticipantID)
VALUES 
('admin_user', 'admin@example.com', 'hashedpassword123', 'Admin', NULL),
('event_manager', 'manager@example.com', 'hashedpassword456', 'Organizer', NULL),
('john_doe', 'john.doe@example.com', 'hashedpassword789', 'Participant', 1),
('maria_pap', 'maria.pap@example.com', 'hashedpassword001', 'Participant', 2),
('george_nik', 'george.nikola@example.com', 'hashedpassword002', 'Participant', 3),
('elena_vas', 'elena.vas@example.com', 'hashedpassword003', 'Participant', 4),
('dimitris_kar', 'd.karamanlis@example.com', 'hashedpassword004', 'Participant', 5),
('eleni_foti', 'eleni.fotiadou@example.com', 'hashedpassword005', 'Participant', 6),
('kostas_mich', 'kostas.michailidis@example.com', 'hashedpassword006', 'Participant', 7),
('sophia_geo', 'sophia.georgiou@example.com', 'hashedpassword007', 'Participant', 8),
('nikos_pap', 'nikos.pap@example.com', 'hashedpassword008', 'Participant', 9),
('anna_styl', 'anna.styl@example.com', 'hashedpassword009', 'Participant', 10);

-- Εισαγωγή παραγγελιών
INSERT INTO Orders (UserID, TotalAmount, OrderStatus)
VALUES 
(3, 50.00, 'Completed'),
(4, 80.00, 'Completed'),
(5, 40.00, 'Pending'),
(6, 100.00, 'Completed'),
(7, 60.00, 'Completed');

-- Εισαγωγή εισιτηρίων με συσχέτιση παραγγελίας και κατάστασης πληρωμής
INSERT INTO Tickets (EventID, ParticipantID, PurchaseDate, OrderID, PaymentStatus, PaymentMethod, TransactionID)
VALUES 
(1, 1, '2024-05-10', 1, 'Paid', 'Credit Card', 'TXN123456A'),
(1, 2, '2024-05-12', 1, 'Paid', 'Credit Card', 'TXN123456B'),
(2, 3, '2024-06-01', 2, 'Paid', 'PayPal', 'TXN987654C'),
(2, 4, '2024-06-05', 2, 'Paid', 'PayPal', 'TXN987654D'),
(3, 5, '2024-07-15', 3, 'Pending', NULL, NULL),
(4, 7, '2024-08-10', 4, 'Paid', 'Credit Card', 'TXN456789E'),
(4, 8, '2024-08-18', 4, 'Paid', 'Credit Card', 'TXN456789F'),
(5, 9, '2024-10-01', 5, 'Paid', 'PayPal', 'TXN789012G'),
(5, 10, '2024-10-05', 5, 'Paid', 'PayPal', 'TXN789012H');

-- Εισαγωγή πληρωμών
INSERT INTO Payments (TicketID, Amount, PaymentStatus, PaymentMethod, TransactionID)
VALUES 
(7, 50.00, 'Paid', 'Credit Card', 'TXN123456A'),
(8, 50.00, 'Paid', 'Credit Card', 'TXN123456B'),
(9, 80.00, 'Paid', 'PayPal', 'TXN987654C'),
(10, 80.00, 'Paid', 'PayPal', 'TXN987654D'),
(12, 60.00, 'Paid', 'Credit Card', 'TXN456789E'),
(13, 60.00, 'Paid', 'Credit Card', 'TXN456789F'),
(14, 40.00, 'Paid', 'PayPal', 'TXN789012G'),
(15, 40.00, 'Paid', 'PayPal', 'TXN789012H');

-- Εισαγωγή ειδοποιήσεων
INSERT INTO Notifications (ParticipantID, Message, SentDate)
VALUES 
(1, 'Reminder: Tech Conference 2024 is happening soon!', '2024-06-10'),
(2, 'Your ticket for Tech Conference 2024 is confirmed!', '2024-05-12'),
(3, 'Music Festival 2024 - Your ticket details.', '2024-06-02'),
(4, 'Music Festival 2024 - Event reminder!', '2024-07-18'),
(5, 'Startup Summit: Thank you for registering!', '2024-09-01'),
(6, 'Health & Wellness Expo - Registration confirmed.', '2024-08-15'),
(7, 'Gaming Convention - Ticket purchase successful.', '2024-11-01'),
(8, 'Your Gaming Convention ticket has been updated.', '2024-11-05'),
(9, 'Get ready for Gaming Convention 2024!', '2024-11-08'),
(10, 'We look forward to seeing you at the Startup Summit!', '2024-09-05');

UPDATE Tickets SET Price = 15.00 WHERE EventID = 1;
UPDATE Tickets SET Price = 20.00 WHERE EventID = 2;
UPDATE Tickets SET Price = 12.50 WHERE EventID = 3;
UPDATE Tickets SET Price = 18.00 WHERE EventID = 4;
UPDATE Tickets SET Price = 25.00 WHERE EventID = 5;

