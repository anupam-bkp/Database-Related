-- Find the 5 oldest users.

-- SELECT * FROM users 
--     ORDER BY created_at 
--     LIMIT 5;

-- Find most popular resgistration day

-- SELECT  
--     DAYNAME(created_at) AS dayName,
--     COUNT(*) AS total 
--     FROM users
--     GROUP BY dayName 
--     ORDER BY total DESC
--     LIMIT 1; 

-- Find inactive user (users with no photos)

-- SELECT username AS Inactive_user
--     FROM users 
--     LEFT JOIN photos 
--         ON users.id = photos.user_id
--     WHERE photos.id IS NULL;

-- Most liked photo and its user

-- SELECT users.id, username, 
--     photos.id, image_url, 
--     COUNT(*) AS total_pics
--     FROM photos
--     INNER JOIN likes
--         ON photos.id = likes.photo_id
--     INNER JOIN users
--         ON users.id = photos.user_id
--     GROUP BY photos.id
--     ORDER BY total_pics DESC
--     LIMIT 1; 

-- average number of photo per user

-- SELECT 
--     (SELECT COUNT(*) from photos) / (SELECT COUNT(*) FROM users) 
-- AS average_photo_per_user;

-- five commonly used hashtags

-- SELECT tag_name, COUNT(*) AS total
--     FROM photo_tags
--     INNER JOIN tags 
--         ON photo_tags.tag_id = tags.id
--     GROUP BY tags.id 
--     ORDER BY total DESC
--     LIMIT 5;

-- Find the bot - user who liked every single photo

SELECT username, 
    COUNT(*) total_likes
    FROM users 
    INNER JOIN likes
        ON users.id = likes.user_id
    GROUP BY likes.user_id
    HAVING total_likes = (SELECT COUNT(*) FROM photos);


