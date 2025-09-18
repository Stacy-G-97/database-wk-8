-- Create Database
CREATE DATABASE EcommerceDB;
USE EcommerceDB;

-- Customers Table
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Products Table
CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Orders Table
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled') DEFAULT 'Pending',
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- OrderDetails (Many-to-Many between Orders & Products)
CREATE TABLE OrderDetails (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    UNIQUE(order_id, product_id)
);

-- Payments Table
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(10,2) NOT NULL,
    payment_method ENUM('Credit Card', 'Debit Card', 'Mpesa', 'Bank Transfer', 'Cash') NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Shipping Table
CREATE TABLE Shipping (
    shipping_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL UNIQUE,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    country VARCHAR(100) NOT NULL,
    shipped_date TIMESTAMP NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

--------------------------------------------------------
-- INSERT SAMPLE DATA
--------------------------------------------------------

-- Customers
INSERT INTO Customers (first_name, last_name, email, phone) VALUES
('Alice', 'Johnson', 'alice@gmail.com', '0712345678'),
('Bob', 'Smith', 'bob@gmail.com', '0723456789'),
('Charlie', 'Brown', 'charlie@gmail.com', '0734567890');

-- Products
INSERT INTO Products (name, description, price, stock_quantity) VALUES
('Laptop', 'HP', 750.00, 10),
('Smartphone', 'Samsung Galaxy S22', 1200.00, 15),
('Headphones', 'Oraimo', 300.00, 25),
('Keyboard', 'Mechanical Keyboard', 85.00, 50),
('Mouse', 'Wireless Mouse', 40.00, 40);

-- Orders
INSERT INTO Orders (customer_id, status) VALUES
(1, 'Pending'),
(2, 'Shipped'),
(3, 'Delivered');

-- OrderDetails
INSERT INTO OrderDetails (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 750.00),  
(1, 5, 2, 40.00),   
(2, 2, 1, 1200.00), 
(3, 3, 1, 300.00),  
(3, 4, 1, 85.00);   

-- Payments
INSERT INTO Payments (order_id, amount, payment_method) VALUES
(1, 830.00, 'Credit Card'),
(2, 1200.00, 'Mpesa'),
(3, 385.00, 'Cash');

-- Shipping
INSERT INTO Shipping (order_id, address, city, postal_code, country, shipped_date) VALUES
(1, 'Kimathi St.', 'Nairobi', '00100', 'Kenya', NULL),
(2, 'Babadogo', 'Kisumu', '40100', 'Kenya', '2025-09-15 10:00:00'),
(3, 'Makongeni', 'Mombasa', '80100', 'Kenya', '2025-09-12 14:30:00');
