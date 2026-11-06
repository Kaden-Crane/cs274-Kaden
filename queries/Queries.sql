-- Display all orders for CustomerID = 1
-- COUNT() counts the number of orders placed

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
    C.LastName
HAVING COUNT(O.OrderID) >= 1;

-- HAVING filters the grouped results after COUNT() is calculated.

-- Display every product included in each order
-- along with the quantity purchased

SELECT
    OI.OrderID,
    OI.BoxID,
    B.Type,
    BR.BrandName,
    S.SeriesName,
    OI.Quantity
FROM OrderItems OI
INNER JOIN Box B
    ON OI.BoxID = B.BoxID
INNER JOIN Brand BR
    ON B.BrandID = BR.BrandID
INNER JOIN Series S
    ON B.SeriesID = S.SeriesID
ORDER BY OI.OrderID;

-- Joins allow product details to be displayed
-- for each item included in an order.

-- Calculate the total amount for each order

SELECT
    O.OrderID,
    O.OrderDate,
    O.OrderStatus,
    Totals.TotalAmount
FROM Orders O
INNER JOIN
(
    SELECT
        OrderID,
        SUM(Quantity * UnitPrice) AS TotalAmount
    FROM OrderItems
    GROUP BY OrderID
) AS Totals
ON O.OrderID = Totals.OrderID
ORDER BY O.OrderDate;

-- The subquery calculates order totals.
-- SUM() adds all item costs for each order.

-- Display orders placed between October 1 and October 10, 2026

SELECT
    OrderID,
    CustomerID,
    OrderDate,
    OrderStatus
FROM Orders
WHERE OrderDate BETWEEN '2026-10-01' AND '2026-10-10'
ORDER BY OrderDate;

-- BETWEEN limits the results to a specific date range.

-- Find the products with the highest quantities sold

SELECT
    B.BoxID,
    BR.BrandName,
    S.SeriesName,
    Sales.TotalSold
FROM
(
    SELECT
        BoxID,
        SUM(Quantity) AS TotalSold
    FROM OrderItems
    GROUP BY BoxID
) AS Sales
INNER JOIN Box B
    ON Sales.BoxID = B.BoxID
INNER JOIN Brand BR
    ON B.BrandID = BR.BrandID
INNER JOIN Series S
    ON B.SeriesID = S.SeriesID
ORDER BY Sales.TotalSold DESC
LIMIT 10;

-- The subquery totals quantities sold for each product.
-- Results are sorted from highest to lowest sales.

-- Assume QuantitySold represents inventory movement.
-- Shows total quantities sold for each product.

SELECT
    B.BoxID,
    BR.BrandName,
    S.SeriesName,
    SUM(OI.Quantity) AS QuantitySold
FROM Box B
INNER JOIN Brand BR
    ON B.BrandID = BR.BrandID
INNER JOIN Series S
    ON B.SeriesID = S.SeriesID
LEFT JOIN OrderItems OI
    ON B.BoxID = OI.BoxID
GROUP BY
    B.BoxID,
    BR.BrandName,
    S.SeriesName
ORDER BY QuantitySold DESC;

-- SUM() calculates the total quantity sold per product.
-- A real inventory system would subtract sales from stock-on-hand.

-- Retrieve customer contact information

SELECT
    CustomerID,
    FirstName,
    LastName,
    Email,
    Phone,
    Add1,
    Add2,
    City,
    State,
    Zip
FROM Customers
ORDER BY LastName, FirstName;

-- Displays customer contact and address information.

-- Display customer information along with orders

SELECT
    C.CustomerID,
    CONCAT(C.FirstName, ' ', C.LastName) AS CustomerName,
    O.OrderID,
    O.OrderDate,
    O.OrderStatus
FROM Customers C
INNER JOIN Orders O
    ON C.CustomerID = O.CustomerID
ORDER BY O.OrderDate;

-- This query allows the business to track
-- which customers placed which orders.