-- Module 6 Exercise 1: Customer Sales Data Warehouse (Star Schema)
-- Business process: Customer Sales
-- Grain: daily sales total per customer, per part, per day
-- Facts: amount (daily sales total amount), quantity (daily sales total quantity)

CREATE TABLE Dim_Date (
  DateKey INT NOT NULL,
  FullDate DATE NOT NULL,
  DayOfMonth INT,
  MonthNumber INT,
  MonthName VARCHAR(10),
  Quarter INT,
  Year INT,
  PRIMARY KEY (DateKey)
);

CREATE TABLE Dim_Customer (
  CustomerKey INT NOT NULL,
  CustNumber INT NOT NULL,
  CustName VARCHAR(50),
  Street VARCHAR(50),
  City VARCHAR(30),
  State CHAR(2),
  Zip VARCHAR(10),
  PRIMARY KEY (CustomerKey)
);

CREATE TABLE Dim_Part (
  PartKey INT NOT NULL,
  PartNum VARCHAR(10) NOT NULL,
  PartDesc VARCHAR(50),
  Category VARCHAR(30),
  PRIMARY KEY (PartKey)
);

CREATE TABLE Fact_DailySales (
  DateKey INT NOT NULL,
  CustomerKey INT NOT NULL,
  PartKey INT NOT NULL,
  Quantity INT,
  Amount DECIMAL(10,2),
  PRIMARY KEY (DateKey, CustomerKey, PartKey),
  FOREIGN KEY (DateKey) REFERENCES Dim_Date(DateKey),
  FOREIGN KEY (CustomerKey) REFERENCES Dim_Customer(CustomerKey),
  FOREIGN KEY (PartKey) REFERENCES Dim_Part(PartKey)
);
