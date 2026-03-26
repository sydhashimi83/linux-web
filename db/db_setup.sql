CREATE DATABASE IF NOT EXISTS testdb;

-- Use the database
USE testdb;

-- Create the users table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    date_added TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert demo data
INSERT INTO users (first_name, last_name, email) VALUES
('Ada', 'Lovelace', 'ada@example.com'),
('Alan', 'Turing', 'alan@example.com'),
('Grace', 'Hopper', 'grace@example.com'),
('Ken', 'Thompson', 'ken@example.com'),
('Dennis', 'Ritchie', 'dennis@example.com'),
('Linus', 'Torvalds', 'linus@example.com');
