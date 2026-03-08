CREATE DATABASE SportShop;
USE SportShop;

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY IDENTITY(1,1),
    full_name VARCHAR(100) NOT NULL,
    position VARCHAR(50) NOT NULL,
    hire_date DATE NOT NULL,
    gender CHAR(1) NOT NULL CHECK (gender IN ('M', 'F')),
    salary DECIMAL(10,2) NOT NULL,
    is_fired BIT NOT NULL DEFAULT 0
);

CREATE TABLE Employees_Archive (
    archive_id INT PRIMARY KEY IDENTITY(1,1),
    employee_id INT NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    position VARCHAR(50) NOT NULL,
    hire_date DATE NOT NULL,
   gender CHAR(1) NOT NULL CHECK (gender IN ('M', 'F')),
    salary DECIMAL(10,2) NOT NULL,
    fired_date DATE NOT NULL
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY IDENTITY(1,1),
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    quantity INT NOT NULL,
    cost_price DECIMAL(10,2) NOT NULL,
    manufacturer VARCHAR(100),
    sale_price DECIMAL(10,2) NOT NULL
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY IDENTITY(1,1),
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20),
    gender CHAR(1) NOT NULL CHECK (gender IN ('M', 'F')),
    discount_percent INT DEFAULT 0,
    subscribed BIT NOT NULL DEFAULT 0
);

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY IDENTITY(1,1),
    product_id INT NOT NULL,
    employee_id INT NOT NULL,
    customer_id INT,
    sale_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    sale_date DATE NOT NULL,

    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

GO

CREATE TRIGGER trg_employee_fired
ON Employees
AFTER UPDATE
AS
BEGIN
    INSERT INTO Employees_Archive (
        employee_id, full_name, position, hire_date, gender, salary, fired_date
    )
    SELECT
        i.employee_id, i.full_name, i.position,
        i.hire_date, i.gender, i.salary, GETDATE()
    FROM inserted i
    JOIN deleted d ON i.employee_id = d.employee_id
    WHERE i.is_fired = 1 AND d.is_fired = 0;
END;