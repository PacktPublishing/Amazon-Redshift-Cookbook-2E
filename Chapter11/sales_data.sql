-- Create Customers table
CREATE TABLE customers (
    customer_id INTEGER ,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20),
    address VARCHAR(200),
    created_at TIMESTAMP
);

-- Create Products table
CREATE TABLE products (
    product_id INTEGER ,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock_quantity INTEGER,
    created_at TIMESTAMP
);

-- Create Orders table
CREATE TABLE orders (
    order_id INTEGER ,
    customer_id INTEGER ,
    order_date TIMESTAMP,
    status VARCHAR(20),
    total_amount DECIMAL(10,2)
);

-- Create Order Items table
CREATE TABLE order_items (
    order_item_id INTEGER ,
    order_id INTEGER ,
    product_id INTEGER ,
    quantity INTEGER,
    unit_price DECIMAL(10,2),
    subtotal DECIMAL(10,2)
);

-- Insert sample data into Customers
INSERT INTO customers VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '555-0101', '123 Main St', '2024-01-01 10:00:00'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '555-0102', '456 Oak Ave', '2024-01-02 11:30:00'),
(3, 'Bob', 'Johnson', 'bob.j@email.com', '555-0103', '789 Pine Rd', '2024-01-03 09:15:00');

-- Insert sample data into Products
INSERT INTO products VALUES
(1, 'Laptop', 'Electronics', 999.99, 50, '2024-01-01 08:00:00'),
(2, 'Smartphone', 'Electronics', 599.99, 100, '2024-01-01 08:00:00'),
(3, 'Headphones', 'Accessories', 89.99, 200, '2024-01-01 08:00:00');

-- Insert sample data into Orders
INSERT INTO orders VALUES
(1, 1, '2024-01-15 14:30:00', 'Completed', 1089.98),
(2, 2, '2024-01-16 16:45:00', 'Completed', 599.99),
(3, 3, '2024-01-17 11:20:00', 'Processing', 179.98);

-- Insert sample data into Order Items
INSERT INTO order_items VALUES
(1, 1, 1, 1, 999.99, 999.99),
(2, 1, 3, 1, 89.99, 89.99),
(3, 2, 2, 1, 599.99, 599.99),
(4, 3, 3, 2, 89.99, 179.98);

-- Sample query to get order details
SELECT 
    o.order_id,
    c.first_name || ' ' || c.last_name as customer_name,
    p.product_name,
    oi.quantity,
    oi.unit_price,
    oi.subtotal,
    o.order_date,
    o.status
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;
