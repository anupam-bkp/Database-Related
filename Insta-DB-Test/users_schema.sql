CREATE DATABASE IF NOT EXISTS ig_clone;
USE ig_clone;

--
-- Table structure for tables users
--

DROP TABLE IF EXISTS users;

CREATE TABLE users(
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

--
-- Insert some data into users table
--

INSERT INTO users(username) VALUES 
    ('BlueTheCat'), 
    ('CharlieBrown'), 
    ('ColtSteele');   