CREATE DATABASE IF NOT EXISTS ig_clone;
USE ig_clone;

-- dropping tables based on foreign key relationship

DROP TABLE IF EXISTS likes;
DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS photo_tags;
DROP TABLE IF EXISTS photos;
DROP TABLE IF EXISTS follows;
DROP TABLE IF EXISTS users;

-- Table structure for tables users

CREATE TABLE users(
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

-- Table structure for table photos

CREATE TABLE photos (

    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(200) NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

--
-- Create structure for table comments
--

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
-- Structure for follows table
--

CREATE TABLE follows (

    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(id),
    FOREIGN KEY(followee_id) REFERENCES users(id),
    PRIMARY KEY(follower_id, followee_id)
);

--
-- structure for tags
--

-- Due to foreign key relations drop photo-tags table first

DROP TABLE IF EXISTS tags;

CREATE TABLE tags (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    tag_name VARCHAR(200) UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
);

--
-- structure for photo and tags
--

CREATE TABLE photo_tags (

    photo_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(tag_id) REFERENCES tags(id),
    PRIMARY KEY(photo_id, tag_id)
);