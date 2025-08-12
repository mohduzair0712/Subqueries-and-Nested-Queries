CREATE DATABASE practice_db;
USE practice_db;

-- Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO Customers VALUES
(101, 'Amit', 'Lucknow'),
(102, 'Irfan', 'Mumbai'),
(103, 'Afzal', 'Pune'),
(104, 'salman', 'Delhi');


-- Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_amount DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);


-- Orders
INSERT INTO Orders VALUES
(1, 101, 500.00, '2025-01-10'),
(2, 102, 1200.00, '2025-02-15'),
(3, 103, 700.00, '2025-03-05'),
(4, 101, 1500.00, '2025-04-12'),
(5, 104, 900.00, '2025-05-25');


-- Products table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10,2)
);

-- Products
INSERT INTO Products VALUES
(201, 'Laptop', 800.00),
(202, 'Smartphone', 500.00),
(203, 'Headphones', 150.00),
(204, 'Keyboard', 50.00);


CREATE TABLE OrderDetails (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- OrderDetails
INSERT INTO OrderDetails VALUES
(1, 1, 201, 1),
(2, 2, 202, 2),
(3, 3, 203, 3),
(4, 4, 201, 1),
(5, 4, 202, 1),
(6, 5, 204, 5);


SELECT customer_name, order_amount
FROM Customers
JOIN Orders ON Customers.customer_id = Orders.customer_id
WHERE order_amount = (
    SELECT MAX(order_amount)
    FROM Orders
);

SELECT MAX(order_amount) FROM Orders;