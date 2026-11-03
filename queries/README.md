# Phase 5 — Queries
## Queries for Mission Statement

-- Queries for Mission Statement

## Q1

SELECT
    C.CustomerID,
    C.FirstName,
    C.LastName,
    COUNT(O.OrderID) AS TotalOrders
FROM Customers C
INNER JOIN Orders O
    ON C.CustomerID = O.CustomerID
WHERE C.CustomerID = 1
GROUP BY
    C.CustomerID,
    C.FirstName,
    C.LastName;

## Q2

SELECT
    O.OrderID,
    O.OrderDate,
    SUM(OI.Quantity) AS TotalItems,
    SUM(OI.Quantity * OI.UnitPrice) AS OrderValue
FROM Orders O
INNER JOIN OrderItems OI
    ON O.OrderID = OI.OrderID
GROUP BY
    O.OrderID,
    O.OrderDate
ORDER BY O.OrderID;

## Q3

SELECT
    O.OrderID,
    O.OrderDate,
    SUM(OI.Quantity * OI.UnitPrice) AS TotalAmount
FROM Orders O
INNER JOIN OrderItems OI
    ON O.OrderID = OI.OrderID
GROUP BY
    O.OrderID,
    O.OrderDate
ORDER BY O.OrderDate;

 ## Q4

SELECT
    CONCAT(C.FirstName, ' ', C.LastName) AS CustomerName,
    COUNT(O.OrderID) AS TotalOrders
FROM Customers C
LEFT JOIN Orders O
    ON C.CustomerID = O.CustomerID
WHERE O.OrderDate BETWEEN '2026-10-01' AND '2026-10-31'
GROUP BY
    C.CustomerID,
    C.FirstName,
    C.LastName
ORDER BY TotalOrders DESC;

## Q5

SELECT
    B.BoxID,
    B.Type AS Product,
    SUM(OI.Quantity) AS TotalQuantitySold
FROM Orders O
INNER JOIN OrderItems OI
    ON O.OrderID = OI.OrderID
INNER JOIN Box B
    ON OI.BoxID = B.BoxID
GROUP BY
    B.BoxID,
    B.Type
ORDER BY
    TotalQuantitySold DESC
LIMIT 10;

## Q6
SELECT
    B.BoxID,
    B.Type AS Product,
    B.QuantityInStock AS CurrentInventory
FROM Box B
ORDER BY B.QuantityInStock ASC;

## Q7
SELECT
    C.CustomerID,
    C.FirstName,
    C.LastName,
    C.Address,
    C.City,
    C.State,
    C.ZipCode,
    C.PhoneNumber,
    C.Email
FROM Customers C
ORDER BY C.LastName, C.FirstName;

## Q8
SELECT
    C.CustomerID,
    CONCAT(C.FirstName, ' ', C.LastName) AS CustomerName,
    O.OrderID,
    O.OrderDate,
    B.BoxID,
    B.Type AS Product,
    OI.Quantity
FROM Customers C
INNER JOIN Orders O
    ON C.CustomerID = O.CustomerID
INNER JOIN OrderItems OI
    ON O.OrderID = OI.OrderID
INNER JOIN Box B
    ON OI.BoxID = B.BoxID
ORDER BY
    C.CustomerID,
    O.OrderDate,
    O.OrderID;
