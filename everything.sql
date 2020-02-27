
-- ************* SUMMARY ************* --
-- 1. Drop tables (reset)
-- 2. Create Entity and Relation sets
-- 3. Insert statements

-- ************* Reset all tables ************* --
DROP TABLE users CASCADE;
DROP TABLE listeners CASCADE;
DROP TABLE artists CASCADE;
DROP TABLE libraries CASCADE;
DROP TABLE playlists CASCADE;
DROP TABLE articles CASCADE;
DROP TABLE albums CASCADE;
DROP TABLE songs CASCADE;
DROP TABLE shopping_carts CASCADE;

DROP TABLE Releases CASCADE;
DROP TABLE BelongsTo CASCADE;
DROP TABLE ComprisesOf CASCADE;
DROP TABLE IsAddedTo CASCADE;
DROP TABLE IsPartOf CASCADE;
DROP TABLE Contains CASCADE;
DROP TABLE Uses CASCADE;
DROP TABLE Creates CASCADE;
DROP TABLE moneyEarned CASCADE;


-- ************* ENTITY SETS ************* --
CREATE TABLE users (
	uid INTEGER NOT NULL,
	name VARCHAR(30)
	username VARCHAR(20),
	country VARCHAR(15),
	email VARCHAR(25), 
	dob DATE, 
	credit_info VARCHAR(30),
	PRIMARY KEY(uid)
);


CREATE TABLE listeners ( 
	uid INTEGER NOT NULL,
	PRIMARY KEY(uid),
	FOREIGN KEY(uid) REFERENCES users(uid)
);


CREATE TABLE artists (
	uid INTEGER NOT NULL,
	stage_name VARCHAR (10),
	balance FLOAT(7),
	PRIMARY KEY(uid),
	FOREIGN KEY(uid) REFERENCES users(uid)
);


CREATE TABLE libraries(
	lib_id INTEGER NOT NULL,
	num_songs INT,
	PRIMARY KEY(lib_id)
);

CREATE TABLE playlists(
	name VARCHAR(30),
	status VARCHAR(10),
	num_songs INT,
	PRIMARY KEY(name),
	FOREIGN KEY(lib_id) REFERENCES libraries
);

CREATE TABLE articles(
	article_id INTEGER NOT NULL,
	title VARCHAR(30), 
	release_date DATE, 
	price FLOAT (4), 
	genre VARCHAR (30),
	PRIMARY KEY (article_id)
);

CREATE TABLE albums(
	article_id INTEGER NOT NULL,
	type VARCHAR (20),
	PRIMARY KEY (article_id),
	FOREIGN KEY(article_id) REFERENCES articles
);

CREATE TABLE songs(
	article_id INTEGER NOT NULL,
	duration VARCHAR(6),
	PRIMARY KEY (article_id),
	FOREIGN KEY(article_id) REFERENCES articles
);

CREATE TABLE shopping_carts(
	order_id INTEGER NOT NULL, 
	total_amount FLOAT (4),
	num_articles INT,
	PRIMARY KEY (order_id)
);



-- ************* RELATION SETS ************* --

CREATE TABLE Releases ( 
	artist_id INTEGER NOT NULL,
	article_id INTEGER NOT NULL,
	PRIMARY KEY(artist_id, article_id),
	FOREIGN KEY(artist_id) REFERENCES artists(uid),
	FOREIGN KEY(article_id) REFERENCES articles
);

CREATE TABLE BelongsTo ( 
	song_id INTEGER NOT NULL,
	album_id INTEGER NOT NULL,
	PRIMARY KEY(song_id, album_id),
	FOREIGN KEY(song_id) REFERENCES songs(article_id),
	FOREIGN KEY(album_id) REFERENCES albums(article_id)
);

CREATE TABLE ComprisesOf ( 
	lib_id INTEGER NOT NULL,
	name VARCHAR(30),
	PRIMARY KEY(lib_id, name),
	FOREIGN KEY(lib_id) REFERENCES libraries,
	FOREIGN KEY(name) REFERENCES playlists
);

CREATE TABLE IsAddedTo ( 
	article_id INTEGER NOT NULL,
	lib_id INTEGER NOT NULL,
	PRIMARY KEY(article_id, lib_id),
	FOREIGN KEY(article_id) REFERENCES articles,
	FOREIGN KEY(lib_id) REFERENCES libraries
);

CREATE TABLE IsPartOf (
	name VARCHAR(30),
	lib_id INTEGER NOT NULL,
	PRIMARY KEY(name, lib_id),
	FOREIGN KEY(name) REFERENCES playlists,
	FOREIGN KEY(lib_id) REFERENCES libraries
);

CREATE TABLE Contains ( 
	order_id INTEGER NOT NULL, 
	article_id INTEGER NOT NULL,
	PRIMARY KEY(order_id, article_id),
	FOREIGN KEY(order_id) REFERENCES shopping_carts,
	FOREIGN KEY(article_id) REFERENCES articles
);

CREATE TABLE Uses ( 
	listener_id INTEGER NOT NULL,
	order_id INTEGER NOT NULL, 
	PRIMARY KEY(listener_id, order_id),
	FOREIGN KEY(listener_id) REFERENCES listeners(uid),
	FOREIGN KEY(order_id) REFERENCES shopping_carts
);

CREATE TABLE Creates ( 
	listener_id INTEGER NOT NULL,
	lib_id INTEGER NOT NULL,
	name VARCHAR(30),
	PRIMARY KEY(listener_id, lib_id, name),
	FOREIGN KEY(listener_id) REFERENCES listeners(uid),
	FOREIGN KEY(lib_id) REFERENCES libraries,
	FOREIGN KEY(name) REFERENCES playlist
);

CREATE TABLE moneyEarned ( 
	artist_id INTEGER NOT NULL,
	order_id INTEGER NOT NULL, 
	money_received FLOAT (4),
	PRIMARY KEY(artist_id, order_id),
	FOREIGN KEY(artist_id) REFERENCES artists(uid),
	FOREIGN KEY(order_id) REFERENCES shopping_carts
);







