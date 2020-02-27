
-- ************* SUMMARY ************* --
-- 1. Drop tables (reset)
-- 2. Create Entity and Relation sets
-- 3. Insert statements

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
	email VARCHAR(50), 
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
	lib_id INTEGER NOT NULL,
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


-- ************* Insert statements ************* --



INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (89,'Kyra Jones','Kyr13','Spain','Kyra.Jones@yahoo.com','1952-12-01',2492713153623526);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (13,'Maanav Patel','Maa92','United States','Maanav.Patel@mail.mcgill.ca','1974-07-14',6557895804602079);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (334,'Magnus Kourilsky','Mag138','France','Magnus.Kourilsky@yahoo.com','1950-01-11',9547767406951721);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (329,'Karim Angelo','Kar66','Vietnam','Karim.Angelo@mail.mcgill.ca','2007-11-07',1906687017573859);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (246,'Maanav Kourilsky','Maa314','Canada','Maanav.Kourilsky@mail.mcgill.ca','1955-05-12',4678565865574777);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (27,'Theo Jones','The234','Mexico','Theo.Jones@gmail.com','1979-08-28',4116880458292065);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (216,'Misgana Kourilsky','Mis218','Vietnam','Misgana.Kourilsky@yahoo.com','1979-06-07',1950054027023502);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (315,'Thomas Wang','Tho347','Russia','Thomas.Wang@yahoo.com','1953-01-16',7329391804442065);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (145,'Janna Garcia','Jan150','France','Janna.Garcia@yahoo.com','1966-01-22',6214656247724143);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (270,'Janna Angelo','Jan-74','England','Janna.Angelo@gmail.com','1962-04-12',3405910876944705);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (113,'Bahar Markoski','Bah359','Russia','Bahar.Markoski@mail.mcgill.ca','1969-08-07',8854364338025562);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (238,'Maanav Leone','Maa115','Italy','Maanav.Leone@gmail.com','1996-05-12',9894492401011922);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (387,'Olive Meijer','Oli389','United States','Olive.Meijer@mail.mcgill.ca','2004-12-04',1137729938717580);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (236,'Louise Castelli','Lou324','Egypt','Louise.Castelli@mail.mcgill.ca','1959-03-10',5894076406688059);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (146,'Tara Angelo','Tar397','Russia','Tara.Angelo@yahoo.com','1953-09-12',5499105574814800);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (358,'Louise Castelli','Lou121','Vietnam','Louise.Castelli@yahoo.com','2001-04-21',3610209074493350);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (124,'Louise Williams','Lou160','England','Louise.Williams@mail.mcgill.ca','1960-08-01',6842711069385400);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (353,'Zhang Wang','Zha54','Italy','Zhang.Wang@gmail.com','1997-11-17',7403181127970309);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (143,'Janna Porta','Jan327','Russia','Janna.Porta@gmail.com','1957-11-24',8191369655101074);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (335,'Kian Porta','Kia276','Vietnam','Kian.Porta@gmail.com','1953-05-22',1118944815416709);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (144,'Misgana Markoski','Mis136','United States','Misgana.Markoski@gmail.com','1980-05-09',5876284336677601);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (173,'Magnus Nguyen','Mag72','China','Magnus.Nguyen@yahoo.com','1974-02-16',8789605169720974);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (163,'Kyra Kourilsky','Kyr262','France','Kyra.Kourilsky@gmail.com','1956-01-10',2872477215311729);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (171,'Soraya Wilson','Sor168','Spain','Soraya.Wilson@mail.mcgill.ca','1996-12-21',6107985390023031);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (354,'Louise Nguyen','Lou257','Russia','Louise.Nguyen@yahoo.com','2007-04-16',5872264368459225);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (200,'Elio Jones','Eli240','Bolivia','Elio.Jones@gmail.com','1980-07-29',2289438055511647);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (231,'Louise Jones','Lou25','United States','Louise.Jones@mail.mcgill.ca','1975-06-14',9429223913998682);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (281,'Magnus Wilson','Mag223','Spain','Magnus.Wilson@gmail.com','1969-05-03',5406286320633477);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (359,'Misgana Nguyen','Mis293','Italy','Misgana.Nguyen@mail.mcgill.ca','1996-12-27',8813828088561219);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (118,'Karim Markoski','Kar106','Spain','Karim.Markoski@gmail.com','1957-03-27',4957747639805124);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (177,'Misgana Wilson','Mis106','Mexico','Misgana.Wilson@yahoo.com','1990-08-11',5310165022706385);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (373,'Bahar Jones','Bah232','Bolivia','Bahar.Jones@yahoo.com','1965-08-11',2915129049543543);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (71,'Magnus Castelli','Mag385','Bolivia','Magnus.Castelli@yahoo.com','1965-12-24',6912223354951320);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (107,'Theo Angelo','The282','France','Theo.Angelo@yahoo.com','2000-02-26',9209910353798209);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (69,'Zhang Wang','Zha275','Egypt','Zhang.Wang@yahoo.com','2004-07-03',6073890461317194);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (395,'Olive Leone','Oli278','Egypt','Olive.Leone@gmail.com','1972-06-07',5213814782186150);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (38,'Kian Kourilsky','Kia160','China','Kian.Kourilsky@gmail.com','1959-12-29',7880886506500517);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (323,'Tara Rodriguez','Tar98','Canada','Tara.Rodriguez@yahoo.com','1988-07-09',8294176346500907);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (368,'Elio Jones','Eli68','China','Elio.Jones@mail.mcgill.ca','1997-11-19',5756616858858884);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (12,'Misgana Rodriguez','Mis96','England','Misgana.Rodriguez@mail.mcgill.ca','1994-07-19',7363781348846776);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (164,'Tara Markoski','Tar227','Russia','Tara.Markoski@yahoo.com','1989-08-28',3101055029413001);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (365,'Theo Wilson','The376','Bolivia','Theo.Wilson@mail.mcgill.ca','1962-06-04',4889664053371458);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (179,'Magnus Angelo','Mag130','Egypt','Magnus.Angelo@mail.mcgill.ca','1993-01-10',6260165498455396);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (320,'Sam Kourilsky','Sam93','China','Sam.Kourilsky@mail.mcgill.ca','2001-01-29',5428624173109136);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (253,'Janna Jones','Jan280','United States','Janna.Jones@gmail.com','2000-07-07',6073385773012968);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (34,'Sam Nguyen','Sam113','United States','Sam.Nguyen@yahoo.com','2004-01-18',6439396058513541);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (108,'Karim Porta','Kar99','Egypt','Karim.Porta@gmail.com','1984-10-14',8701458748485604);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (310,'Olive Wilson','Oli140','Mexico','Olive.Wilson@gmail.com','1974-12-10',1779844453333643);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (168,'Misgana Porta','Mis298','Vietnam','Misgana.Porta@gmail.com','2007-07-02',8266570000088955);
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values (185,'Max Williams','Max186','Italy','Max.Williams@gmail.com','1977-11-16',2259058454161636);




INSERT INTO listeners(uid) values (107);
INSERT INTO listeners(uid) values (69);
INSERT INTO listeners(uid) values (395);
INSERT INTO listeners(uid) values (38);
INSERT INTO listeners(uid) values (323);
INSERT INTO listeners(uid) values (368);
INSERT INTO listeners(uid) values (12);
INSERT INTO listeners(uid) values (164);
INSERT INTO listeners(uid) values (365);
INSERT INTO listeners(uid) values (179);
INSERT INTO listeners(uid) values (320);
INSERT INTO listeners(uid) values (253);
INSERT INTO listeners(uid) values (34);
INSERT INTO listeners(uid) values (108);
INSERT INTO listeners(uid) values (310);
INSERT INTO listeners(uid) values (168);
INSERT INTO listeners(uid) values (185);




INSERT INTO artists(uid,stage_name,balance) values (89,'Zaryah',2.75);
INSERT INTO artists(uid,stage_name,balance) values (13,'Emma Della',2.85);
INSERT INTO artists(uid,stage_name,balance) values (334,'NMN',2.85);
INSERT INTO artists(uid,stage_name,balance) values (329,'Lil Diggity',4.75);
INSERT INTO artists(uid,stage_name,balance) values (246,'Alec Wood',2.75);
INSERT INTO artists(uid,stage_name,balance) values (27,'Justin B',0.0);
INSERT INTO artists(uid,stage_name,balance) values (216,'Dutch Dabber',0.0);
INSERT INTO artists(uid,stage_name,balance) values (315,'Aya Nova',11.15);
INSERT INTO artists(uid,stage_name,balance) values (145,'Purpleplum',0.0);
INSERT INTO artists(uid,stage_name,balance) values (270,'Francois Delacour',2.2);
INSERT INTO artists(uid,stage_name,balance) values (113,'How About Now',7.7);
INSERT INTO artists(uid,stage_name,balance) values (238,'Isiah Deville',0.0);
INSERT INTO artists(uid,stage_name,balance) values (387,'LEIMA',0.0);
INSERT INTO artists(uid,stage_name,balance) values (236,'The Lilies',0.0);
INSERT INTO artists(uid,stage_name,balance) values (146,'KM Kid',0.0);
INSERT INTO artists(uid,stage_name,balance) values (358,'The Fireman',0.0);
INSERT INTO artists(uid,stage_name,balance) values (124,'Michael James',0.0);
INSERT INTO artists(uid,stage_name,balance) values (353,'Chitty Bang',0.0);
INSERT INTO artists(uid,stage_name,balance) values (143,'Lara O Mara',0.0);
INSERT INTO artists(uid,stage_name,balance) values (335,'JP Edwards',0.0);
INSERT INTO artists(uid,stage_name,balance) values (144,'Alexandre Millet',0.0);
INSERT INTO artists(uid,stage_name,balance) values (173,'The Sunny Boys',0.0);
INSERT INTO artists(uid,stage_name,balance) values (163,'22 Seconds to Boston',0.0);
INSERT INTO artists(uid,stage_name,balance) values (171,'The Wheelies',0.0);
INSERT INTO artists(uid,stage_name,balance) values (354,'No Box',0.0);
INSERT INTO artists(uid,stage_name,balance) values (200,'The Kicking Eyes',0.0);
INSERT INTO artists(uid,stage_name,balance) values (231,'John Williams',0.0);
INSERT INTO artists(uid,stage_name,balance) values (281,'Ayden Page',0.0);
INSERT INTO artists(uid,stage_name,balance) values (359,'Kicking Dolls',0.0);
INSERT INTO artists(uid,stage_name,balance) values (118,'Alice In The Rain',0.0);
INSERT INTO artists(uid,stage_name,balance) values (177,'Greg McMiller',0.0);
INSERT INTO artists(uid,stage_name,balance) values (373,'David Olsen',0.0);
INSERT INTO artists(uid,stage_name,balance) values (71,'Zephiro',0.0);




INSERT INTO libraries(lib_id,num_songs) values (1,6);
INSERT INTO libraries(lib_id,num_songs) values (2,4);
INSERT INTO libraries(lib_id,num_songs) values (3,2);
INSERT INTO libraries(lib_id,num_songs) values (4,4);
INSERT INTO libraries(lib_id,num_songs) values (5,2);
INSERT INTO libraries(lib_id,num_songs) values (6,5);
INSERT INTO libraries(lib_id,num_songs) values (7,2);
INSERT INTO libraries(lib_id,num_songs) values (8,2);
INSERT INTO libraries(lib_id,num_songs) values (9,2);
INSERT INTO libraries(lib_id,num_songs) values (10,5);
INSERT INTO libraries(lib_id,num_songs) values (11,4);
INSERT INTO libraries(lib_id,num_songs) values (12,2);
INSERT INTO libraries(lib_id,num_songs) values (13,2);
INSERT INTO libraries(lib_id,num_songs) values (14,2);
INSERT INTO libraries(lib_id,num_songs) values (15,3);
INSERT INTO libraries(lib_id,num_songs) values (16,7);
INSERT INTO libraries(lib_id,num_songs) values (17,8);




INSERT INTO playlists(name,status,num_songs,lib_id) values ('favs','Public',6,1);
INSERT INTO playlists(name,status,num_songs,lib_id) values ('cool songs','Private',4,2);
INSERT INTO playlists(name,status,num_songs,lib_id) values ('vibe','Public',2,3);
INSERT INTO playlists(name,status,num_songs,lib_id) values ('songs','Private',4,4);
INSERT INTO playlists(name,status,num_songs,lib_id) values ('my songs','Private',2,5);
INSERT INTO playlists(name,status,num_songs,lib_id) values ('pl','Public',5,6);
INSERT INTO playlists(name,status,num_songs,lib_id) values ('my favorites','Public',2,7);
INSERT INTO playlists(name,status,num_songs,lib_id) values ('my favs','Public',2,8);
INSERT INTO playlists(name,status,num_songs,lib_id) values ('favorites','Public',2,9);
INSERT INTO playlists(name,status,num_songs,lib_id) values ('love these songs','Private',5,10);
INSERT INTO playlists(name,status,num_songs,lib_id) values ('yeh','Public',4,11);
INSERT INTO playlists(name,status,num_songs,lib_id) values ('cool songs','Public',2,12);
INSERT INTO playlists(name,status,num_songs,lib_id) values ('My Favorites','Public',2,13);
INSERT INTO playlists(name,status,num_songs,lib_id) values ('playlist 33','Private',2,14);
INSERT INTO playlists(name,status,num_songs,lib_id) values ('nice songs','Private',3,15);
INSERT INTO playlists(name,status,num_songs,lib_id) values ('melody','Public',7,16);
INSERT INTO playlists(name,status,num_songs,lib_id) values ('beats','Public',8,17);




INSERT INTO articles(article_id,title,genre,release_date,price) values (25,0,'Born This Way','R&B','2007-06-14',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (68,0,'Part Of Me','R&B','2007-06-14',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (252,0,'Sucker','R&B','2007-06-14',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (21,0,'Patricia','R&B','2007-06-14',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (0,0,'Always Be My Baby','R&B','2007-06-14',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (62,1,'Part Of Me','R&B','2007-06-14',2.75);
INSERT INTO articles(article_id,title,genre,release_date,price) values (125,0,'Crush','Pop','2018-04-30',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (446,0,'Boyfriend','Pop','2018-04-30',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (87,0,'Sorry','Pop','2018-04-30',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (278,1,'Best of Emma Della','Pop','2018-04-30',2.85);
INSERT INTO articles(article_id,title,genre,release_date,price) values (364,0,'Psycho','Electronic','2015-10-15',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (253,1,'Psycho(Single)','Electronic','2015-10-15',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (451,0,'One Week','Rap','2017-01-11',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (464,0,'Circus','Rap','2017-01-11',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (262,0,'She Will','Rap','2017-01-11',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (357,1,'LIL','Rap','2017-01-11',2.85);
INSERT INTO articles(article_id,title,genre,release_date,price) values (392,0,'Problem','Rap','2018-03-25',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (71,1,'Problem (Single)','Rap','2018-03-25',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (86,0,'Don t Stop Believing','Blues','2012-11-20',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (360,0,'Say You ll Be There','Blues','2012-11-20',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (441,0,'Ray Of Light','Blues','2012-11-20',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (179,0,'Burnin  Up','Blues','2012-11-20',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (351,1,'Don t Stop Believing','Blues','2012-11-20',2.2);
INSERT INTO articles(article_id,title,genre,release_date,price) values (198,0,'Baby','Pop','2005-05-05',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (202,1,'Baby(Single)','Pop','2005-05-05',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (409,0,'Don t Cry (remix)','Electronic','2019-11-03',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (417,1,'Don t Cry (remix)','Electronic','2019-11-03',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (219,0,'Please Me (remix)','Electronic','2018-11-03',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (74,1,'Please Me (remix)','Electronic','2018-11-03',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (400,0,'Runaway','Pop','2020-02-20',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (319,0,'Right Above It','Pop','2020-02-20',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (416,0,'Back To December','Pop','2020-02-20',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (212,0,'Red','Pop','2020-02-20',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (327,1,'Runaway','Pop','2020-02-20',3.8);
INSERT INTO articles(article_id,title,genre,release_date,price) values (264,0,'Applause','Pop','2019-03-04',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (286,0,'Summer Sixteen','Pop','2019-03-04',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (339,0,'All By Myself','Pop','2019-03-04',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (204,1,'Applause (EP)','Pop','2019-03-04',2.05);
INSERT INTO articles(article_id,title,genre,release_date,price) values (246,0,'Barbie Girl (remix)','Electronic','2015-07-26',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (248,1,'Barbie Girl (remix)','Electronic','2015-07-26',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (497,0,'Strange Clouds','Electronic','2015-08-15',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (112,1,'Strange Clouds','Electronic','2015-08-15',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (147,0,'Begin Again','Electronic','2016-03-28',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (193,1,'Begin Again','Electronic','2016-03-28',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (114,0,'Deja Vu','Rock','1985-02-10',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (180,0,'Paris','Rock','1985-02-10',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (247,1,'Deja Vu','Rock','1985-02-10',1.1);
INSERT INTO articles(article_id,title,genre,release_date,price) values (70,0,'Pray For Me','Punk Rock','2004-07-19',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (363,0,'Better Now','Punk Rock','2004-07-19',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (420,0,'Circles','Punk Rock','2004-07-19',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (11,0,'Sunny Came Home','Punk Rock','2004-07-19',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (482,0,'Speed Of Sound','Punk Rock','2004-07-19',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (299,0,'Can t Be Tamed','Punk Rock','2004-07-19',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (24,1,'Circles','Punk Rock','2004-07-19',3.3);
INSERT INTO articles(article_id,title,genre,release_date,price) values (88,0,'Speak Now','Punk Rock','2006-11-15',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (60,0,'Teenage Dream','Punk Rock','2006-11-15',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (431,0,'Sugar','Punk Rock','2006-11-15',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (7,0,'Piece By Piece','Punk Rock','2006-11-15',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (229,0,'Stargazing','Punk Rock','2006-11-15',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (289,0,'Take What You Want','Punk Rock','2006-11-15',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (217,0,'Change The World','Punk Rock','2006-11-15',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (166,1,'Speak Now','Punk Rock','2006-11-15',3.85);
INSERT INTO articles(article_id,title,genre,release_date,price) values (129,0,'So What','Pop','2011-01-16',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (391,1,'So What (Single)','Pop','2011-01-16',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (390,0,'Bad Romance','Pop','2012-10-29',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (330,0,'Take Care','Pop','2012-10-29',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (132,0,'Starships','Pop','2012-10-29',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (383,0,'Closer','Pop','2012-10-29',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (194,0,'Say Something','Pop','2012-10-29',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (458,1,'Say Something','Pop','2012-10-29',4.75);
INSERT INTO articles(article_id,title,genre,release_date,price) values (99,0,'Don t Matter To Me','Indie Pop','2016-09-24',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (159,0,'Come With Me','Indie Pop','2016-09-24',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (61,0,'Change','Indie Pop','2016-09-24',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (470,0,'Skyscraper','Indie Pop','2016-09-24',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (94,0,'Perfect','Indie Pop','2016-09-24',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (472,0,'Dangerous Woman','Indie Pop','2016-09-24',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (189,1,'Perfect','Indie Pop','2016-09-24',5.7);
INSERT INTO articles(article_id,title,genre,release_date,price) values (181,0,'Real Love','Independent','2013-05-17',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (375,1,'Real Love','Independent','2013-05-17',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (174,0,'A Little Bit Longer','Independent','2013-07-15',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (483,1,'A Little Bit Longer','Independent','2013-07-15',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (295,0,'So Good','Independent','2014-10-10',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (317,0,'Diana','Independent','2014-10-10',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (117,1,'So Good (EP)','Independent','2014-10-10',1.5);
INSERT INTO articles(article_id,title,genre,release_date,price) values (150,0,'Dirt','Rap','1998-03-17',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (361,0,'Sorry','Rap','1998-03-17',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (436,0,'Rise','Rap','1998-03-17',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (398,0,'Paranoid','Rap','1998-03-17',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (263,0,'All Mine','Rap','1998-03-17',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (72,1,'All Mine','Rap','1998-03-17',2.75);
INSERT INTO articles(article_id,title,genre,release_date,price) values (196,0,'Bandit','R&B','2001-02-05',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (32,0,'Blinding Lights','R&B','2001-02-05',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (168,0,'Diggin  On You','R&B','2001-02-05',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (325,0,'Somewhere','R&B','2001-02-05',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (300,0,'Ring The Alarm','R&B','2001-02-05',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (160,1,'Diggin ','R&B','2001-02-05',2.75);
INSERT INTO articles(article_id,title,genre,release_date,price) values (2,0,'Airplanes','R&B','2002-05-10',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (254,1,'Airplanes (Single)','R&B','2002-05-10',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (341,0,'Runaway','R&B','2003-07-11',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (5,1,'Runaway (Single)','R&B','2003-07-11',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (69,0,'Take A Little Ride','Independent','2015-11-11',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (31,0,'Burnin  It Down','Independent','2015-11-11',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (82,0,'Bitter Sweet Symphony','Independent','2015-11-11',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (75,0,'Come And Get With Me','Independent','2015-11-11',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (142,1,'Cover Album pt.1','Independent','2015-11-11',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (14,0,'Ours','Hip-Hop/Rap','1999-10-13',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (119,0,'Die Young','Hip-Hop/Rap','1999-10-13',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (369,0,'State Of Grace','Hip-Hop/Rap','1999-10-13',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (439,0,'Do What U Want','Hip-Hop/Rap','1999-10-13',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (424,1,'State Of Grace','Hip-Hop/Rap','1999-10-13',2.2);
INSERT INTO articles(article_id,title,genre,release_date,price) values (350,0,'Steal My Girl','Rap','2001-02-19',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (310,0,'Rap Devil','Rap','2001-02-19',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (20,1,'Rap Devil (EP)','Rap','2001-02-19',1.5);
INSERT INTO articles(article_id,title,genre,release_date,price) values (450,0,'That s The Way Love Goes','Jazz','2007-08-12',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (187,0,'Save Tonight','Jazz','2007-08-12',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (115,0,'All For You','Jazz','2007-08-12',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (474,0,'To The Limit','Jazz','2007-08-12',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (257,0,'Love Betty','Jazz','2007-08-12',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (171,1,'Jazzy Breezy Beautiful','Jazz','2007-08-12',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (261,0,'Photograph','R&B','2019-01-04',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (481,0,'Rich & Sad','R&B','2019-01-04',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (93,0,'Dedicate','R&B','2019-01-04',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (373,0,'Rescue Me','R&B','2019-01-04',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (475,0,'Again','R&B','2019-01-04',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (348,1,'Again','R&B','2019-01-04',4.75);
INSERT INTO articles(article_id,title,genre,release_date,price) values (33,0,'All My Life','Soundtrack','2004-06-06',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (167,0,'Sing','Soundtrack','2004-06-06',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (26,0,'Break Free','Soundtrack','2004-06-06',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (145,0,'All Day','Soundtrack','2004-06-06',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (149,1,'Sing All Day','Soundtrack','2004-06-06',3.8);
INSERT INTO articles(article_id,title,genre,release_date,price) values (240,0,'Perfect Illusion','Pop','1996-04-12',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (141,0,'Spoil My Night','Pop','1996-04-12',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (359,0,'One Summer Night','Pop','1996-04-12',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (139,0,'Pushin  Me Away','Pop','1996-04-12',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (274,1,'One Summer Night','Pop','1996-04-12',2.2);
INSERT INTO articles(article_id,title,genre,release_date,price) values (215,0,'One Less Lonely Girl','Pop','1995-02-28',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (66,1,'One Less Lonely Girl (Single)','Pop','1995-02-28',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (277,0,'Paradise','Rock','2009-04-25',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (287,0,'Ronan','Rock','2009-04-25',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (102,0,'Diamonds','Rock','2009-04-25',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (58,0,'That s My Kind Of Night','Rock','2009-04-25',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (366,0,'Say Something','Rock','2009-04-25',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (76,1,'Ronan','Rock','2009-04-25',2.75);
INSERT INTO articles(article_id,title,genre,release_date,price) values (320,0,'Amnesia','Rock','2011-05-17',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (177,1,'Amnesia','Rock','2011-05-17',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (397,0,'Show Me What You Got','Country','1984-06-19',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (457,0,'Tell It To The Rain','Country','1984-06-19',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (335,0,'Please Remember Me','Country','1984-06-19',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (442,0,'Don t Bring Me Down','Country','1984-06-19',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (140,0,'That Sunday, That Summer','Country','1984-06-19',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (36,0,'Thank The Lord For The Night Time','Country','1984-06-19',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (73,1,'Tell It To The Rain','Country','1984-06-19',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (421,0,'Stay In My Corner','Rock','2005-07-24',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (296,0,'Sweet Blindness','Rock','2005-07-24',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (230,0,'Share Your Love With Me','Rock','2005-07-24',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (311,0,'Something Better To Do','Rock','2005-07-24',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (452,0,'In & Out','Rock','2005-07-24',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (90,1,'Sweet Blindness','Rock','2005-07-24',2.75);
INSERT INTO articles(article_id,title,genre,release_date,price) values (127,0,'Do I Do','Soul','2017-07-27',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (3,1,'Do I Do','Soul','2017-07-27',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (279,0,'Smooth Criminal','Soul','2016-10-03',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (205,1,'Smooth Criminal','Soul','2016-10-03',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (255,0,'One','Soul','2015-09-15',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (116,1,'One','Soul','2015-09-15',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (387,0,'Rock And Roll Dreams Come Through','Rock','2019-05-05',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (37,1,'Rock And Roll Dreams Come Through','Rock','2019-05-05',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (496,0,'Please Love Me Forever','Rock','2018-06-06',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (345,1,'Please Love Me Forever','Rock','2018-06-06',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (435,0,'Ain t Too Proud To Beg','Independent','2020-01-05',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (406,1,'Ain t Too Proud To Beg','Independent','2020-01-05',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (123,0,'Over Under Sideways Down','Independent','2019-11-28',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (242,1,'Over Under Sideways Down','Independent','2019-11-28',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (184,0,'Reflections Of My Life','Independent','2019-03-16',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (316,1,'Reflections Of My Life','Independent','2019-03-16',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (349,0,'Can t Stop Dancin ','Independent','2018-08-15',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (337,1,'Can t Stop Dancin ','Independent','2018-08-15',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (81,0,'American Storm','Punk Rock','2003-10-11',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (413,0,'Didn t I (Blow Your Mind)','Punk Rock','2003-10-11',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (265,0,'Don t Cry','Punk Rock','2003-10-11',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (427,0,'People Everyday','Punk Rock','2003-10-11',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (495,0,'Cherry Pie','Punk Rock','2003-10-11',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (226,1,'American Storm','Punk Rock','2003-10-11',2.75);
INSERT INTO articles(article_id,title,genre,release_date,price) values (355,0,'A Swingin  Safari','Independent','1998-03-16',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (136,0,'Dear Lonely Hearts','Independent','1998-03-16',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (162,0,'Our Winter Love','Independent','1998-03-16',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (197,1,'A','Independent','1998-03-16',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (395,0,'Red Roses For A Blue Lady','Country','2009-10-19',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (284,0,'Sing A Song','Country','2009-10-19',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (354,0,'Ready To Take A Chance Again','Country','2009-10-19',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (267,0,'Shine A Little Love','Country','2009-10-19',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (272,0,'Can t Cry Anymore','Country','2009-10-19',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (97,1,'Shine A Little Love','Country','2009-10-19',2.75);
INSERT INTO articles(article_id,title,genre,release_date,price) values (336,0,'Summer Nights','Electro Pop','2011-04-27',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (128,1,'Summer Nights','Electro Pop','2011-04-27',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (190,0,'Stranger In My House','Electro Pop','2015-05-20',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (251,1,'Stranger In My House','Electro Pop','2015-05-20',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (122,0,'Do What You Want, Be What You Are','Electro Pop','2017-03-20',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (96,1,'Do What You Want, Be What You Are','Electro Pop','2017-03-20',0.95);
INSERT INTO articles(article_id,title,genre,release_date,price) values (233,0,'A Penny For Your Thoughts','Folk','2013-01-15',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (106,1,'A Penny For Your Thoughts','Folk','2013-01-15',0.0);
INSERT INTO articles(article_id,title,genre,release_date,price) values (221,0,'Burning Heart','Folk','2014-05-12',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (250,1,'Burning Heart','Folk','2014-05-12',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (303,0,'Don t Happen Twice','Folk','2013-04-10',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (222,0,'Sideways','Folk','2013-04-10',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (433,0,'Come With Me Now','Folk','2013-04-10',0.55);
INSERT INTO articles(article_id,title,genre,release_date,price) values (188,1,'Sideways','Folk','2013-04-10',1.65);




INSERT INTO albums(article_id,type) values (62,'LP');
INSERT INTO albums(article_id,type) values (278,'Compilation');
INSERT INTO albums(article_id,type) values (253,'Single');
INSERT INTO albums(article_id,type) values (357,'LP');
INSERT INTO albums(article_id,type) values (71,'Single');
INSERT INTO albums(article_id,type) values (351,'LP');
INSERT INTO albums(article_id,type) values (202,'Single');
INSERT INTO albums(article_id,type) values (417,'DJ Mix');
INSERT INTO albums(article_id,type) values (74,'DJ Mix');
INSERT INTO albums(article_id,type) values (327,'LP');
INSERT INTO albums(article_id,type) values (204,'EP');
INSERT INTO albums(article_id,type) values (248,'DJ Mix');
INSERT INTO albums(article_id,type) values (112,'DJ Mix');
INSERT INTO albums(article_id,type) values (193,'DJ Mix');
INSERT INTO albums(article_id,type) values (247,'EP');
INSERT INTO albums(article_id,type) values (24,'LP');
INSERT INTO albums(article_id,type) values (166,'LP');
INSERT INTO albums(article_id,type) values (391,'Single');
INSERT INTO albums(article_id,type) values (458,'LP');
INSERT INTO albums(article_id,type) values (189,'LP');
INSERT INTO albums(article_id,type) values (375,'Single');
INSERT INTO albums(article_id,type) values (483,'Single');
INSERT INTO albums(article_id,type) values (117,'EP');
INSERT INTO albums(article_id,type) values (72,'LP');
INSERT INTO albums(article_id,type) values (160,'LP');
INSERT INTO albums(article_id,type) values (254,'Single');
INSERT INTO albums(article_id,type) values (5,'Single');
INSERT INTO albums(article_id,type) values (142,'EP');
INSERT INTO albums(article_id,type) values (424,'Mixtape');
INSERT INTO albums(article_id,type) values (20,'EP');
INSERT INTO albums(article_id,type) values (171,'EP');
INSERT INTO albums(article_id,type) values (348,'LP');
INSERT INTO albums(article_id,type) values (149,'LP');
INSERT INTO albums(article_id,type) values (274,'EP');
INSERT INTO albums(article_id,type) values (66,'Single');
INSERT INTO albums(article_id,type) values (76,'LP');
INSERT INTO albums(article_id,type) values (177,'Single');
INSERT INTO albums(article_id,type) values (73,'LP');
INSERT INTO albums(article_id,type) values (90,'LP');
INSERT INTO albums(article_id,type) values (3,'Single');
INSERT INTO albums(article_id,type) values (205,'Single');
INSERT INTO albums(article_id,type) values (116,'Single');
INSERT INTO albums(article_id,type) values (37,'Single');
INSERT INTO albums(article_id,type) values (345,'Single');
INSERT INTO albums(article_id,type) values (406,'Single');
INSERT INTO albums(article_id,type) values (242,'Single');
INSERT INTO albums(article_id,type) values (316,'Single');
INSERT INTO albums(article_id,type) values (337,'Single');
INSERT INTO albums(article_id,type) values (226,'Single');
INSERT INTO albums(article_id,type) values (197,'EP');
INSERT INTO albums(article_id,type) values (97,'LP');
INSERT INTO albums(article_id,type) values (128,'DJ Mix');
INSERT INTO albums(article_id,type) values (251,'DJ Mix');
INSERT INTO albums(article_id,type) values (96,'DJ Mix');
INSERT INTO albums(article_id,type) values (106,'Single');
INSERT INTO albums(article_id,type) values (250,'Single');
INSERT INTO albums(article_id,type) values (188,'EP');




INSERT INTO songs(article_id,duration) values (25,'3:23');
INSERT INTO songs(article_id,duration) values (68,'3:25');
INSERT INTO songs(article_id,duration) values (252,'5:42');
INSERT INTO songs(article_id,duration) values (21,'3:42');
INSERT INTO songs(article_id,duration) values (0,'3:29');
INSERT INTO songs(article_id,duration) values (125,'1:24');
INSERT INTO songs(article_id,duration) values (446,'0:38');
INSERT INTO songs(article_id,duration) values (87,'0:18');
INSERT INTO songs(article_id,duration) values (364,'4:14');
INSERT INTO songs(article_id,duration) values (451,'4:34');
INSERT INTO songs(article_id,duration) values (464,'4:28');
INSERT INTO songs(article_id,duration) values (262,'1:48');
INSERT INTO songs(article_id,duration) values (392,'4:57');
INSERT INTO songs(article_id,duration) values (86,'3:32');
INSERT INTO songs(article_id,duration) values (360,'0:34');
INSERT INTO songs(article_id,duration) values (441,'5:40');
INSERT INTO songs(article_id,duration) values (179,'4:57');
INSERT INTO songs(article_id,duration) values (198,'3:54');
INSERT INTO songs(article_id,duration) values (409,'4:57');
INSERT INTO songs(article_id,duration) values (219,'3:28');
INSERT INTO songs(article_id,duration) values (400,'0:35');
INSERT INTO songs(article_id,duration) values (319,'3:57');
INSERT INTO songs(article_id,duration) values (416,'2:26');
INSERT INTO songs(article_id,duration) values (212,'3:48');
INSERT INTO songs(article_id,duration) values (264,'3:33');
INSERT INTO songs(article_id,duration) values (286,'4:19');
INSERT INTO songs(article_id,duration) values (339,'5:57');
INSERT INTO songs(article_id,duration) values (246,'0:28');
INSERT INTO songs(article_id,duration) values (497,'2:12');
INSERT INTO songs(article_id,duration) values (147,'5:13');
INSERT INTO songs(article_id,duration) values (114,'5:48');
INSERT INTO songs(article_id,duration) values (180,'0:32');
INSERT INTO songs(article_id,duration) values (70,'2:33');
INSERT INTO songs(article_id,duration) values (363,'2:34');
INSERT INTO songs(article_id,duration) values (420,'3:44');
INSERT INTO songs(article_id,duration) values (11,'1:52');
INSERT INTO songs(article_id,duration) values (482,'4:50');
INSERT INTO songs(article_id,duration) values (299,'4:45');
INSERT INTO songs(article_id,duration) values (88,'1:16');
INSERT INTO songs(article_id,duration) values (60,'1:52');
INSERT INTO songs(article_id,duration) values (431,'0:29');
INSERT INTO songs(article_id,duration) values (7,'0:57');
INSERT INTO songs(article_id,duration) values (229,'2:54');
INSERT INTO songs(article_id,duration) values (289,'3:46');
INSERT INTO songs(article_id,duration) values (217,'5:35');
INSERT INTO songs(article_id,duration) values (129,'3:16');
INSERT INTO songs(article_id,duration) values (390,'3:33');
INSERT INTO songs(article_id,duration) values (330,'4:36');
INSERT INTO songs(article_id,duration) values (132,'1:38');
INSERT INTO songs(article_id,duration) values (383,'3:26');
INSERT INTO songs(article_id,duration) values (194,'5:40');
INSERT INTO songs(article_id,duration) values (99,'5:44');
INSERT INTO songs(article_id,duration) values (159,'1:24');
INSERT INTO songs(article_id,duration) values (61,'4:55');
INSERT INTO songs(article_id,duration) values (470,'0:13');
INSERT INTO songs(article_id,duration) values (94,'1:53');
INSERT INTO songs(article_id,duration) values (472,'3:21');
INSERT INTO songs(article_id,duration) values (181,'0:40');
INSERT INTO songs(article_id,duration) values (174,'3:50');
INSERT INTO songs(article_id,duration) values (295,'4:33');
INSERT INTO songs(article_id,duration) values (317,'4:32');
INSERT INTO songs(article_id,duration) values (150,'4:27');
INSERT INTO songs(article_id,duration) values (361,'1:12');
INSERT INTO songs(article_id,duration) values (436,'4:24');
INSERT INTO songs(article_id,duration) values (398,'1:13');
INSERT INTO songs(article_id,duration) values (263,'2:19');
INSERT INTO songs(article_id,duration) values (196,'2:58');
INSERT INTO songs(article_id,duration) values (32,'4:22');
INSERT INTO songs(article_id,duration) values (168,'1:55');
INSERT INTO songs(article_id,duration) values (325,'3:24');
INSERT INTO songs(article_id,duration) values (300,'1:33');
INSERT INTO songs(article_id,duration) values (2,'2:14');
INSERT INTO songs(article_id,duration) values (341,'4:46');
INSERT INTO songs(article_id,duration) values (69,'1:16');
INSERT INTO songs(article_id,duration) values (31,'3:43');
INSERT INTO songs(article_id,duration) values (82,'1:41');
INSERT INTO songs(article_id,duration) values (75,'5:21');
INSERT INTO songs(article_id,duration) values (14,'2:56');
INSERT INTO songs(article_id,duration) values (119,'1:39');
INSERT INTO songs(article_id,duration) values (369,'3:34');
INSERT INTO songs(article_id,duration) values (439,'5:55');
INSERT INTO songs(article_id,duration) values (350,'5:36');
INSERT INTO songs(article_id,duration) values (310,'4:33');
INSERT INTO songs(article_id,duration) values (450,'3:59');
INSERT INTO songs(article_id,duration) values (187,'5:15');
INSERT INTO songs(article_id,duration) values (115,'5:40');
INSERT INTO songs(article_id,duration) values (474,'5:44');
INSERT INTO songs(article_id,duration) values (257,'0:22');
INSERT INTO songs(article_id,duration) values (261,'3:35');
INSERT INTO songs(article_id,duration) values (481,'1:25');
INSERT INTO songs(article_id,duration) values (93,'2:28');
INSERT INTO songs(article_id,duration) values (373,'0:55');
INSERT INTO songs(article_id,duration) values (475,'4:13');
INSERT INTO songs(article_id,duration) values (33,'4:44');
INSERT INTO songs(article_id,duration) values (167,'1:42');
INSERT INTO songs(article_id,duration) values (26,'4:23');
INSERT INTO songs(article_id,duration) values (145,'0:55');
INSERT INTO songs(article_id,duration) values (240,'0:51');
INSERT INTO songs(article_id,duration) values (141,'2:54');
INSERT INTO songs(article_id,duration) values (359,'0:11');
INSERT INTO songs(article_id,duration) values (139,'0:48');
INSERT INTO songs(article_id,duration) values (215,'4:22');
INSERT INTO songs(article_id,duration) values (277,'0:13');
INSERT INTO songs(article_id,duration) values (287,'0:48');
INSERT INTO songs(article_id,duration) values (102,'1:34');
INSERT INTO songs(article_id,duration) values (58,'1:41');
INSERT INTO songs(article_id,duration) values (366,'3:43');
INSERT INTO songs(article_id,duration) values (320,'2:27');
INSERT INTO songs(article_id,duration) values (397,'4:25');
INSERT INTO songs(article_id,duration) values (457,'0:52');
INSERT INTO songs(article_id,duration) values (335,'2:10');
INSERT INTO songs(article_id,duration) values (442,'3:51');
INSERT INTO songs(article_id,duration) values (140,'1:48');
INSERT INTO songs(article_id,duration) values (36,'4:14');
INSERT INTO songs(article_id,duration) values (421,'5:53');
INSERT INTO songs(article_id,duration) values (296,'2:28');
INSERT INTO songs(article_id,duration) values (230,'0:48');
INSERT INTO songs(article_id,duration) values (311,'0:29');
INSERT INTO songs(article_id,duration) values (452,'3:25');
INSERT INTO songs(article_id,duration) values (127,'4:29');
INSERT INTO songs(article_id,duration) values (279,'0:55');
INSERT INTO songs(article_id,duration) values (255,'1:44');
INSERT INTO songs(article_id,duration) values (387,'0:44');
INSERT INTO songs(article_id,duration) values (496,'3:35');
INSERT INTO songs(article_id,duration) values (435,'4:55');
INSERT INTO songs(article_id,duration) values (123,'1:23');
INSERT INTO songs(article_id,duration) values (184,'5:17');
INSERT INTO songs(article_id,duration) values (349,'2:45');
INSERT INTO songs(article_id,duration) values (81,'5:33');
INSERT INTO songs(article_id,duration) values (413,'2:28');
INSERT INTO songs(article_id,duration) values (265,'2:18');
INSERT INTO songs(article_id,duration) values (427,'4:15');
INSERT INTO songs(article_id,duration) values (495,'3:29');
INSERT INTO songs(article_id,duration) values (355,'4:27');
INSERT INTO songs(article_id,duration) values (136,'2:14');
INSERT INTO songs(article_id,duration) values (162,'5:44');
INSERT INTO songs(article_id,duration) values (395,'1:57');
INSERT INTO songs(article_id,duration) values (284,'4:27');
INSERT INTO songs(article_id,duration) values (354,'0:30');
INSERT INTO songs(article_id,duration) values (267,'1:18');
INSERT INTO songs(article_id,duration) values (272,'2:58');
INSERT INTO songs(article_id,duration) values (336,'5:20');
INSERT INTO songs(article_id,duration) values (190,'3:31');
INSERT INTO songs(article_id,duration) values (122,'5:47');
INSERT INTO songs(article_id,duration) values (233,'1:58');
INSERT INTO songs(article_id,duration) values (221,'5:46');
INSERT INTO songs(article_id,duration) values (303,'3:59');
INSERT INTO songs(article_id,duration) values (222,'1:57');
INSERT INTO songs(article_id,duration) values (433,'3:50');




INSERT INTO shopping_carts(order_id,total_amount,num_articles) values (0,3.3,7);
INSERT INTO shopping_carts(order_id,total_amount,num_articles) values (1,3.8,5);
INSERT INTO shopping_carts(order_id,total_amount,num_articles) values (2,0.95,3);
INSERT INTO shopping_carts(order_id,total_amount,num_articles) values (3,3.8,5);
INSERT INTO shopping_carts(order_id,total_amount,num_articles) values (4,1.9,3);
INSERT INTO shopping_carts(order_id,total_amount,num_articles) values (5,3.15,6);
INSERT INTO shopping_carts(order_id,total_amount,num_articles) values (6,0.55,3);
INSERT INTO shopping_carts(order_id,total_amount,num_articles) values (7,0.95,3);
INSERT INTO shopping_carts(order_id,total_amount,num_articles) values (8,0.0,3);
INSERT INTO shopping_carts(order_id,total_amount,num_articles) values (9,4.35,6);
INSERT INTO shopping_carts(order_id,total_amount,num_articles) values (10,3.0,5);
INSERT INTO shopping_carts(order_id,total_amount,num_articles) values (11,0.95,3);
INSERT INTO shopping_carts(order_id,total_amount,num_articles) values (12,0.95,3);
INSERT INTO shopping_carts(order_id,total_amount,num_articles) values (13,0.55,3);
INSERT INTO shopping_carts(order_id,total_amount,num_articles) values (14,1.65,4);
INSERT INTO shopping_carts(order_id,total_amount,num_articles) values (15,3.85,8);
INSERT INTO shopping_carts(order_id,total_amount,num_articles) values (16,4.4,9);




INSERT INTO Releases(artist_id,article_id) values (89,25);
INSERT INTO Releases(artist_id,article_id) values (89,68);
INSERT INTO Releases(artist_id,article_id) values (89,252);
INSERT INTO Releases(artist_id,article_id) values (89,21);
INSERT INTO Releases(artist_id,article_id) values (89,0);
INSERT INTO Releases(artist_id,article_id) values (89,62);
INSERT INTO Releases(artist_id,article_id) values (13,125);
INSERT INTO Releases(artist_id,article_id) values (13,446);
INSERT INTO Releases(artist_id,article_id) values (13,87);
INSERT INTO Releases(artist_id,article_id) values (13,278);
INSERT INTO Releases(artist_id,article_id) values (334,364);
INSERT INTO Releases(artist_id,article_id) values (334,253);
INSERT INTO Releases(artist_id,article_id) values (329,451);
INSERT INTO Releases(artist_id,article_id) values (329,464);
INSERT INTO Releases(artist_id,article_id) values (329,262);
INSERT INTO Releases(artist_id,article_id) values (329,357);
INSERT INTO Releases(artist_id,article_id) values (329,392);
INSERT INTO Releases(artist_id,article_id) values (329,71);
INSERT INTO Releases(artist_id,article_id) values (246,86);
INSERT INTO Releases(artist_id,article_id) values (246,360);
INSERT INTO Releases(artist_id,article_id) values (246,441);
INSERT INTO Releases(artist_id,article_id) values (246,179);
INSERT INTO Releases(artist_id,article_id) values (246,351);
INSERT INTO Releases(artist_id,article_id) values (27,198);
INSERT INTO Releases(artist_id,article_id) values (27,202);
INSERT INTO Releases(artist_id,article_id) values (216,409);
INSERT INTO Releases(artist_id,article_id) values (216,417);
INSERT INTO Releases(artist_id,article_id) values (216,219);
INSERT INTO Releases(artist_id,article_id) values (216,74);
INSERT INTO Releases(artist_id,article_id) values (315,400);
INSERT INTO Releases(artist_id,article_id) values (315,319);
INSERT INTO Releases(artist_id,article_id) values (315,416);
INSERT INTO Releases(artist_id,article_id) values (315,212);
INSERT INTO Releases(artist_id,article_id) values (315,327);
INSERT INTO Releases(artist_id,article_id) values (315,264);
INSERT INTO Releases(artist_id,article_id) values (315,286);
INSERT INTO Releases(artist_id,article_id) values (315,339);
INSERT INTO Releases(artist_id,article_id) values (315,204);
INSERT INTO Releases(artist_id,article_id) values (145,246);
INSERT INTO Releases(artist_id,article_id) values (145,248);
INSERT INTO Releases(artist_id,article_id) values (145,497);
INSERT INTO Releases(artist_id,article_id) values (145,112);
INSERT INTO Releases(artist_id,article_id) values (145,147);
INSERT INTO Releases(artist_id,article_id) values (145,193);
INSERT INTO Releases(artist_id,article_id) values (270,114);
INSERT INTO Releases(artist_id,article_id) values (270,180);
INSERT INTO Releases(artist_id,article_id) values (270,247);
INSERT INTO Releases(artist_id,article_id) values (113,70);
INSERT INTO Releases(artist_id,article_id) values (113,363);
INSERT INTO Releases(artist_id,article_id) values (113,420);
INSERT INTO Releases(artist_id,article_id) values (113,11);
INSERT INTO Releases(artist_id,article_id) values (113,482);
INSERT INTO Releases(artist_id,article_id) values (113,299);
INSERT INTO Releases(artist_id,article_id) values (113,24);
INSERT INTO Releases(artist_id,article_id) values (113,88);
INSERT INTO Releases(artist_id,article_id) values (113,60);
INSERT INTO Releases(artist_id,article_id) values (113,431);
INSERT INTO Releases(artist_id,article_id) values (113,7);
INSERT INTO Releases(artist_id,article_id) values (113,229);
INSERT INTO Releases(artist_id,article_id) values (113,289);
INSERT INTO Releases(artist_id,article_id) values (113,217);
INSERT INTO Releases(artist_id,article_id) values (113,166);
INSERT INTO Releases(artist_id,article_id) values (238,129);
INSERT INTO Releases(artist_id,article_id) values (238,391);
INSERT INTO Releases(artist_id,article_id) values (238,390);
INSERT INTO Releases(artist_id,article_id) values (238,330);
INSERT INTO Releases(artist_id,article_id) values (238,132);
INSERT INTO Releases(artist_id,article_id) values (238,383);
INSERT INTO Releases(artist_id,article_id) values (238,194);
INSERT INTO Releases(artist_id,article_id) values (238,458);
INSERT INTO Releases(artist_id,article_id) values (387,99);
INSERT INTO Releases(artist_id,article_id) values (387,159);
INSERT INTO Releases(artist_id,article_id) values (387,61);
INSERT INTO Releases(artist_id,article_id) values (387,470);
INSERT INTO Releases(artist_id,article_id) values (387,94);
INSERT INTO Releases(artist_id,article_id) values (387,472);
INSERT INTO Releases(artist_id,article_id) values (387,189);
INSERT INTO Releases(artist_id,article_id) values (236,181);
INSERT INTO Releases(artist_id,article_id) values (236,375);
INSERT INTO Releases(artist_id,article_id) values (236,174);
INSERT INTO Releases(artist_id,article_id) values (236,483);
INSERT INTO Releases(artist_id,article_id) values (236,295);
INSERT INTO Releases(artist_id,article_id) values (236,317);
INSERT INTO Releases(artist_id,article_id) values (236,117);
INSERT INTO Releases(artist_id,article_id) values (146,150);
INSERT INTO Releases(artist_id,article_id) values (146,361);
INSERT INTO Releases(artist_id,article_id) values (146,436);
INSERT INTO Releases(artist_id,article_id) values (146,398);
INSERT INTO Releases(artist_id,article_id) values (146,263);
INSERT INTO Releases(artist_id,article_id) values (146,72);
INSERT INTO Releases(artist_id,article_id) values (358,196);
INSERT INTO Releases(artist_id,article_id) values (358,32);
INSERT INTO Releases(artist_id,article_id) values (358,168);
INSERT INTO Releases(artist_id,article_id) values (358,325);
INSERT INTO Releases(artist_id,article_id) values (358,300);
INSERT INTO Releases(artist_id,article_id) values (358,160);
INSERT INTO Releases(artist_id,article_id) values (358,2);
INSERT INTO Releases(artist_id,article_id) values (358,254);
INSERT INTO Releases(artist_id,article_id) values (358,341);
INSERT INTO Releases(artist_id,article_id) values (358,5);
INSERT INTO Releases(artist_id,article_id) values (124,69);
INSERT INTO Releases(artist_id,article_id) values (124,31);
INSERT INTO Releases(artist_id,article_id) values (124,82);
INSERT INTO Releases(artist_id,article_id) values (124,75);
INSERT INTO Releases(artist_id,article_id) values (124,142);
INSERT INTO Releases(artist_id,article_id) values (353,14);
INSERT INTO Releases(artist_id,article_id) values (353,119);
INSERT INTO Releases(artist_id,article_id) values (353,369);
INSERT INTO Releases(artist_id,article_id) values (353,439);
INSERT INTO Releases(artist_id,article_id) values (353,424);
INSERT INTO Releases(artist_id,article_id) values (353,350);
INSERT INTO Releases(artist_id,article_id) values (353,310);
INSERT INTO Releases(artist_id,article_id) values (353,20);
INSERT INTO Releases(artist_id,article_id) values (143,450);
INSERT INTO Releases(artist_id,article_id) values (143,187);
INSERT INTO Releases(artist_id,article_id) values (143,115);
INSERT INTO Releases(artist_id,article_id) values (143,474);
INSERT INTO Releases(artist_id,article_id) values (143,257);
INSERT INTO Releases(artist_id,article_id) values (143,171);
INSERT INTO Releases(artist_id,article_id) values (335,261);
INSERT INTO Releases(artist_id,article_id) values (335,481);
INSERT INTO Releases(artist_id,article_id) values (335,93);
INSERT INTO Releases(artist_id,article_id) values (335,373);
INSERT INTO Releases(artist_id,article_id) values (335,475);
INSERT INTO Releases(artist_id,article_id) values (335,348);
INSERT INTO Releases(artist_id,article_id) values (144,33);
INSERT INTO Releases(artist_id,article_id) values (144,167);
INSERT INTO Releases(artist_id,article_id) values (144,26);
INSERT INTO Releases(artist_id,article_id) values (144,145);
INSERT INTO Releases(artist_id,article_id) values (144,149);
INSERT INTO Releases(artist_id,article_id) values (173,240);
INSERT INTO Releases(artist_id,article_id) values (173,141);
INSERT INTO Releases(artist_id,article_id) values (173,359);
INSERT INTO Releases(artist_id,article_id) values (173,139);
INSERT INTO Releases(artist_id,article_id) values (173,274);
INSERT INTO Releases(artist_id,article_id) values (173,215);
INSERT INTO Releases(artist_id,article_id) values (173,66);
INSERT INTO Releases(artist_id,article_id) values (163,277);
INSERT INTO Releases(artist_id,article_id) values (163,287);
INSERT INTO Releases(artist_id,article_id) values (163,102);
INSERT INTO Releases(artist_id,article_id) values (163,58);
INSERT INTO Releases(artist_id,article_id) values (163,366);
INSERT INTO Releases(artist_id,article_id) values (163,76);
INSERT INTO Releases(artist_id,article_id) values (163,320);
INSERT INTO Releases(artist_id,article_id) values (163,177);
INSERT INTO Releases(artist_id,article_id) values (171,397);
INSERT INTO Releases(artist_id,article_id) values (171,457);
INSERT INTO Releases(artist_id,article_id) values (171,335);
INSERT INTO Releases(artist_id,article_id) values (171,442);
INSERT INTO Releases(artist_id,article_id) values (171,140);
INSERT INTO Releases(artist_id,article_id) values (171,36);
INSERT INTO Releases(artist_id,article_id) values (171,73);
INSERT INTO Releases(artist_id,article_id) values (354,421);
INSERT INTO Releases(artist_id,article_id) values (354,296);
INSERT INTO Releases(artist_id,article_id) values (354,230);
INSERT INTO Releases(artist_id,article_id) values (354,311);
INSERT INTO Releases(artist_id,article_id) values (354,452);
INSERT INTO Releases(artist_id,article_id) values (354,90);
INSERT INTO Releases(artist_id,article_id) values (200,127);
INSERT INTO Releases(artist_id,article_id) values (200,3);
INSERT INTO Releases(artist_id,article_id) values (200,279);
INSERT INTO Releases(artist_id,article_id) values (200,205);
INSERT INTO Releases(artist_id,article_id) values (200,255);
INSERT INTO Releases(artist_id,article_id) values (200,116);
INSERT INTO Releases(artist_id,article_id) values (231,387);
INSERT INTO Releases(artist_id,article_id) values (231,37);
INSERT INTO Releases(artist_id,article_id) values (231,496);
INSERT INTO Releases(artist_id,article_id) values (231,345);
INSERT INTO Releases(artist_id,article_id) values (281,435);
INSERT INTO Releases(artist_id,article_id) values (281,406);
INSERT INTO Releases(artist_id,article_id) values (281,123);
INSERT INTO Releases(artist_id,article_id) values (281,242);
INSERT INTO Releases(artist_id,article_id) values (281,184);
INSERT INTO Releases(artist_id,article_id) values (281,316);
INSERT INTO Releases(artist_id,article_id) values (281,349);
INSERT INTO Releases(artist_id,article_id) values (281,337);
INSERT INTO Releases(artist_id,article_id) values (359,81);
INSERT INTO Releases(artist_id,article_id) values (359,413);
INSERT INTO Releases(artist_id,article_id) values (359,265);
INSERT INTO Releases(artist_id,article_id) values (359,427);
INSERT INTO Releases(artist_id,article_id) values (359,495);
INSERT INTO Releases(artist_id,article_id) values (359,226);
INSERT INTO Releases(artist_id,article_id) values (118,355);
INSERT INTO Releases(artist_id,article_id) values (118,136);
INSERT INTO Releases(artist_id,article_id) values (118,162);
INSERT INTO Releases(artist_id,article_id) values (118,197);
INSERT INTO Releases(artist_id,article_id) values (177,395);
INSERT INTO Releases(artist_id,article_id) values (177,284);
INSERT INTO Releases(artist_id,article_id) values (177,354);
INSERT INTO Releases(artist_id,article_id) values (177,267);
INSERT INTO Releases(artist_id,article_id) values (177,272);
INSERT INTO Releases(artist_id,article_id) values (177,97);
INSERT INTO Releases(artist_id,article_id) values (373,336);
INSERT INTO Releases(artist_id,article_id) values (373,128);
INSERT INTO Releases(artist_id,article_id) values (373,190);
INSERT INTO Releases(artist_id,article_id) values (373,251);
INSERT INTO Releases(artist_id,article_id) values (373,122);
INSERT INTO Releases(artist_id,article_id) values (373,96);
INSERT INTO Releases(artist_id,article_id) values (71,233);
INSERT INTO Releases(artist_id,article_id) values (71,106);
INSERT INTO Releases(artist_id,article_id) values (71,221);
INSERT INTO Releases(artist_id,article_id) values (71,250);
INSERT INTO Releases(artist_id,article_id) values (71,303);
INSERT INTO Releases(artist_id,article_id) values (71,222);
INSERT INTO Releases(artist_id,article_id) values (71,433);
INSERT INTO Releases(artist_id,article_id) values (71,188);




INSERT INTO BelongsTo(song_id,album_id) values (25,62);
INSERT INTO BelongsTo(song_id,album_id) values (68,62);
INSERT INTO BelongsTo(song_id,album_id) values (252,62);
INSERT INTO BelongsTo(song_id,album_id) values (21,62);
INSERT INTO BelongsTo(song_id,album_id) values (0,62);
INSERT INTO BelongsTo(song_id,album_id) values (125,278);
INSERT INTO BelongsTo(song_id,album_id) values (446,278);
INSERT INTO BelongsTo(song_id,album_id) values (87,278);
INSERT INTO BelongsTo(song_id,album_id) values (364,253);
INSERT INTO BelongsTo(song_id,album_id) values (451,357);
INSERT INTO BelongsTo(song_id,album_id) values (464,357);
INSERT INTO BelongsTo(song_id,album_id) values (262,357);
INSERT INTO BelongsTo(song_id,album_id) values (392,71);
INSERT INTO BelongsTo(song_id,album_id) values (86,351);
INSERT INTO BelongsTo(song_id,album_id) values (360,351);
INSERT INTO BelongsTo(song_id,album_id) values (441,351);
INSERT INTO BelongsTo(song_id,album_id) values (179,351);
INSERT INTO BelongsTo(song_id,album_id) values (198,202);
INSERT INTO BelongsTo(song_id,album_id) values (409,417);
INSERT INTO BelongsTo(song_id,album_id) values (219,74);
INSERT INTO BelongsTo(song_id,album_id) values (400,327);
INSERT INTO BelongsTo(song_id,album_id) values (319,327);
INSERT INTO BelongsTo(song_id,album_id) values (416,327);
INSERT INTO BelongsTo(song_id,album_id) values (212,327);
INSERT INTO BelongsTo(song_id,album_id) values (264,204);
INSERT INTO BelongsTo(song_id,album_id) values (286,204);
INSERT INTO BelongsTo(song_id,album_id) values (339,204);
INSERT INTO BelongsTo(song_id,album_id) values (246,248);
INSERT INTO BelongsTo(song_id,album_id) values (497,112);
INSERT INTO BelongsTo(song_id,album_id) values (147,193);
INSERT INTO BelongsTo(song_id,album_id) values (114,247);
INSERT INTO BelongsTo(song_id,album_id) values (180,247);
INSERT INTO BelongsTo(song_id,album_id) values (70,24);
INSERT INTO BelongsTo(song_id,album_id) values (363,24);
INSERT INTO BelongsTo(song_id,album_id) values (420,24);
INSERT INTO BelongsTo(song_id,album_id) values (11,24);
INSERT INTO BelongsTo(song_id,album_id) values (482,24);
INSERT INTO BelongsTo(song_id,album_id) values (299,24);
INSERT INTO BelongsTo(song_id,album_id) values (88,166);
INSERT INTO BelongsTo(song_id,album_id) values (60,166);
INSERT INTO BelongsTo(song_id,album_id) values (431,166);
INSERT INTO BelongsTo(song_id,album_id) values (7,166);
INSERT INTO BelongsTo(song_id,album_id) values (229,166);
INSERT INTO BelongsTo(song_id,album_id) values (289,166);
INSERT INTO BelongsTo(song_id,album_id) values (217,166);
INSERT INTO BelongsTo(song_id,album_id) values (129,391);
INSERT INTO BelongsTo(song_id,album_id) values (390,458);
INSERT INTO BelongsTo(song_id,album_id) values (330,458);
INSERT INTO BelongsTo(song_id,album_id) values (132,458);
INSERT INTO BelongsTo(song_id,album_id) values (383,458);
INSERT INTO BelongsTo(song_id,album_id) values (194,458);
INSERT INTO BelongsTo(song_id,album_id) values (99,189);
INSERT INTO BelongsTo(song_id,album_id) values (159,189);
INSERT INTO BelongsTo(song_id,album_id) values (61,189);
INSERT INTO BelongsTo(song_id,album_id) values (470,189);
INSERT INTO BelongsTo(song_id,album_id) values (94,189);
INSERT INTO BelongsTo(song_id,album_id) values (472,189);
INSERT INTO BelongsTo(song_id,album_id) values (181,375);
INSERT INTO BelongsTo(song_id,album_id) values (174,483);
INSERT INTO BelongsTo(song_id,album_id) values (295,117);
INSERT INTO BelongsTo(song_id,album_id) values (317,117);
INSERT INTO BelongsTo(song_id,album_id) values (150,72);
INSERT INTO BelongsTo(song_id,album_id) values (361,72);
INSERT INTO BelongsTo(song_id,album_id) values (436,72);
INSERT INTO BelongsTo(song_id,album_id) values (398,72);
INSERT INTO BelongsTo(song_id,album_id) values (263,72);
INSERT INTO BelongsTo(song_id,album_id) values (196,160);
INSERT INTO BelongsTo(song_id,album_id) values (32,160);
INSERT INTO BelongsTo(song_id,album_id) values (168,160);
INSERT INTO BelongsTo(song_id,album_id) values (325,160);
INSERT INTO BelongsTo(song_id,album_id) values (300,160);
INSERT INTO BelongsTo(song_id,album_id) values (2,254);
INSERT INTO BelongsTo(song_id,album_id) values (341,341);
INSERT INTO BelongsTo(song_id,album_id) values (69,142);
INSERT INTO BelongsTo(song_id,album_id) values (31,142);
INSERT INTO BelongsTo(song_id,album_id) values (82,142);
INSERT INTO BelongsTo(song_id,album_id) values (75,142);
INSERT INTO BelongsTo(song_id,album_id) values (14,424);
INSERT INTO BelongsTo(song_id,album_id) values (119,424);
INSERT INTO BelongsTo(song_id,album_id) values (369,424);
INSERT INTO BelongsTo(song_id,album_id) values (439,424);
INSERT INTO BelongsTo(song_id,album_id) values (350,20);
INSERT INTO BelongsTo(song_id,album_id) values (310,20);
INSERT INTO BelongsTo(song_id,album_id) values (450,171);
INSERT INTO BelongsTo(song_id,album_id) values (187,171);
INSERT INTO BelongsTo(song_id,album_id) values (115,171);
INSERT INTO BelongsTo(song_id,album_id) values (474,171);
INSERT INTO BelongsTo(song_id,album_id) values (257,171);
INSERT INTO BelongsTo(song_id,album_id) values (261,348);
INSERT INTO BelongsTo(song_id,album_id) values (481,348);
INSERT INTO BelongsTo(song_id,album_id) values (93,348);
INSERT INTO BelongsTo(song_id,album_id) values (373,348);
INSERT INTO BelongsTo(song_id,album_id) values (475,348);
INSERT INTO BelongsTo(song_id,album_id) values (33,149);
INSERT INTO BelongsTo(song_id,album_id) values (167,149);
INSERT INTO BelongsTo(song_id,album_id) values (26,149);
INSERT INTO BelongsTo(song_id,album_id) values (145,149);
INSERT INTO BelongsTo(song_id,album_id) values (240,274);
INSERT INTO BelongsTo(song_id,album_id) values (141,274);
INSERT INTO BelongsTo(song_id,album_id) values (359,274);
INSERT INTO BelongsTo(song_id,album_id) values (139,274);
INSERT INTO BelongsTo(song_id,album_id) values (215,66);
INSERT INTO BelongsTo(song_id,album_id) values (277,76);
INSERT INTO BelongsTo(song_id,album_id) values (287,76);
INSERT INTO BelongsTo(song_id,album_id) values (102,76);
INSERT INTO BelongsTo(song_id,album_id) values (58,76);
INSERT INTO BelongsTo(song_id,album_id) values (366,76);
INSERT INTO BelongsTo(song_id,album_id) values (320,177);
INSERT INTO BelongsTo(song_id,album_id) values (397,73);
INSERT INTO BelongsTo(song_id,album_id) values (457,73);
INSERT INTO BelongsTo(song_id,album_id) values (335,73);
INSERT INTO BelongsTo(song_id,album_id) values (442,73);
INSERT INTO BelongsTo(song_id,album_id) values (140,73);
INSERT INTO BelongsTo(song_id,album_id) values (36,73);
INSERT INTO BelongsTo(song_id,album_id) values (421,90);
INSERT INTO BelongsTo(song_id,album_id) values (296,90);
INSERT INTO BelongsTo(song_id,album_id) values (230,90);
INSERT INTO BelongsTo(song_id,album_id) values (311,90);
INSERT INTO BelongsTo(song_id,album_id) values (452,90);
INSERT INTO BelongsTo(song_id,album_id) values (127,3);
INSERT INTO BelongsTo(song_id,album_id) values (279,205);
INSERT INTO BelongsTo(song_id,album_id) values (255,116);
INSERT INTO BelongsTo(song_id,album_id) values (387,37);
INSERT INTO BelongsTo(song_id,album_id) values (496,345);
INSERT INTO BelongsTo(song_id,album_id) values (435,406);
INSERT INTO BelongsTo(song_id,album_id) values (123,242);
INSERT INTO BelongsTo(song_id,album_id) values (184,316);
INSERT INTO BelongsTo(song_id,album_id) values (349,337);
INSERT INTO BelongsTo(song_id,album_id) values (81,226);
INSERT INTO BelongsTo(song_id,album_id) values (413,226);
INSERT INTO BelongsTo(song_id,album_id) values (265,226);
INSERT INTO BelongsTo(song_id,album_id) values (427,226);
INSERT INTO BelongsTo(song_id,album_id) values (495,226);
INSERT INTO BelongsTo(song_id,album_id) values (355,197);
INSERT INTO BelongsTo(song_id,album_id) values (136,197);
INSERT INTO BelongsTo(song_id,album_id) values (162,197);
INSERT INTO BelongsTo(song_id,album_id) values (395,97);
INSERT INTO BelongsTo(song_id,album_id) values (284,97);
INSERT INTO BelongsTo(song_id,album_id) values (354,97);
INSERT INTO BelongsTo(song_id,album_id) values (267,97);
INSERT INTO BelongsTo(song_id,album_id) values (272,97);
INSERT INTO BelongsTo(song_id,album_id) values (336,128);
INSERT INTO BelongsTo(song_id,album_id) values (190,251);
INSERT INTO BelongsTo(song_id,album_id) values (122,96);
INSERT INTO BelongsTo(song_id,album_id) values (233,106);
INSERT INTO BelongsTo(song_id,album_id) values (221,250);
INSERT INTO BelongsTo(song_id,album_id) values (303,188);
INSERT INTO BelongsTo(song_id,album_id) values (222,188);
INSERT INTO BelongsTo(song_id,album_id) values (433,188);




INSERT INTO ComprisesOf(lib_id,name) values (1,'favs',25);
INSERT INTO ComprisesOf(lib_id,name) values (1,'favs',68);
INSERT INTO ComprisesOf(lib_id,name) values (1,'favs',252);
INSERT INTO ComprisesOf(lib_id,name) values (1,'favs',21);
INSERT INTO ComprisesOf(lib_id,name) values (1,'favs',0);
INSERT INTO ComprisesOf(lib_id,name) values (1,'favs',360);
INSERT INTO ComprisesOf(lib_id,name) values (2,'cool songs',125);
INSERT INTO ComprisesOf(lib_id,name) values (2,'cool songs',446);
INSERT INTO ComprisesOf(lib_id,name) values (2,'cool songs',87);
INSERT INTO ComprisesOf(lib_id,name) values (2,'cool songs',262);
INSERT INTO ComprisesOf(lib_id,name) values (3,'vibe',364);
INSERT INTO ComprisesOf(lib_id,name) values (3,'vibe',409);
INSERT INTO ComprisesOf(lib_id,name) values (4,'songs',451);
INSERT INTO ComprisesOf(lib_id,name) values (4,'songs',464);
INSERT INTO ComprisesOf(lib_id,name) values (4,'songs',262);
INSERT INTO ComprisesOf(lib_id,name) values (4,'songs',416);
INSERT INTO ComprisesOf(lib_id,name) values (5,'my songs',392);
INSERT INTO ComprisesOf(lib_id,name) values (5,'my songs',319);
INSERT INTO ComprisesOf(lib_id,name) values (6,'pl',86);
INSERT INTO ComprisesOf(lib_id,name) values (6,'pl',360);
INSERT INTO ComprisesOf(lib_id,name) values (6,'pl',441);
INSERT INTO ComprisesOf(lib_id,name) values (6,'pl',179);
INSERT INTO ComprisesOf(lib_id,name) values (6,'pl',416);
INSERT INTO ComprisesOf(lib_id,name) values (7,'my favorites',198);
INSERT INTO ComprisesOf(lib_id,name) values (7,'my favorites',339);
INSERT INTO ComprisesOf(lib_id,name) values (8,'my favs',409);
INSERT INTO ComprisesOf(lib_id,name) values (8,'my favs',364);
INSERT INTO ComprisesOf(lib_id,name) values (9,'favorites',219);
INSERT INTO ComprisesOf(lib_id,name) values (9,'favorites',246);
INSERT INTO ComprisesOf(lib_id,name) values (10,'love these songs',400);
INSERT INTO ComprisesOf(lib_id,name) values (10,'love these songs',319);
INSERT INTO ComprisesOf(lib_id,name) values (10,'love these songs',416);
INSERT INTO ComprisesOf(lib_id,name) values (10,'love these songs',212);
INSERT INTO ComprisesOf(lib_id,name) values (10,'love these songs',114);
INSERT INTO ComprisesOf(lib_id,name) values (11,'yeh',264);
INSERT INTO ComprisesOf(lib_id,name) values (11,'yeh',286);
INSERT INTO ComprisesOf(lib_id,name) values (11,'yeh',339);
INSERT INTO ComprisesOf(lib_id,name) values (11,'yeh',319);
INSERT INTO ComprisesOf(lib_id,name) values (12,'cool songs',246);
INSERT INTO ComprisesOf(lib_id,name) values (12,'cool songs',416);
INSERT INTO ComprisesOf(lib_id,name) values (13,'My Favorites',497);
INSERT INTO ComprisesOf(lib_id,name) values (13,'My Favorites',364);
INSERT INTO ComprisesOf(lib_id,name) values (14,'playlist 33',147);
INSERT INTO ComprisesOf(lib_id,name) values (14,'playlist 33',482);
INSERT INTO ComprisesOf(lib_id,name) values (15,'nice songs',114);
INSERT INTO ComprisesOf(lib_id,name) values (15,'nice songs',180);
INSERT INTO ComprisesOf(lib_id,name) values (15,'nice songs',482);
INSERT INTO ComprisesOf(lib_id,name) values (16,'melody',70);
INSERT INTO ComprisesOf(lib_id,name) values (16,'melody',363);
INSERT INTO ComprisesOf(lib_id,name) values (16,'melody',420);
INSERT INTO ComprisesOf(lib_id,name) values (16,'melody',11);
INSERT INTO ComprisesOf(lib_id,name) values (16,'melody',482);
INSERT INTO ComprisesOf(lib_id,name) values (16,'melody',299);
INSERT INTO ComprisesOf(lib_id,name) values (16,'melody',217);
INSERT INTO ComprisesOf(lib_id,name) values (17,'beats',88);
INSERT INTO ComprisesOf(lib_id,name) values (17,'beats',60);
INSERT INTO ComprisesOf(lib_id,name) values (17,'beats',431);
INSERT INTO ComprisesOf(lib_id,name) values (17,'beats',7);
INSERT INTO ComprisesOf(lib_id,name) values (17,'beats',229);
INSERT INTO ComprisesOf(lib_id,name) values (17,'beats',289);
INSERT INTO ComprisesOf(lib_id,name) values (17,'beats',217);
INSERT INTO ComprisesOf(lib_id,name) values (17,'beats',180);




INSERT INTO IsAddedTo(article_id,lib_id) values (1,25);
INSERT INTO IsAddedTo(article_id,lib_id) values (1,68);
INSERT INTO IsAddedTo(article_id,lib_id) values (1,252);
INSERT INTO IsAddedTo(article_id,lib_id) values (1,21);
INSERT INTO IsAddedTo(article_id,lib_id) values (1,0);
INSERT INTO IsAddedTo(article_id,lib_id) values (1,62);
INSERT INTO IsAddedTo(article_id,lib_id) values (1,360);
INSERT INTO IsAddedTo(article_id,lib_id) values (2,125);
INSERT INTO IsAddedTo(article_id,lib_id) values (2,446);
INSERT INTO IsAddedTo(article_id,lib_id) values (2,87);
INSERT INTO IsAddedTo(article_id,lib_id) values (2,278);
INSERT INTO IsAddedTo(article_id,lib_id) values (2,262);
INSERT INTO IsAddedTo(article_id,lib_id) values (3,364);
INSERT INTO IsAddedTo(article_id,lib_id) values (3,253);
INSERT INTO IsAddedTo(article_id,lib_id) values (3,409);
INSERT INTO IsAddedTo(article_id,lib_id) values (4,451);
INSERT INTO IsAddedTo(article_id,lib_id) values (4,464);
INSERT INTO IsAddedTo(article_id,lib_id) values (4,262);
INSERT INTO IsAddedTo(article_id,lib_id) values (4,357);
INSERT INTO IsAddedTo(article_id,lib_id) values (4,416);
INSERT INTO IsAddedTo(article_id,lib_id) values (5,392);
INSERT INTO IsAddedTo(article_id,lib_id) values (5,71);
INSERT INTO IsAddedTo(article_id,lib_id) values (5,319);
INSERT INTO IsAddedTo(article_id,lib_id) values (6,86);
INSERT INTO IsAddedTo(article_id,lib_id) values (6,360);
INSERT INTO IsAddedTo(article_id,lib_id) values (6,441);
INSERT INTO IsAddedTo(article_id,lib_id) values (6,179);
INSERT INTO IsAddedTo(article_id,lib_id) values (6,351);
INSERT INTO IsAddedTo(article_id,lib_id) values (6,416);
INSERT INTO IsAddedTo(article_id,lib_id) values (7,198);
INSERT INTO IsAddedTo(article_id,lib_id) values (7,202);
INSERT INTO IsAddedTo(article_id,lib_id) values (7,339);
INSERT INTO IsAddedTo(article_id,lib_id) values (8,409);
INSERT INTO IsAddedTo(article_id,lib_id) values (8,417);
INSERT INTO IsAddedTo(article_id,lib_id) values (8,364);
INSERT INTO IsAddedTo(article_id,lib_id) values (9,219);
INSERT INTO IsAddedTo(article_id,lib_id) values (9,74);
INSERT INTO IsAddedTo(article_id,lib_id) values (9,246);
INSERT INTO IsAddedTo(article_id,lib_id) values (10,400);
INSERT INTO IsAddedTo(article_id,lib_id) values (10,319);
INSERT INTO IsAddedTo(article_id,lib_id) values (10,416);
INSERT INTO IsAddedTo(article_id,lib_id) values (10,212);
INSERT INTO IsAddedTo(article_id,lib_id) values (10,327);
INSERT INTO IsAddedTo(article_id,lib_id) values (10,114);
INSERT INTO IsAddedTo(article_id,lib_id) values (11,264);
INSERT INTO IsAddedTo(article_id,lib_id) values (11,286);
INSERT INTO IsAddedTo(article_id,lib_id) values (11,339);
INSERT INTO IsAddedTo(article_id,lib_id) values (11,204);
INSERT INTO IsAddedTo(article_id,lib_id) values (11,319);
INSERT INTO IsAddedTo(article_id,lib_id) values (12,246);
INSERT INTO IsAddedTo(article_id,lib_id) values (12,248);
INSERT INTO IsAddedTo(article_id,lib_id) values (12,416);
INSERT INTO IsAddedTo(article_id,lib_id) values (13,497);
INSERT INTO IsAddedTo(article_id,lib_id) values (13,112);
INSERT INTO IsAddedTo(article_id,lib_id) values (13,364);
INSERT INTO IsAddedTo(article_id,lib_id) values (14,147);
INSERT INTO IsAddedTo(article_id,lib_id) values (14,193);
INSERT INTO IsAddedTo(article_id,lib_id) values (14,482);
INSERT INTO IsAddedTo(article_id,lib_id) values (15,114);
INSERT INTO IsAddedTo(article_id,lib_id) values (15,180);
INSERT INTO IsAddedTo(article_id,lib_id) values (15,247);
INSERT INTO IsAddedTo(article_id,lib_id) values (15,482);
INSERT INTO IsAddedTo(article_id,lib_id) values (16,70);
INSERT INTO IsAddedTo(article_id,lib_id) values (16,363);
INSERT INTO IsAddedTo(article_id,lib_id) values (16,420);
INSERT INTO IsAddedTo(article_id,lib_id) values (16,11);
INSERT INTO IsAddedTo(article_id,lib_id) values (16,482);
INSERT INTO IsAddedTo(article_id,lib_id) values (16,299);
INSERT INTO IsAddedTo(article_id,lib_id) values (16,24);
INSERT INTO IsAddedTo(article_id,lib_id) values (16,217);
INSERT INTO IsAddedTo(article_id,lib_id) values (17,88);
INSERT INTO IsAddedTo(article_id,lib_id) values (17,60);
INSERT INTO IsAddedTo(article_id,lib_id) values (17,431);
INSERT INTO IsAddedTo(article_id,lib_id) values (17,7);
INSERT INTO IsAddedTo(article_id,lib_id) values (17,229);
INSERT INTO IsAddedTo(article_id,lib_id) values (17,289);
INSERT INTO IsAddedTo(article_id,lib_id) values (17,217);
INSERT INTO IsAddedTo(article_id,lib_id) values (17,166);
INSERT INTO IsAddedTo(article_id,lib_id) values (17,180);




INSERT INTO IsPartOf(name,lib_id) values ('favs',1);
INSERT INTO IsPartOf(name,lib_id) values ('cool songs',2);
INSERT INTO IsPartOf(name,lib_id) values ('vibe',3);
INSERT INTO IsPartOf(name,lib_id) values ('songs',4);
INSERT INTO IsPartOf(name,lib_id) values ('my songs',5);
INSERT INTO IsPartOf(name,lib_id) values ('pl',6);
INSERT INTO IsPartOf(name,lib_id) values ('my favorites',7);
INSERT INTO IsPartOf(name,lib_id) values ('my favs',8);
INSERT INTO IsPartOf(name,lib_id) values ('favorites',9);
INSERT INTO IsPartOf(name,lib_id) values ('love these songs',10);
INSERT INTO IsPartOf(name,lib_id) values ('yeh',11);
INSERT INTO IsPartOf(name,lib_id) values ('cool songs',12);
INSERT INTO IsPartOf(name,lib_id) values ('My Favorites',13);
INSERT INTO IsPartOf(name,lib_id) values ('playlist 33',14);
INSERT INTO IsPartOf(name,lib_id) values ('nice songs',15);
INSERT INTO IsPartOf(name,lib_id) values ('melody',16);
INSERT INTO IsPartOf(name,lib_id) values ('beats',17);




INSERT INTO Contains(order_id, article_id) values (0,25);
INSERT INTO Contains(order_id, article_id) values (0,68);
INSERT INTO Contains(order_id, article_id) values (0,252);
INSERT INTO Contains(order_id, article_id) values (0,21);
INSERT INTO Contains(order_id, article_id) values (0,0);
INSERT INTO Contains(order_id, article_id) values (0,62);
INSERT INTO Contains(order_id, article_id) values (0,360);
INSERT INTO Contains(order_id, article_id) values (1,125);
INSERT INTO Contains(order_id, article_id) values (1,446);
INSERT INTO Contains(order_id, article_id) values (1,87);
INSERT INTO Contains(order_id, article_id) values (1,278);
INSERT INTO Contains(order_id, article_id) values (1,262);
INSERT INTO Contains(order_id, article_id) values (2,364);
INSERT INTO Contains(order_id, article_id) values (2,253);
INSERT INTO Contains(order_id, article_id) values (2,409);
INSERT INTO Contains(order_id, article_id) values (3,451);
INSERT INTO Contains(order_id, article_id) values (3,464);
INSERT INTO Contains(order_id, article_id) values (3,262);
INSERT INTO Contains(order_id, article_id) values (3,357);
INSERT INTO Contains(order_id, article_id) values (3,416);
INSERT INTO Contains(order_id, article_id) values (4,392);
INSERT INTO Contains(order_id, article_id) values (4,71);
INSERT INTO Contains(order_id, article_id) values (4,319);
INSERT INTO Contains(order_id, article_id) values (5,86);
INSERT INTO Contains(order_id, article_id) values (5,360);
INSERT INTO Contains(order_id, article_id) values (5,441);
INSERT INTO Contains(order_id, article_id) values (5,179);
INSERT INTO Contains(order_id, article_id) values (5,351);
INSERT INTO Contains(order_id, article_id) values (5,416);
INSERT INTO Contains(order_id, article_id) values (6,198);
INSERT INTO Contains(order_id, article_id) values (6,202);
INSERT INTO Contains(order_id, article_id) values (6,339);
INSERT INTO Contains(order_id, article_id) values (7,409);
INSERT INTO Contains(order_id, article_id) values (7,417);
INSERT INTO Contains(order_id, article_id) values (7,364);
INSERT INTO Contains(order_id, article_id) values (8,219);
INSERT INTO Contains(order_id, article_id) values (8,74);
INSERT INTO Contains(order_id, article_id) values (8,246);
INSERT INTO Contains(order_id, article_id) values (9,400);
INSERT INTO Contains(order_id, article_id) values (9,319);
INSERT INTO Contains(order_id, article_id) values (9,416);
INSERT INTO Contains(order_id, article_id) values (9,212);
INSERT INTO Contains(order_id, article_id) values (9,327);
INSERT INTO Contains(order_id, article_id) values (9,114);
INSERT INTO Contains(order_id, article_id) values (10,264);
INSERT INTO Contains(order_id, article_id) values (10,286);
INSERT INTO Contains(order_id, article_id) values (10,339);
INSERT INTO Contains(order_id, article_id) values (10,204);
INSERT INTO Contains(order_id, article_id) values (10,319);
INSERT INTO Contains(order_id, article_id) values (11,246);
INSERT INTO Contains(order_id, article_id) values (11,248);
INSERT INTO Contains(order_id, article_id) values (11,416);
INSERT INTO Contains(order_id, article_id) values (12,497);
INSERT INTO Contains(order_id, article_id) values (12,112);
INSERT INTO Contains(order_id, article_id) values (12,364);
INSERT INTO Contains(order_id, article_id) values (13,147);
INSERT INTO Contains(order_id, article_id) values (13,193);
INSERT INTO Contains(order_id, article_id) values (13,482);
INSERT INTO Contains(order_id, article_id) values (14,114);
INSERT INTO Contains(order_id, article_id) values (14,180);
INSERT INTO Contains(order_id, article_id) values (14,247);
INSERT INTO Contains(order_id, article_id) values (14,482);
INSERT INTO Contains(order_id, article_id) values (15,70);
INSERT INTO Contains(order_id, article_id) values (15,363);
INSERT INTO Contains(order_id, article_id) values (15,420);
INSERT INTO Contains(order_id, article_id) values (15,11);
INSERT INTO Contains(order_id, article_id) values (15,482);
INSERT INTO Contains(order_id, article_id) values (15,299);
INSERT INTO Contains(order_id, article_id) values (15,24);
INSERT INTO Contains(order_id, article_id) values (15,217);
INSERT INTO Contains(order_id, article_id) values (16,88);
INSERT INTO Contains(order_id, article_id) values (16,60);
INSERT INTO Contains(order_id, article_id) values (16,431);
INSERT INTO Contains(order_id, article_id) values (16,7);
INSERT INTO Contains(order_id, article_id) values (16,229);
INSERT INTO Contains(order_id, article_id) values (16,289);
INSERT INTO Contains(order_id, article_id) values (16,217);
INSERT INTO Contains(order_id, article_id) values (16,166);
INSERT INTO Contains(order_id, article_id) values (16,180);




INSERT INTO Uses(listener_id,order_id) values (0,107);
INSERT INTO Uses(listener_id,order_id) values (1,69);
INSERT INTO Uses(listener_id,order_id) values (2,395);
INSERT INTO Uses(listener_id,order_id) values (3,38);
INSERT INTO Uses(listener_id,order_id) values (4,323);
INSERT INTO Uses(listener_id,order_id) values (5,368);
INSERT INTO Uses(listener_id,order_id) values (6,12);
INSERT INTO Uses(listener_id,order_id) values (7,164);
INSERT INTO Uses(listener_id,order_id) values (8,365);
INSERT INTO Uses(listener_id,order_id) values (9,179);
INSERT INTO Uses(listener_id,order_id) values (10,320);
INSERT INTO Uses(listener_id,order_id) values (11,253);
INSERT INTO Uses(listener_id,order_id) values (12,34);
INSERT INTO Uses(listener_id,order_id) values (13,108);
INSERT INTO Uses(listener_id,order_id) values (14,310);
INSERT INTO Uses(listener_id,order_id) values (15,168);
INSERT INTO Uses(listener_id,order_id) values (16,185);




INSERT INTO Creates(listener_id,lib_id,name) values (107,1,'favs');
INSERT INTO Creates(listener_id,lib_id,name) values (69,2,'cool songs');
INSERT INTO Creates(listener_id,lib_id,name) values (395,3,'vibe');
INSERT INTO Creates(listener_id,lib_id,name) values (38,4,'songs');
INSERT INTO Creates(listener_id,lib_id,name) values (323,5,'my songs');
INSERT INTO Creates(listener_id,lib_id,name) values (368,6,'pl');
INSERT INTO Creates(listener_id,lib_id,name) values (12,7,'my favorites');
INSERT INTO Creates(listener_id,lib_id,name) values (164,8,'my favs');
INSERT INTO Creates(listener_id,lib_id,name) values (365,9,'favorites');
INSERT INTO Creates(listener_id,lib_id,name) values (179,10,'love these songs');
INSERT INTO Creates(listener_id,lib_id,name) values (320,11,'yeh');
INSERT INTO Creates(listener_id,lib_id,name) values (253,12,'cool songs');
INSERT INTO Creates(listener_id,lib_id,name) values (34,13,'My Favorites');
INSERT INTO Creates(listener_id,lib_id,name) values (108,14,'playlist 33');
INSERT INTO Creates(listener_id,lib_id,name) values (310,15,'nice songs');
INSERT INTO Creates(listener_id,lib_id,name) values (168,16,'melody');
INSERT INTO Creates(listener_id,lib_id,name) values (185,17,'beats');




INSERT INTO moneyEarned(artist_id,order_id,money_received) values (89,0,2.75);
INSERT INTO moneyEarned(artist_id,order_id,money_received) values (246,0,0.55);
INSERT INTO moneyEarned(artist_id,order_id,money_received) values (13,1,2.85);
INSERT INTO moneyEarned(artist_id,order_id,money_received) values (329,1,0.95);
INSERT INTO moneyEarned(artist_id,order_id,money_received) values (334,2,0.95);
INSERT INTO moneyEarned(artist_id,order_id,money_received) values (216,2,0.0);
INSERT INTO moneyEarned(artist_id,order_id,money_received) values (329,3,2.85);
INSERT INTO moneyEarned(artist_id,order_id,money_received) values (315,3,0.95);
INSERT INTO moneyEarned(artist_id,order_id,money_received) values (329,4,0.95);
INSERT INTO moneyEarned(artist_id,order_id,money_received) values (315,4,0.95);
INSERT INTO moneyEarned(artist_id,order_id,money_received) values (246,5,2.2);
INSERT INTO moneyEarned(artist_id,order_id,money_received) values (315,5,0.95);
INSERT INTO moneyEarned(artist_id,order_id,money_received) values (27,6,0.0);
INSERT INTO moneyEarned(artist_id,order_id,money_received) values (315,6,0.55);
INSERT INTO moneyEarned(artist_id,order_id,money_received) values (216,7,0.0);
INSERT INTO moneyEarned(artist_id,order_id,money_received) values (334,7,0.95);
INSERT INTO moneyEarned(artist_id,order_id,money_received) values (216,8,0.0);
INSERT INTO moneyEarned(artist_id,order_id,money_received) values (145,8,0.0);
INSERT INTO moneyEarned(artist_id,order_id,money_received) values (315,9,3.8);
INSERT INTO moneyEarned(artist_id,order_id,money_received) values (270,9,0.55);
INSERT INTO moneyEarned(artist_id,order_id,money_received) values (315,10,2.05);
INSERT INTO moneyEarned(artist_id,order_id,money_received) values (315,10,0.95);
INSERT INTO moneyEarned(artist_id,order_id,money_received) values (145,11,0.0);
INSERT INTO moneyEarned(artist_id,order_id,money_received) values (315,11,0.95);
INSERT INTO moneyEarned(artist_id,order_id,money_received) values (145,12,0.0);
INSERT INTO moneyEarned(artist_id,order_id,money_received) values (334,12,0.95);
INSERT INTO moneyEarned(artist_id,order_id,money_received) values (145,13,0.0);
INSERT INTO moneyEarned(artist_id,order_id,money_received) values (113,13,0.55);
INSERT INTO moneyEarned(artist_id,order_id,money_received) values (270,14,1.1);
INSERT INTO moneyEarned(artist_id,order_id,money_received) values (113,14,0.55);
INSERT INTO moneyEarned(artist_id,order_id,money_received) values (113,15,3.3);
INSERT INTO moneyEarned(artist_id,order_id,money_received) values (113,15,0.55);
INSERT INTO moneyEarned(artist_id,order_id,money_received) values (113,16,3.85);
INSERT INTO moneyEarned(artist_id,order_id,money_received) values (270,16,0.55);




INSERT INTO Has(listener_id,lib_id) values (107,1);
INSERT INTO Has(listener_id,lib_id) values (69,2);
INSERT INTO Has(listener_id,lib_id) values (395,3);
INSERT INTO Has(listener_id,lib_id) values (38,4);
INSERT INTO Has(listener_id,lib_id) values (323,5);
INSERT INTO Has(listener_id,lib_id) values (368,6);
INSERT INTO Has(listener_id,lib_id) values (12,7);
INSERT INTO Has(listener_id,lib_id) values (164,8);
INSERT INTO Has(listener_id,lib_id) values (365,9);
INSERT INTO Has(listener_id,lib_id) values (179,10);
INSERT INTO Has(listener_id,lib_id) values (320,11);
INSERT INTO Has(listener_id,lib_id) values (253,12);
INSERT INTO Has(listener_id,lib_id) values (34,13);
INSERT INTO Has(listener_id,lib_id) values (108,14);
INSERT INTO Has(listener_id,lib_id) values (310,15);
INSERT INTO Has(listener_id,lib_id) values (168,16);
INSERT INTO Has(listener_id,lib_id) values (185,17);