









-- INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES (1, 1, '2023-01-15');
-- INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES (2, 2, '2023-01-17');



-- INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, PricePerItem) VALUES (1, 1, 1, 1, 1000.00);
-- INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, PricePerItem) VALUES (2, 1, 2, 2, 500.00);
-- INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, PricePerItem) VALUES (3, 2, 1, 1, 1200.00);
-- INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, PricePerItem) VALUES (4, 2, 2, 1, 800.00);

    

CREATE TABLE Exercises (
    ExerciseNum INT,
    ExerciseDes varchar(255)
);

INSERT INTO Exercises (ExerciseNum, ExerciseDes) VALUES (1, 'Retrieve all data from the Products table.');
INSERT INTO Exercises (ExerciseNum, ExerciseDes) VALUES (2, 'Select only the FirstName and LastName columns from the Employees table.');
INSERT INTO Exercises (ExerciseNum, ExerciseDes) VALUES (3, 'Display details of items in the Inventory table that have less than 20 units in stock.');
INSERT INTO Exercises (ExerciseNum, ExerciseDes) VALUES (4, 'Retrieve all data from the Books table.');
INSERT INTO Exercises (ExerciseNum, ExerciseDes) VALUES (5, 'Display the course names and their corresponding department from the Courses table.');
INSERT INTO Exercises (ExerciseNum, ExerciseDes) VALUES (6, 'Retrieve the names of restaurants that have received a rating of "Excellent".');
INSERT INTO Exercises (ExerciseNum, ExerciseDes) VALUES (7, 'Find the total sales amount for each product.');
INSERT INTO Exercises (ExerciseNum, ExerciseDes) VALUES (8, 'Calculate the average price of all products in the Products table.');
INSERT INTO Exercises (ExerciseNum, ExerciseDes) VALUES (9, 'Find the total quantity sold for a specific product such as the product with the id of 1 from the Sales table.');
INSERT INTO Exercises (ExerciseNum, ExerciseDes) VALUES (10, 'Retrieve the maximum and minimum temperature recorded in the WeatherData table.');
INSERT INTO Exercises (ExerciseNum, ExerciseDes) VALUES (11, 'Show the product names and their corresponding order dates.');
INSERT INTO Exercises (ExerciseNum, ExerciseDes) VALUES (12, 'Display the name of each employee and the name of the department they work in.');
INSERT INTO Exercises (ExerciseNum, ExerciseDes) VALUES (13, 'Make the most complicated query you can think of.');
    
-- Exercise #1: Retrieve all data from the Products table.

SELECT ExerciseNum, ExerciseDes
FROM Exercises
WHERE ExerciseNum = 1;

CREATE TABLE Products (
    ProductID int,
    ProductName varchar(255)
);

INSERT INTO Products (ProductID, ProductName) VALUES (1, 'Laptop');
INSERT INTO Products (ProductID, ProductName) VALUES (2, 'Smartphone');


SELECT * FROM Products;


-- Exercise #2: Select only the FirstName and LastName columns from the Employees table.

SELECT ExerciseNum, ExerciseDes
FROM Exercises
WHERE ExerciseNum = 2;

CREATE TABLE Employees (
    EmployeeID int,
    FirstName varchar(255),
    LastName varchar(255)
);


INSERT INTO Employees (EmployeeID, FirstName, LastName) VALUES (1, 'John', 'Doe');
INSERT INTO Employees (EmployeeID, FirstName, LastName) VALUES (2, 'Jane', 'Smith');

SELECT FirstName, LastName
FROM Employees;

-- Exercise #3: Display details of items in the Inventory table that have less than 20 units in stock.

SELECT ExerciseNum, ExerciseDes
FROM Exercises
WHERE ExerciseNum = 3;

CREATE TABLE Inventory (
    ProductID int,
    ProductName varchar(255),
    UnitsInStock int
);

INSERT INTO Inventory (ProductID, ProductName, UnitsInStock) VALUES (1, 'Laptop', 15);
INSERT INTO Inventory (ProductID, ProductName, UnitsInStock) VALUES (2, 'Smartphone', 25);
INSERT INTO Inventory (ProductID, ProductName, UnitsInStock) VALUES (3, 'Tablet', 10);

SELECT *
FROM Inventory
WHERE UnitsInStock < 20;

-- Exercise #4: Retrieve all data from the Books table.

SELECT ExerciseNum, ExerciseDes
FROM Exercises
WHERE ExerciseNum = 4;

CREATE TABLE Books (
    BookID int,
    Title varchar(255),
    Author varchar(255),
    Genre varchar(255),
    PublishedDate date
);

INSERT INTO Books (BookID, Title, Author, Genre, PublishedDate) VALUES (1, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Classic', '1925-04-10');
INSERT INTO Books (BookID, Title, Author, Genre, PublishedDate) VALUES (2, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', '1960-07-11');

SELECT *
FROM Books;

-- Exercise #5: Display the course names and their corresponding department from the Courses table.

SELECT ExerciseNum, ExerciseDes
FROM Exercises
WHERE ExerciseNum = 5;

CREATE TABLE Courses (
    CourseID int,
    CourseName varchar(255),
    Department varchar(255)
);

INSERT INTO Courses (CourseID, CourseName, Department) VALUES (1, 'Introduction to Programming', 'Computer Science');
INSERT INTO Courses (CourseID, CourseName, Department) VALUES (2, 'English Literature', 'English Department');

SELECT CourseName, Department
FROM Courses;

-- Exercise #6: Retrieve the names of restaurants that have received a rating of "Excellent"

SELECT ExerciseNum, ExerciseDes
FROM Exercises
WHERE ExerciseNum = 6;

CREATE TABLE Restaurants (
    RestaurantID int,
    RestaurantName varchar(255),
    Rating varchar(255)
);

INSERT INTO Restaurants (RestaurantID, RestaurantName, Rating) VALUES (1, 'Cuisine Palace', 'Excellent');
INSERT INTO Restaurants (RestaurantID, RestaurantName, Rating) VALUES (2, 'Gourmet Haven', 'Good');
INSERT INTO Restaurants (RestaurantID, RestaurantName, Rating) VALUES (3, 'Savor Delight', 'Excellent');

SELECT RestaurantName
FROM Restaurants
WHERE Rating = 'Excellent';

-- Exercise #7: Find the total sales amount for each product.

SELECT ExerciseNum, ExerciseDes
FROM Exercises
WHERE ExerciseNum = 7;

CREATE TABLE Sales (
    SaleID int,
    ProductID int,
    QuantitySold int,
    SaleAmount float
);

INSERT INTO Sales (SaleID, ProductID, QuantitySold, SaleAmount) VALUES (1, 1, 5, 5000.00);
INSERT INTO Sales (SaleID, ProductID, QuantitySold, SaleAmount) VALUES (2, 2, 3, 1500.00);
INSERT INTO Sales (SaleID, ProductID, QuantitySold, SaleAmount) VALUES (3, 1, 2, 2400.00);

SELECT
    Products.ProductName,
    SUM(Sales.SaleAmount) AS TotalSalesAmount
FROM
    Products
JOIN
    Sales ON Products.ProductID = Sales.ProductID
GROUP BY
    Products.ProductName;

-- Exercise #8: Calculate the average price of all products in the Products table.

SELECT ExerciseNum, ExerciseDes
FROM Exercises
WHERE ExerciseNum = 8;

CREATE TABLE OrderDetails (
    OrderDetailID int,
    OrderID int,
    ProductID int,
    Quantity int,
    PricePerItem float
);

SELECT
    AVG(PricePerItem) AS AveragePrice
FROM
    OrderDetails
WHERE
    ProductID IN (SELECT ProductID FROM Products);
    
-- Exercise #9: Find the total quantity sold for a specific product such as the product with the id of 1 from the Sales table.

SELECT ExerciseNum, ExerciseDes
FROM Exercises
WHERE ExerciseNum = 9;

SELECT
    ProductID,
    SUM(QuantitySold) AS TotalQuantitySold
FROM
    Sales
WHERE
    ProductID = 1;

-- Exercise #10: Retrieve the maximum and minimum temperature recorded in the WeatherData table.

SELECT ExerciseNum, ExerciseDes
FROM Exercises
WHERE ExerciseNum = 10;

CREATE TABLE WeatherData (
    RecordID int,
    Date date,
    MaxTemperature float,
    MinTemperature float
);

INSERT INTO WeatherData (RecordID, Date, MaxTemperature, MinTemperature) VALUES (1, '2023-01-15', 30.5, 15.0);
INSERT INTO WeatherData (RecordID, Date, MaxTemperature, MinTemperature) VALUES (2, '2023-01-16', 28.0, 12.5);

SELECT
    MAX(MaxTemperature) AS MaxRecordedTemperature,
    MIN(MinTemperature) AS MinRecordedTemperature
FROM
    WeatherData;
    
-- Exercise #11: Show the product names and their corresponding order dates.

SELECT ExerciseNum, ExerciseDes
FROM Exercises
WHERE ExerciseNum = 11;

CREATE TABLE Orders (
    OrderID int,
    CustomerID int,
    OrderDate date
);

SELECT
    Products.ProductName,
    Orders.OrderDate
FROM
    Orders
JOIN
    OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN
    Products ON OrderDetails.ProductID = Products.ProductID;


-- Exercise #12: Display the name of each employee and the name of the department they work in.

SELECT ExerciseNum, ExerciseDes
FROM Exercises
WHERE ExerciseNum = 12;

CREATE TABLE Departments (
    DepartmentID int,
    DepartmentName varchar(255)
);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES (1, 'IT');
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES (2, 'HR');

CREATE TABLE EmployeeDepartmentMapping (
    EmployeeID int,
    DepartmentID int
);

INSERT INTO EmployeeDepartmentMapping (EmployeeID, DepartmentID) VALUES (1, 1);
INSERT INTO EmployeeDepartmentMapping (EmployeeID, DepartmentID) VALUES (2, 2);

SELECT
    Employees.FirstName,
    Employees.LastName,
    Departments.DepartmentName
FROM
    Employees
JOIN
    EmployeeDepartmentMapping ON Employees.EmployeeID = EmployeeDepartmentMapping.EmployeeID
JOIN
    Departments ON EmployeeDepartmentMapping.DepartmentID = Departments.DepartmentID;

-- Exercise #13: Make the most complicated query you can think of.

SELECT ExerciseNum, ExerciseDes
FROM Exercises
WHERE ExerciseNum = 13;

CREATE TABLE Customers (
    CustomerID int,
    Name varchar(255),
    Email varchar(255)
);

SELECT
    Customers.Name AS CustomerName,
    Orders.OrderDate,
    Products.ProductName,
    OrderDetails.Quantity,
    OrderDetails.PricePerItem,
    Sales.QuantitySold,
    WeatherData.MaxTemperature,
    Departments.DepartmentName
FROM
    Customers
JOIN
    Orders ON Customers.CustomerID = Orders.CustomerID
JOIN
    OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN
    Products ON OrderDetails.ProductID = Products.ProductID
LEFT JOIN
    Sales ON Products.ProductID = Sales.ProductID
LEFT JOIN
    WeatherData ON Orders.OrderDate = WeatherData.Date
LEFT JOIN
    EmployeeDepartmentMapping ON Customers.CustomerID = EmployeeDepartmentMapping.EmployeeID
LEFT JOIN
    Departments ON EmployeeDepartmentMapping.DepartmentID = Departments.DepartmentID
WHERE
    Customers.CustomerID = 1
ORDER BY
    Orders.OrderDate DESC, Products.ProductName, OrderDetails.Quantity;
