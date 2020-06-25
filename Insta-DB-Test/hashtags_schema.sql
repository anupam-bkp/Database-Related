CREATE DATABASE IF NOT EXISTS ig_clone;
USE ig_clone;

--
-- structure for tags
--

-- Due to foreign key relations drop photo-tags table first
DROP TABLE IF EXISTS photo_tags;

DROP TABLE IF EXISTS tags;

CREATE TABLE tags (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    tag_name VARCHAR(200) UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
);

--
-- some tags
--

INSERT INTO tags(tag_name) VALUES 
('adorable'), ('cute'), ('sunrise');

--
-- structure for photo and tags
--

DROP TABLE IF EXISTS photo_tags;

CREATE TABLE photo_tags (

    photo_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(tag_id) REFERENCES tags(id),
    PRIMARY KEY(photo_id, tag_id)
);

--
-- some photo -tags 
--

INSERT INTO photo_tags(photo_id, tag_id) VALUES 
(1,1), (1,2), (2,3), (3,2);