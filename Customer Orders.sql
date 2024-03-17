
Create database Customers_Orders_Products 

CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  Name VARCHAR(50),
  Email VARCHAR(100)
);

INSERT INTO Customers (CustomerID, Name, Email) VALUES
  (1, 'John Doe', 'johndoe@example.com'),
  (2, 'Jane Smith', 'janesmith@example.com'),
  (3, 'Robert Johnson', 'robertjohnson@example.com'),
  (4, 'Emily Brown', 'emilybrown@example.com'),
  (5, 'Michael Davis', 'michaeldavis@example.com'),
  (6, 'Sarah Wilson', 'sarahwilson@example.com'),
  (7, 'David Thompson', 'davidthompson@example.com'),
  (8, 'Jessica Lee', 'jessicalee@example.com'),
  (9, 'William Turner', 'williamturner@example.com'),
  (10, 'Olivia Martinez', 'oliviamartinez@example.com');


  CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerID INT,
  ProductName VARCHAR(50),
  OrderDate DATE,
  Quantity INT
);

INSERT INTO Orders (OrderID, CustomerID, ProductName, OrderDate, Quantity) VALUES
  (1, 1, 'Product A', '2023-07-01', 5),
  (2, 2, 'Product B', '2023-07-02', 3),
  (3, 3, 'Product C', '2023-07-03', 2),
  (4, 4, 'Product A', '2023-07-04', 1),
  (5, 5, 'Product B', '2023-07-05', 4),
  (6, 6, 'Product C', '2023-07-06', 2),
  (7, 7, 'Product A', '2023-07-07', 3),
  (8, 8, 'Product B', '2023-07-08', 2),
  (9, 9, 'Product C', '2023-07-09', 5),
  (10, 10, 'Product A', '2023-07-10', 1);

CREATE TABLE Products (
  ProductID INT PRIMARY KEY,
  ProductName VARCHAR(50),
  Price DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, ProductName, Price) VALUES
  (1, 'Product A', 10.99),
  (2, 'Product B', 8.99),
  (3, 'Product C', 5.99),
  (4, 'Product D', 12.99),
  (5, 'Product E', 7.99),
  (6, 'Product F', 6.99),
  (7, 'Product G', 9.99),
  (8, 'Product H', 11.99),
  (9, 'Product I', 14.99),
  (10, 'Product J', 4.99);

Select * from Customers

Select name, Email  from Customers
Where name like 'j%'

Select OrderID, ProductName, Quantity from Orders

Select sum(Quantity) from Orders

select name from Customers
join Orders on Orders.CustomerID = Customers.CustomerID

Select * from Products
where Price > 10

select name, OrderDate from Customers
join Orders on Orders.CustomerID = Customers.CustomerID
Where OrderDate >= '20230705'

Select avg(price) from Products

Select * from Customers
Select * from Orders
Select * from Products

select  COUNT(ORDERS.ProductName), sum(orders.quantity) as Total_Quantity, name from Customers
join Orders on Orders.CustomerID = Customers.CustomerID
group by orders.ProductName 

Select orderID, products.ProductName from Orders
join products on products.ProductName = orders.ProductName

SELECt top 5 name, SUM(orders.quantity) AS total_quantity
FROM orders
join Customers on Customers.CustomerID = orders.CustomerID
GROUP BY name
ORDER BY total_quantity DESC

offset 1 rows
fetch next 4 rows only --------- Limit Alternative in SQL Server



select ProductName, avg(price) as Average_Price from Products
GROUP BY ProductName

SELECT * FROM customers
WHERE CustomerID NOT IN ( SELECT CustomerID FROM orders);

Select orders.OrderID, orders.ProductName, orders.Quantity from Orders
join Customers on Orders.CustomerID = Customers.CustomerID
where customers.name like 'm%'

Select name, sum(price) as totalPrice from Products
join orders on orders.ProductName = Products.ProductName
join Customers on Orders.CustomerID = Customers.CustomerID
group by customers.name

Select name, orderID, productname from Orders
join Customers on Orders.CustomerID = Customers.CustomerID
where OrderID in (SELECT OrderID FROM orders)

Select * from Customers
join Orders on Orders.CustomerID = Customers.CustomerID
where OrderID = DATE_ADD(orders.orderdate, INTERVAL -1 day)

select distinct o1.customerID, c.Name
from orders o1
join orders o2 on o1.CustomerID = o2.CustomerID and o1.OrderDate= DATEADD(day,1,o2.OrderDate)
join Customers c on o1.CustomerID = c.CustomerID;


SELECt ProductName, avg(quantity) AS average_quantity FROM Orders
group by ProductName
ORDER BY average_quantity DESC

Select name from Customers
join orders on Orders.CustomerID = Customers.CustomerID
group by Customers.Name

SELECT month(orderdate) AS month_Of_Year, SUM(price) AS total_revenue FROM Orders
join Products on orders.ProductName = Products.ProductName
GROUP BY month_Of_Year
ORDER BY month_Of_Year;


Select Productname, count(quantity) from Orders
Having count(quantity)/2 > 


Select name, (Quantity * price) as Total_Price from customers
join orders on orders.customerID = customers.customerID
join products on products.ProductName = orders.ProductName
group by customers.name
order by Total_Price



