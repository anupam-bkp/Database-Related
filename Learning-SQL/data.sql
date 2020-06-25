CREATE TABLE cats 
	(
		cat_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
		name VARCHAR(30),
		breed VARCHAR(30),
		age INT
	);

INSERT INTO cats(name, breed, age) VALUES
	('Ringo', 'Tabby', 4),
	('Cindy', 'Maine Coon', 10), 
	('Dumbledore', 'Maine Coon', 11), 
	('Egg', 'Persian', 4);

SELECT * FROM cats; 
