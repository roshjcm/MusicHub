
/* Entity Sets */

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
	FOREIGN KEY(uid) REFERENCES users(uid)
);


CREATE TABLE artists (
	stage_name VARCHAR (10),
	balance FLOAT(7),
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
	type VARCHAR (20),
	FOREIGN KEY(article_id) REFERENCES articles
);

CREATE TABLE songs(
	duration VARCHAR(6),
	FOREIGN KEY(article_id) REFERENCES articles
);

CREATE TABLE shopping_carts(
	order_id INTEGER NOT NULL, 
	total_amount FLOAT (4),
	num_articles INT,
	PRIMARY KEY (order_id)
);



/* Relation sets */

CREATE TABLE Releases ( 
	FOREIGN KEY(artist_id) REFERENCES artists(uid),
	FOREIGN KEY(article_id) REFERENCES articles
);

CREATE TABLE BelongsTo ( 
	FOREIGN KEY(song_id) REFERENCES songs(article_id),
	FOREIGN KEY(album_id) REFERENCES albums(article_id)
);

CREATE TABLE ComprisesOf ( 
	FOREIGN KEY(lib_id) REFERENCES libraries,
	FOREIGN KEY(name) REFERENCES playlists
);

CREATE TABLE IsAddedTo ( 
	FOREIGN KEY(articl_id) REFERENCES articles,
	FOREIGN KEY(lib_id) REFERENCES libraries
);

CREATE TABLE IsPartOf ( 
	FOREIGN KEY(name) REFERENCES playlist,
	FOREIGN KEY(lib_id) REFERENCES libraries
);

CREATE TABLE Contains ( 
	FOREIGN KEY(order_id) REFERENCES shopping_carts,
	FOREIGN KEY(article_id) REFERENCES articles
);

CREATE TABLE Uses ( 
	FOREIGN KEY(listener_id) REFERENCES listeners(uid),
	FOREIGN KEY(order_id) REFERENCES shopping_carts
);

CREATE TABLE Creates ( 
	FOREIGN KEY(listener_id) REFERENCES listeners(uid),
	FOREIGN KEY(lib_id) REFERENCES libraries,
	FOREIGN KEY(name) REFERENCES playlist
);

CREATE TABLE moneyEarned ( 
	FOREIGN KEY(artist_id) REFERENCES artists(uid),
	FOREIGN KEY(order_id) REFERENCES shopping_carts,
	money_received FLOAT (4)
);







