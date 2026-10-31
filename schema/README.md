# Phase 4 — Schema


-- ============================================================
-- CS273 Baseball Card Database Schema
-- Author: [Kaden Crane]   Date: Oct 2026
-- ============================================================

DROP DATABASE IF EXISTS BaseballCardDB;
CREATE DATABASE BaseballCardDB;
USE BaseballCardDB;

-- PARENT TABLE 1: Customers
CREATE TABLE Customers (
    CustomerID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(254) NULL UNIQUE,
    Phone VARCHAR(20) NULL UNIQUE,
    Add1 VARCHAR(50) NOT NULL,
     Add2 VARCHAR(50) NULL,
     City VARCHAR(20) NOT NULL,
     State CHAR(2) NOT NULL,
     Zip VARCHAR(10) NOT NULL,
    CONSTRAINT chk_email CHECK (Email LIKE '%@%')
);

-- PARENT TABLE 2: Brand
CREATE TABLE Brand (
    BrandID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    BrandName VARCHAR(50) NOT NULL
);

-- PARENT TABLE 3: Series
CREATE TABLE Series (
    SeriesID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    SeriesName VARCHAR(50) NOT NULL
);

-- CHILD TABLE: Box
CREATE TABLE Box (
    BoxID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    BrandID INT UNSIGNED,
    SeriesID INT UNSIGNED,
    Type VARCHAR(50) NULL,
    PksPerBox FLOAT NOT NULL,
    CardsPerPack DOUBLE NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
CONSTRAINT fk_box_brand
    FOREIGN KEY (BrandID)
    REFERENCES Brand(BrandID)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
CONSTRAINT fk_box_series
    FOREIGN KEY (SeriesID)
    REFERENCES Series(SeriesID)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
    
    
);

-- CHILD TABLE: Order
CREATE TABLE Orders (
    OrderID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT UNSIGNED,
    OrderDate DATE,
    OrderStatus VARCHAR(50) NOT NULL DEFAULT 'Pending',
  CONSTRAINT fk_order_customers
    FOREIGN KEY (CustomerID)
    REFERENCES Customers(CustomerID)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
   CONSTRAINT chk_OrderStatus 
   CHECK (OrderStatus IN ('Pending', 'Shipped', 'Delivered'))
);

-- CHILD TABLE: Payment
CREATE TABLE Payment (
    PaymentID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    OrderID INT UNSIGNED NOT NULL,
    PaymentDate DATE,
    Amount DECIMAL(10,2),
    PaymentMethod VARCHAR(50),
    PaymentStatus VARCHAR(50) NOT NULL DEFAULT 'Pending',
  CONSTRAINT fk_payment_order  FOREIGN KEY (OrderID)
    REFERENCES Orders(OrderID)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT chk_PaymentStatus 
  CHECK (PaymentStatus IN ('Pending', 'Denied', 'Approved'))
);

-- LINKING TABLE: OrderItems

CREATE TABLE OrderItems (
    OrderID   INT UNSIGNED    NOT NULL AUTO_INCREMENT,
    BoxID    INT UNSIGNED    NOT NULL,
    CONSTRAINT pk_orderitems           PRIMARY KEY (OrderID, BoxID),
    CONSTRAINT fk_orderitem_order      FOREIGN KEY (OrderID)
        REFERENCES Orders(OrderID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT fk_orderitems_box    FOREIGN KEY (BoxID)
        REFERENCES Box(BoxID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);
