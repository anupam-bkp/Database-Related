CREATE DATABASE IF NOT EXISTS ig_clone;
USE ig_clone;

--
-- Creating structure for likes
--
-- Notice the usage of composite key
--

DROP TABLE IF EXISTS likes;

CREATE TABLE likes (

    user_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    PRIMARY KEY(user_id, photo_id)
);

--
-- Insert some likes
--

INSERT INTO likes(user_id, photo_id) VALUES
(1,1),
(2,1),
(1,2),
(1,3),
(3,3);

-- won't work because of primary key constraint
-- INSERT INTO likes(user_id, photo_id) VALUES (1, 1);