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

295,Roshane Johnson,Ros91,France,Roshane.Johnson@mail.mcgill.ca,1979-9-29,6599740358581336

