
-- ************* Reset all tables ************* --
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS listeners CASCADE;
DROP TABLE IF EXISTS artists CASCADE;
DROP TABLE IF EXISTS libraries CASCADE;
DROP TABLE IF EXISTS playlists CASCADE;
DROP TABLE IF EXISTS articles CASCADE;
DROP TABLE IF EXISTS albums CASCADE;
DROP TABLE IF EXISTS songs CASCADE;
DROP TABLE IF EXISTS shopping_carts CASCADE;

DROP TABLE IF EXISTS Releases CASCADE;
DROP TABLE IF EXISTS BelongsTo CASCADE;
DROP TABLE IF EXISTS ComprisesOf CASCADE;
DROP TABLE IF EXISTS IsAddedTo CASCADE;
DROP TABLE IF EXISTS IsPartOf CASCADE;
DROP TABLE IF EXISTS Contains CASCADE;
DROP TABLE IF EXISTS Uses CASCADE;
DROP TABLE IF EXISTS Creates CASCADE;
DROP TABLE IF EXISTS moneyEarned CASCADE;
DROP TABLE IF EXISTS Has CASCADE;


-- ************* ENTITY SETS ************* --
CREATE TABLE users (
	uid INTEGER NOT NULL,
	name VARCHAR(30),
	username VARCHAR(20),
	country VARCHAR(15),
	email VARCHAR(35), 
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
	stage_name VARCHAR (20),
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
	lib_id INTEGER NOT NULL,
	PRIMARY KEY(name),
	FOREIGN KEY(lib_id) REFERENCES libraries
);

CREATE TABLE articles(
	article_id INTEGER NOT NULL,
	title VARCHAR(50), 
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
	total_amount FLOAT (5),
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
	song_id INTEGER NOT NULL,
	PRIMARY KEY(lib_id, name, song_id),
	FOREIGN KEY(lib_id) REFERENCES libraries,
	FOREIGN KEY(name) REFERENCES playlists,
	FOREIGN KEY(song_id) REFERENCES songs(article_id)
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
	FOREIGN KEY(name) REFERENCES playlists
);

CREATE TABLE moneyEarned ( 
	artist_id INTEGER NOT NULL,
	order_id INTEGER NOT NULL, 
	money_received FLOAT (4),
	PRIMARY KEY(artist_id, order_id),
	FOREIGN KEY(artist_id) REFERENCES artists(uid),
	FOREIGN KEY(order_id) REFERENCES shopping_carts
);

CREATE TABLE Has(
	listener_id INTEGER NOT NULL,
	lib_id INTEGER NOT NULL,
	PRIMARY KEY(listener_id,lib_id),
	FOREIGN KEY(listener_id) REFERENCES listeners(uid),
	FOREIGN KEY(lib_id) REFERENCES libraries
);





INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (89,'Kyra Jones','Kyr13','Spain','Kyra.Jones@yahoo.com','1952-12-01',2492713153623526);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (13,'Maanav Patel','Maa92','United States','Maanav.Patel@mail.mcgill.ca','1974-07-14',6557895804602079);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (334,'Magnus Kourilsky','Mag138','France','Magnus.Kourilsky@yahoo.com','1950-01-11',9547767406951721);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (329,'Karim Angelo','Kar66','Vietnam','Karim.Angelo@mail.mcgill.ca','2007-11-07',1906687017573859);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (246,'Maanav Kourilsky','Maa314','Canada','Maanav.Kourilsky@mail.mcgill.ca','1955-05-12',4678565865574777);



INSERT INTO listeners(uid) values (107);
INSERT INTO listeners(uid) values (69);
INSERT INTO listeners(uid) values (395);



INSERT INTO artists(uid,stage_name,balance) values (89,'Zaryah',2.75);


INSERT INTO libraries(lib_id,num_songs) values (1,6);

INSERT INTO playlists(name,status,num_songs,lib_id) values ('favs','Public',6,1);


INSERT INTO articles(article_id,title,genre,release_date,price) values (25,'Born This Way','R&B','2007-06-14',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (68,'Part Of Me','R&B','2007-06-14',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (252,'Sucker','R&B','2007-06-14',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (21,'Patricia','R&B','2007-06-14',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (0,'Always Be My Baby','R&B','2007-06-14',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (62,'Part Of Me','R&B','2007-06-14',2.75);
INSERT INTO articles(article_id,title,genre,release_date,price) values (125,'Crush','Pop','2018-04-30',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (446,'Boyfriend','Pop','2018-04-30',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (87,'Sorry','Pop','2018-04-30',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (278,'Best of Emma Della','Pop','2018-04-30',2.85);
INSERT INTO articles(article_id,title,genre,release_date,price) values (364,'Psycho','Electronic','2015-10-15',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (253,'Psycho(Single)','Electronic','2015-10-15',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (451,'One Week','Rap','2017-01-11',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (464,'Circus','Rap','2017-01-11',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (262,'She Will','Rap','2017-01-11',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (357,'LIL','Rap','2017-01-11',2.85);
INSERT INTO articles(article_id,title,genre,release_date,price) values (392,'Problem','Rap','2018-03-25',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (71,'Problem (Single)','Rap','2018-03-25',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (86,'Don t Stop Believing','Blues','2012-11-20',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (360,'Say You ll Be There','Blues','2012-11-20',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (441,'Ray Of Light','Blues','2012-11-20',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (179,'Burnin  Up','Blues','2012-11-20',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (351,'Don t Stop Believing','Blues','2012-11-20',2.2);
INSERT INTO articles(article_id,title,genre,release_date,price) values (198,'Baby','Pop','2005-05-05',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (202,'Baby(Single)','Pop','2005-05-05',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (409,'Don t Cry (remix)','Electronic','2019-11-03',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (417,'Don t Cry (remix)','Electronic','2019-11-03',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (219,'Please Me (remix)','Electronic','2018-11-03',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (74,'Please Me (remix)','Electronic','2018-11-03',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (400,'Runaway','Pop','2020-02-20',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (319,'Right Above It','Pop','2020-02-20',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (416,'Back To December','Pop','2020-02-20',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (212,'Red','Pop','2020-02-20',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (327,'Runaway','Pop','2020-02-20',3.8);
INSERT INTO articles(article_id,title,genre,release_date,price) values (264,'Applause','Pop','2019-03-04',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (286,'Summer Sixteen','Pop','2019-03-04',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (339,'All By Myself','Pop','2019-03-04',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (204,'Applause (EP)','Pop','2019-03-04',2.05);
INSERT INTO articles(article_id,title,genre,release_date,price) values (246,'Barbie Girl (remix)','Electronic','2015-07-26',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (248,'Barbie Girl (remix)','Electronic','2015-07-26',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (497,'Strange Clouds','Electronic','2015-08-15',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (112,'Strange Clouds','Electronic','2015-08-15',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (147,'Begin Again','Electronic','2016-03-28',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (193,'Begin Again','Electronic','2016-03-28',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (114,'Deja Vu','Rock','1985-02-10',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (180,'Paris','Rock','1985-02-10',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (247,'Deja Vu','Rock','1985-02-10',1.1);
INSERT INTO articles(article_id,title,genre,release_date,price) values (70,'Pray For Me','Punk Rock','2004-07-19',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (363,'Better Now','Punk Rock','2004-07-19',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (420,'Circles','Punk Rock','2004-07-19',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (11,'Sunny Came Home','Punk Rock','2004-07-19',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (482,'Speed Of Sound','Punk Rock','2004-07-19',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (299,'Can t Be Tamed','Punk Rock','2004-07-19',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (24,'Circles','Punk Rock','2004-07-19',3.3);
INSERT INTO articles(article_id,title,genre,release_date,price) values (88,'Speak Now','Punk Rock','2006-11-15',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (60,'Teenage Dream','Punk Rock','2006-11-15',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (431,'Sugar','Punk Rock','2006-11-15',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (7,'Piece By Piece','Punk Rock','2006-11-15',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (229,'Stargazing','Punk Rock','2006-11-15',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (289,'Take What You Want','Punk Rock','2006-11-15',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (217,'Change The World','Punk Rock','2006-11-15',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (166,'Speak Now','Punk Rock','2006-11-15',3.85);
INSERT INTO articles(article_id,title,genre,release_date,price) values (129,'So What','Pop','2011-01-16',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (391,'So What (Single)','Pop','2011-01-16',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (390,'Bad Romance','Pop','2012-10-29',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (330,'Take Care','Pop','2012-10-29',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (132,'Starships','Pop','2012-10-29',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (383,'Closer','Pop','2012-10-29',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (194,'Say Something','Pop','2012-10-29',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (458,'Say Something','Pop','2012-10-29',4.75);
INSERT INTO articles(article_id,title,genre,release_date,price) values (99,'Don t Matter To Me','Indie Pop','2016-09-24',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (159,'Come With Me','Indie Pop','2016-09-24',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (61,'Change','Indie Pop','2016-09-24',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (470,'Skyscraper','Indie Pop','2016-09-24',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (94,'Perfect','Indie Pop','2016-09-24',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (472,'Dangerous Woman','Indie Pop','2016-09-24',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (189,'Perfect','Indie Pop','2016-09-24',5.7);
INSERT INTO articles(article_id,title,genre,release_date,price) values (181,'Real Love','Independent','2013-05-17',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (375,'Real Love','Independent','2013-05-17',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (174,'A Little Bit Longer','Independent','2013-07-15',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (483,'A Little Bit Longer','Independent','2013-07-15',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (295,'So Good','Independent','2014-10-10',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (317,'Diana','Independent','2014-10-10',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (117,'So Good (EP)','Independent','2014-10-10',1.5);
INSERT INTO articles(article_id,title,genre,release_date,price) values (150,'Dirt','Rap','1998-03-17',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (361,'Sorry','Rap','1998-03-17',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (436,'Rise','Rap','1998-03-17',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (398,'Paranoid','Rap','1998-03-17',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (263,'All Mine','Rap','1998-03-17',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (72,'All Mine','Rap','1998-03-17',2.75);
INSERT INTO articles(article_id,title,genre,release_date,price) values (196,'Bandit','R&B','2001-02-05',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (32,'Blinding Lights','R&B','2001-02-05',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (168,'Diggin  On You','R&B','2001-02-05',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (325,'Somewhere','R&B','2001-02-05',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (300,'Ring The Alarm','R&B','2001-02-05',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (160,'Diggin ','R&B','2001-02-05',2.75);
INSERT INTO articles(article_id,title,genre,release_date,price) values (2,'Airplanes','R&B','2002-05-10',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (254,'Airplanes (Single)','R&B','2002-05-10',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (341,'Runaway','R&B','2003-07-11',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (5,'Runaway (Single)','R&B','2003-07-11',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (69,'Take A Little Ride','Independent','2015-11-11',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (31,'Burnin  It Down','Independent','2015-11-11',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (82,'Bitter Sweet Symphony','Independent','2015-11-11',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (75,'Come And Get With Me','Independent','2015-11-11',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (142,'Cover Album pt.1','Independent','2015-11-11',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (14,'Ours','Hip-Hop/Rap','1999-10-13',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (119,'Die Young','Hip-Hop/Rap','1999-10-13',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (369,'State Of Grace','Hip-Hop/Rap','1999-10-13',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (439,'Do What U Want','Hip-Hop/Rap','1999-10-13',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (424,'State Of Grace','Hip-Hop/Rap','1999-10-13',2.2);
INSERT INTO articles(article_id,title,genre,release_date,price) values (350,'Steal My Girl','Rap','2001-02-19',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (310,'Rap Devil','Rap','2001-02-19',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (20,'Rap Devil (EP)','Rap','2001-02-19',1.5);
INSERT INTO articles(article_id,title,genre,release_date,price) values (450,'That s The Way Love Goes','Jazz','2007-08-12',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (187,'Save Tonight','Jazz','2007-08-12',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (115,'All For You','Jazz','2007-08-12',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (474,'To The Limit','Jazz','2007-08-12',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (257,'Love Betty','Jazz','2007-08-12',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (171,'Jazzy Breezy Beautiful','Jazz','2007-08-12',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (261,'Photograph','R&B','2019-01-04',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (481,'Rich & Sad','R&B','2019-01-04',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (93,'Dedicate','R&B','2019-01-04',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (373,'Rescue Me','R&B','2019-01-04',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (475,'Again','R&B','2019-01-04',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (348,'Again','R&B','2019-01-04',4.75);
INSERT INTO articles(article_id,title,genre,release_date,price) values (33,'All My Life','Soundtrack','2004-06-06',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (167,'Sing','Soundtrack','2004-06-06',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (26,'Break Free','Soundtrack','2004-06-06',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (145,'All Day','Soundtrack','2004-06-06',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (149,'Sing All Day','Soundtrack','2004-06-06',3.8);
INSERT INTO articles(article_id,title,genre,release_date,price) values (240,'Perfect Illusion','Pop','1996-04-12',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (141,'Spoil My Night','Pop','1996-04-12',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (359,'One Summer Night','Pop','1996-04-12',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (139,'Pushin  Me Away','Pop','1996-04-12',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (274,'One Summer Night','Pop','1996-04-12',2.2);
INSERT INTO articles(article_id,title,genre,release_date,price) values (215,'One Less Lonely Girl','Pop','1995-02-28',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (66,'One Less Lonely Girl (Single)','Pop','1995-02-28',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (277,'Paradise','Rock','2009-04-25',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (287,'Ronan','Rock','2009-04-25',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (102,'Diamonds','Rock','2009-04-25',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (58,'That s My Kind Of Night','Rock','2009-04-25',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (366,'Say Something','Rock','2009-04-25',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (76,'Ronan','Rock','2009-04-25',2.75);
INSERT INTO articles(article_id,title,genre,release_date,price) values (320,'Amnesia','Rock','2011-05-17',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (177,'Amnesia','Rock','2011-05-17',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (397,'Show Me What You Got','Country','1984-06-19',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (457,'Tell It To The Rain','Country','1984-06-19',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (335,'Please Remember Me','Country','1984-06-19',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (442,'Don t Bring Me Down','Country','1984-06-19',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (140,'That Sunday, That Summer','Country','1984-06-19',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (36,'Thank The Lord For The Night Time','Country','1984-06-19',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (73,'Tell It To The Rain','Country','1984-06-19',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (421,'Stay In My Corner','Rock','2005-07-24',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (296,'Sweet Blindness','Rock','2005-07-24',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (230,'Share Your Love With Me','Rock','2005-07-24',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (311,'Something Better To Do','Rock','2005-07-24',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (452,'In & Out','Rock','2005-07-24',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (90,'Sweet Blindness','Rock','2005-07-24',2.75);


INSERT INTO albums(article_id,type) values (62,'LP');


INSERT INTO songs(article_id,duration) values (25,'3:23');


INSERT INTO shopping_carts(order_id,total_amount,num_articles) values (0,3.3,7);

INSERT INTO Releases(artist_id,article_id) values (89,25);


INSERT INTO BelongsTo(song_id,album_id) values (25,62);

INSERT INTO ComprisesOf(lib_id,name,song_id) values (1,'favs',25);

INSERT INTO IsAddedTo(article_id,lib_id) values (1,25);


INSERT INTO IsPartOf(name,lib_id) values ('favs',1);


INSERT INTO Contains(order_id, article_id) values (0,25);


INSERT INTO Contains(order_id, article_id) values (0,25);


INSERT INTO Uses(listener_id,order_id) values (0,107);


INSERT INTO Creates(listener_id,lib_id,name) values (107,1,'favs');

