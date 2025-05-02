-- QUESTION 1
-- Create a new table in 1NF format
CREATE TABLE NormalizedOrders (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(50)
);

-- Insert data by splitting the Products column
-- For Order 101 (John Doe)
INSERT INTO NormalizedOrders VALUES (101, 'John Doe', 'Laptop');
INSERT INTO NormalizedOrders VALUES (101, 'John Doe', 'Mouse');

-- For Order 102 (Jane Smith)
INSERT INTO NormalizedOrders VALUES (102, 'Jane Smith', 'Tablet');
INSERT INTO NormalizedOrders VALUES (102, 'Jane Smith', 'Keyboard');
INSERT INTO NormalizedOrders VALUES (102, 'Jane Smith', 'Mouse');

-- For Order 103 (Emily Clark)
INSERT INTO NormalizedOrders VALUES (103, 'Emily Clark', 'Phone');

-- QUESTION 2
-- Create Orders table (contains order information)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Create OrderItems table (contains product information for each order)
CREATE TABLE OrderItems (
    OrderItemID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert data into Orders table
INSERT INTO Orders (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;

-- Insert data into OrderItems table
INSERT INTO OrderItems (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OrderDetails;
