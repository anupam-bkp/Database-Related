CREATE DATABASE IF NOT EXISTS ig_clone;
USE ig_clone;

--
-- Create structure for table comments
--

DROP TABLE IF EXISTS comments;

CREATE TABLE comments (

    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(250) NOT NULL,
    user_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id)
);

--
-- Insert some comments
--

INSERT INTO comments (comment_text, user_id, photo_id) VALUES
('This is Photo2', 1, 2),
('This is Photo2', 3, 2),
('This is Photo1', 2, 1);
