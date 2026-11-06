# Phase 5 — Queries
## Queries for Mission Statement
## Phase 5A JOIN Queries
## Q1
-- Retrieve all orders placed by CustomerID = 1.
-- The query joins the Customers table with the Orders table
-- so customer information can be displayed alongside order information.

SELECT
    C.CustomerID,
    C.FirstName,
    C.LastName,
    O.OrderID,
    O.OrderDate,
    O.OrderStatus
FROM Customers C
INNER JOIN Orders O
    ON C.CustomerID = O.CustomerID
WHERE C.CustomerID = 1;

-- INNER JOIN matches customers with their orders.
-- WHERE limits the results to only CustomerID 1.

## Q2
-- Display which products are included in each order,
-- the quantity ordered, the price per item,
-- and the total cost for each line item.

SELECT
    O.OrderID,
    O.OrderDate,
    B.BoxID,
    B.Type AS Product,
    OI.Quantity,
    OI.UnitPrice,
    (OI.Quantity * OI.UnitPrice) AS LineTotal
FROM Orders O
INNER JOIN OrderItems OI
    ON O.OrderID = OI.OrderID
INNER JOIN Box B
    ON OI.BoxID = B.BoxID
ORDER BY O.OrderID, B.Type;

-- The first INNER JOIN connects orders to the items within each order.
-- The second INNER JOIN connects each item to its product information.
-- LineTotal calculates the cost of each product line by multiplying
-- Quantity by UnitPrice.
-- ORDER BY groups results by OrderID and sorts products alphabetically.

## Q3
-- Calculate the total dollar amount for each order.
-- SUM() is an aggregate function that adds together
-- all item totals belonging to the same order.

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

-- Quantity * UnitPrice calculates the value of each order item.
-- SUM() adds all item values within the same order.
-- GROUP BY creates one result row per order.
-- ORDER BY sorts orders from earliest to latest date.

-- Q4
-- Retrieve all orders placed during October 2026.
-- Customer information is included so it is easy
-- to identify who placed each order.

SELECT
    O.OrderID,
    CONCAT(C.FirstName, ' ', C.LastName) AS CustomerName,
    O.OrderDate,
    O.OrderStatus
FROM Customers C
LEFT JOIN Orders O
    ON C.CustomerID = O.CustomerID
WHERE O.OrderDate BETWEEN '2026-10-01' AND '2026-10-31'
ORDER BY O.OrderDate;

-- LEFT JOIN connects customers with their orders.
-- CONCAT combines first and last names into a single column.
-- BETWEEN filters orders within the specified date range.
-- ORDER BY displays orders chronologically.

## Q5
-- Determine the top-selling products based on quantity sold.
-- SUM() totals the number of units sold for each product.

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

-- INNER JOINs connect orders, order items, and product information.
-- SUM(OI.Quantity) calculates the total number of units sold.
-- GROUP BY creates a separate total for each product.
-- ORDER BY DESC sorts products from highest sales to lowest.
-- LIMIT 10 returns only the ten best-selling products.

## Q6
-- Track the current inventory level of each product.
-- This query displays each product and the total quantity sold.
-- A business could compare this value against inventory on hand
-- to determine current stock levels.

SELECT
    B.BoxID,
    BR.BrandName,
    S.SeriesName,
    B.Type AS Product,
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
    S.SeriesName,
    B.Type
ORDER BY QuantitySold DESC;

-- The Brand and Series tables provide product details.
-- LEFT JOIN includes products even if they have not been sold.
-- SUM() totals the quantity sold for each product.

## Q7:
-- Record the name, address, and contact information for each customer.
-- This query retrieves customer information along with the number
-- of orders each customer has placed.

SELECT
    C.CustomerID,
    C.FirstName,
    C.LastName,
    C.Email,
    C.Phone,
    C.Add1,
    C.City,
    C.State,
    C.Zip,
    COUNT(O.OrderID) AS TotalOrders
FROM Customers C
LEFT JOIN Orders O
    ON C.CustomerID = O.CustomerID
GROUP BY
    C.CustomerID,
    C.FirstName,
    C.LastName,
    C.Email,
    C.Phone,
    C.Add1,
    C.City,
    C.State,
    C.Zip
ORDER BY C.LastName;

-- LEFT JOIN ensures customers are displayed even if they have not placed orders.
-- COUNT() calculates the number of orders associated with each customer.

## Q8
-- Help an online business maintain a detailed list of customer orders.
-- This query displays customer information, order details,
-- products purchased, and quantities ordered.

SELECT
    C.CustomerID,
    CONCAT(C.FirstName, ' ', C.LastName) AS CustomerName,
    O.OrderID,
    O.OrderDate,
    O.OrderStatus,
    B.Type AS Product,
    OI.Quantity,
    OI.UnitPrice
FROM Customers C
INNER JOIN Orders O
    ON C.CustomerID = O.CustomerID
INNER JOIN OrderItems OI
    ON O.OrderID = OI.OrderID
INNER JOIN Box B
    ON OI.BoxID = B.BoxID
ORDER BY
    O.OrderDate,
    O.OrderID;

-- Joins connect customers, orders, products, and order items.
-- This provides a complete view of who purchased what product,
-- when the purchase was made, and the quantity ordered.
-- The results help the business track purchasing activity.

## Phase 5B Aggregate functions

## Q1

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

## Q2

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

## Q3

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

 ## Q4

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

## Q5

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

## Q6
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

## Q7
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

## Q8
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
