CREATE DATABASE IF NOT EXISTS ig_clone;
USE ig_clone;

--
-- Structure for follows table
--

DROP TABLE IF EXISTS follows;

CREATE TABLE follows (

    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(id),
    FOREIGN KEY(followee_id) REFERENCES users(id),
    PRIMARY KEY(follower_id, followee_id)
);

--
--  Insert some relationships
--

INSERT INTO follows(follower_id, followee_id) VALUES 
(1,2),
(1,3),
(3,1),
(2,3);