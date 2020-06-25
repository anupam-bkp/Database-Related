--
-- Create database if not already created
--

CREATE DATABASE IF NOT EXISTS ig_clone;
USE ig_clone;

--
-- Table structure for table photos
--

DROP TABLE IF EXISTS photos;

CREATE TABLE photos (

    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(200) NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

--
-- Insert some photo 
--

INSERT INTO photos(image_url, user_id) VALUES
('/photo1', 1),
('/photo2', 2),
('/photo3', 2);