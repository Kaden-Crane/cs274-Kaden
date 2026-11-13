# Phase 6 — Seed Data

USE baseballcarddb;
 
INSERT INTO Customers
(FirstName, LastName, Email, Phone, Add1, Add2, City, State, Zip)
VALUES
('John', 'Smith', 'john.smith1@email.com', '573-555-1111', '123 Oak St', NULL, 'Hannibal', 'MO', '63401'),
('Sarah', 'Johnson', 'sarah.johnson1@email.com', '573-555-1222', '456 Maple Ave', 'Apt 2B', 'Quincy', 'IL', '62301'),
('Michael', 'Davis', 'mike.d1@email.com', '573-555-1333', '789 Pine Rd', NULL, 'Columbia', 'MO', '65201'),
('Emily', 'Brown', 'emily.brown1@email.com', '573-555-1444', '321 Cedar Ln', NULL, 'St Louis', 'MO', '63101'),
('Jacob', 'Miller', 'jacob.miller1@email.com', '573-555-1555', '654 Birch Dr', NULL, 'Springfield', 'MO', '65802');

INSERT INTO Brand (BrandName)
VALUES
('Topps'),
('Panini'),
('Bowman'),
('Upper Deck'),
('Leaf');

INSERT INTO Series (SeriesName)
VALUES
('Chrome'),
('Heritage'),
('Draft Picks'),
('Archives'),
('Stadium Club');

INSERT INTO Box
(BrandID, SeriesID, Type, PksPerBox, CardsPerPack, Price)
VALUES
(1, 1, 'Hobby', 24, 4, 149.99),
(1, 2, 'Blaster', 8, 8, 29.99),
(2, 3, 'Mega', 12, 10, 89.99),
(3, 3, 'Jumbo', 10, 32, 349.99),
(4, 5, 'Retail', 7, 8, 24.99);

INSERT INTO Orders
(CustomerID, OrderDate, OrderStatus)
VALUES
(1, '2026-10-01', 'Delivered'),
(2, '2026-10-05', 'Shipped'),
(3, '2026-10-07', 'Pending'),
(4, '2026-10-10', 'Delivered'),
(5, '2026-10-12', 'Pending');

INSERT INTO Payment
(OrderID, PaymentDate, Amount, PaymentMethod, PaymentStatus)
VALUES
(1, '2026-10-01', 149.99, 'Credit Card', 'Approved'),
(2, '2026-10-05', 29.99, 'PayPal', 'Approved'),
(3, '2026-10-07', 89.99, 'Debit Card', 'Pending'),
(4, '2026-10-10', 349.99, 'Credit Card', 'Approved'),
(5, '2026-10-12', 24.99, 'PayPal', 'Pending');

INSERT INTO OrderItems
(OrderID, BoxID, Quantity, UnitPrice)
VALUES
(1, 1, 2, 149.99),
(2, 2, 1, 29.99),
(3, 3, 3, 89.99),
(4, 4, 1, 349.99),
(5, 5, 2, 24.99),

-- Orders with multiple products
(1, 2, 1, 29.99),
(3, 5, 2, 24.99),
(4, 1, 1, 149.99);

/* =====================================================
   TRANSACTION 1: COMMIT
   This transaction updates an order and its related payment.
   Both statements must succeed together to keep the database
   consistent. If an order is marked Delivered, the payment
   should also be Approved.
   ===================================================== */

START TRANSACTION;

UPDATE Orders
SET OrderStatus = 'Delivered'
WHERE OrderID = 3;

UPDATE Payment
SET PaymentStatus = 'Approved'
WHERE OrderID = 3;

COMMIT;


/* =====================================================
   TRANSACTION 2: ROLLBACK
   This transaction intentionally rolls back changes.
   The updates are executed, but ROLLBACK undoes them,
   leaving the database unchanged.
   ===================================================== */

START TRANSACTION;

UPDATE Orders
SET OrderStatus = 'Shipped'
WHERE OrderID = 5;

UPDATE Payment
SET PaymentStatus = 'Denied'
WHERE OrderID = 5;

ROLLBACK;
