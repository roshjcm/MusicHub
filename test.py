print("Yo!")
#sdfijdslkfjsdlkfgjdflgkdjfgslfgkj

-- *********** IMPORTING USERS.CSV TO A TABLE ***************
--This command should work in PostGres
COPY users(uid,name,username,country,email,dob,credit_info) FROM './datasets/users.csv' DELIMITERS ',' CSV HEADER;
--COPY songs(duration,article_id) FROM './datasets/songs.csv' DELIMITERS ',' CSV HEADER;
--COPY albums(type,article_id) FROM './datasets/albums.csv' DELIMITERS ',' CSV HEADER;



-- *********** IMPORTING ARTICLES.CSV TO A TABLE ***************
-- # is for temporary tables (If you have Sublime Text, you might see it as a comment...Don't worry PostGres should know it isn't one)
CREATE TABLE #t1 (
	ISA INTEGER, 
	title VARCHAR(30), 
	genre VARCHAR (30),
	release_date DATE, 
	price FLOAT (4), 
	article_id INTEGER,
);

COPY #t1 (ISA,title,genre, release_date,price,article_id) FROM './datasets/articles.csv' DELIMITERS ',' CSV HEADER;
INSERT INTO articles(article_id,title,release_date,price,genre)
SELECT article_id,title,release_date,price,genre
FROM #t1
DROP TABLE #t1



-- *********** IMPORTING ALBUMS.CSV TO A TABLE ***************
CREATE TABLE #t2 (
	title VARCHAR(30), 
	type VARCHAR(20), 
	article_id INTEGER,
);
COPY #t2 (title,type,article_id) FROM './datasets/albums.csv' DELIMITERS ',' CSV HEADER;
INSERT INTO albums(type,article_id)
SELECT type, article_id
FROM #t2
DROP TABLE #t2



-- *********** IMPORTING SONGS.CSV TO A TABLE ***************
CREATE TABLE #t3 (
	title VARCHAR(30), 
	duration VARCHAR(6),
	article_id INTEGER,
);
COPY #t3 (title,duration,article_id) FROM './datasets/songs.csv' DELIMITERS ',' CSV HEADER;
INSERT INTO songs(duration,article_id)
SELECT duration, article_id
FROM #t3
DROP TABLE #t3



	if (table=="users"):
		insert="INSERT INTO users(uid,name,username,country,email,dob,credit_info) values"
	elif (table=="listeners"):
		insert="INSERT INTO listeners(uid) values"
	elif table=="artists":
		insert="INSERT INTO artists(uid,stage_name,balance) values"
	elif table=="libraries":
		insert="INSERT INTO libraries(libid,num_songs) values"
	elif table=="playlists":
		insert="INSERT INTO playlists(name,status,num_songs,libid) values"
	elif table=="articles":
		insert="INSERT INTO articles(article_id,title,release_date,price,genre) values"
	elif table=="albums":
		insert="INSERT INTO albums(article_id,type) values"
	elif table=="songs":
		insert="INSERT INTO songs(article_id,duration) values"
	elif table=="shopping_carts":		
		insert="INSERT INTO shopping_carts(order_id,total_amount,num_articles) values"
	elif table=="Releases":
		insert="INSERT INTO Releases(artist_id,article_id) values"
	elif table=="BelongsTo":
		insert="INSERT INTO BelongsTo(song_id,album_id) values"
	elif table=="ComprisesOf":
		insert="INSERT INTO ComprisesOf(lib_id,name) values"
	elif table=="IsAddedTo":
		insert="INSERT INTO IsAddedTo(article_id,lib_id) values"
	elif table=="IsPartOf":
		insert="INSERT INTO IsPartOf(name,lib_id) values"
	elif table=="Contains":
		insert="INSERT INTO Contains(order_id, article_id) values"
	elif table=="Uses":
		insert="INSERT INTO Uses(listener_id,order_id) values"
	elif table=="Creates":
		insert="INSERT INTO Creates(listener_id,lib_id,name) values"
	elif table=="moneyEarned":
		insert="INSERT INTO moneyEarned(artist_id,order_id,money_received) values"
	elif table=="Has":
		insert="INSERT INTO Has(listener_id,lib_id) values"