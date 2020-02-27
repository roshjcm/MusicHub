INSERT INTO users VALUES(12345678, 'jannalouisea', 'Canada', 'jannalouisea@gmail.com', '2020-02-21', '123456789');
INSERT INTO users VALUES(12345678, 'maanavsund', 'Canada', 'maanax9000@gmail.com', '2020-02-21', '123456789');
INSERT INTO users VALUES(12345678, 'louiseoyarzabal', 'Canada', 'oyarzabal.louise@gmail.com', '2020-02-21', '123456789');
INSERT INTO users VALUES(12345678, 'roshanejochum', 'Canada', 'roshanejochum@gmail.com', '2020-02-21', '123456789');
INSERT INTO users VALUES(12345678, 'josephdsilva', 'Canada', 'joseph.dsilva@mail.mcgill.ca', '2020-02-21', '123456789');


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

-- ALL USERS
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("89","Kyra Jones","Kyr13","Spain","Kyra.Jones@yahoo.com","1952-12-1","2328808800567303")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("13","Maanav Patel","Maa92","United States","Maanav.Patel@mail.mcgill.ca","1974-7-14","2470093123159934")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("334","Magnus Kourilsky","Mag138","France","Magnus.Kourilsky@yahoo.com","1950-1-11","3273203385345094")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("329","Karim D'Angelo","Kar66","Vietnam","Karim.D'Angelo@mail.mcgill.ca","2007-11-7","3547699022702569")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("246","Maanav Kourilsky","Maa314","Canada","Maanav.Kourilsky@mail.mcgill.ca","1955-5-12","2845486120193568")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("27","Theo Jones","The234","Mexico","Theo.Jones@gmail.com","1979-8-28","1731032369689531")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("216","Misgana Kourilsky","Mis218","Vietnam","Misgana.Kourilsky@yahoo.com","1979-6-7","6422229457099527")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("315","Thomas Wang","Tho347","Russia","Thomas.Wang@yahoo.com","1953-1-16","1499391467106519")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("145","Janna Garcia","Jan150","France","Janna.Garcia@yahoo.com","1966-1-22","7150160416583639")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("270","Janna D'Angelo","Jan74","England","Janna.D'Angelo@gmail.com","1962-4-12","1389913018705471")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("113","Bahar Markoski","Bah359","Russia","Bahar.Markoski@mail.mcgill.ca","1969-8-7","6188448195944191")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("238","Maanav Leone","Maa115","Italy","Maanav.Leone@gmail.com","1996-5-12","5060063503082877")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("387","Olive Meijer","Oli389","United States","Olive.Meijer@mail.mcgill.ca","2004-12-4","3462027822191274")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("236","Louise Castelli","Lou324","Egypt","Louise.Castelli@mail.mcgill.ca","1959-3-10","6234083140629862")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("146","Tara D'Angelo","Tar397","Russia","Tara.D'Angelo@yahoo.com","1953-9-12","7805601181627445")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("358","Louise Castelli","Lou121","Vietnam","Louise.Castelli@yahoo.com","2001-4-21","6315522049068071")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("124","Louise Williams","Lou160","England","Louise.Williams@mail.mcgill.ca","1960-8-1","6339408986096556")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("353","Zhang Wang","Zha54","Italy","Zhang.Wang@gmail.com","1997-11-17","6755780670346236")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("143","Janna Porta","Jan327","Russia","Janna.Porta@gmail.com","1957-11-24","5200106280638456")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("335","Kian Porta","Kia276","Vietnam","Kian.Porta@gmail.com","1953-5-22","5666997480833249")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("144","Misgana Markoski","Mis136","United States","Misgana.Markoski@gmail.com","1980-5-9","6028896251428763")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("173","Magnus Nguyen","Mag72","China","Magnus.Nguyen@yahoo.com","1974-2-16","6853719897843165")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("163","Kyra Kourilsky","Kyr262","France","Kyra.Kourilsky@gmail.com","1956-1-10","6199868642537205")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("171","Soraya Wilson","Sor168","Spain","Soraya.Wilson@mail.mcgill.ca","1996-12-21","5488830375298402")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("354","Louise Nguyen","Lou257","Russia","Louise.Nguyen@yahoo.com","2007-4-16","4510059160015110")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("200","Elio Jones","Eli240","Bolivia","Elio.Jones@gmail.com","1980-7-29","2325557487061996")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("231","Louise Jones","Lou25","United States","Louise.Jones@mail.mcgill.ca","1975-6-14","1822633483449596")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("281","Magnus Wilson","Mag223","Spain","Magnus.Wilson@gmail.com","1969-5-3","2649598658507278")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("359","Misgana Nguyen","Mis293","Italy","Misgana.Nguyen@mail.mcgill.ca","1996-12-27","4799636922717301")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("118","Karim Markoski","Kar106","Spain","Karim.Markoski@gmail.com","1957-3-27","6986155648235243")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("177","Misgana Wilson","Mis106","Mexico","Misgana.Wilson@yahoo.com","1990-8-11","8750506028462166")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("373","Bahar Jones","Bah232","Bolivia","Bahar.Jones@yahoo.com","1965-8-11","7767244306739816")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("71","Magnus Castelli","Mag385","Bolivia","Magnus.Castelli@yahoo.com","1965-12-24","8347838507505966")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("107","Theo D'Angelo","The282","France","Theo.D'Angelo@yahoo.com","2000-2-26","4196985192479938")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("69","Zhang Wang","Zha275","Egypt","Zhang.Wang@yahoo.com","2004-7-3","6834084394785516")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("395","Olive Leone","Oli278","Egypt","Olive.Leone@gmail.com","1972-6-7","6611404626355424")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("38","Kian Kourilsky","Kia160","China","Kian.Kourilsky@gmail.com","1959-12-29","1469727676301602")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("323","Tara Rodriguez","Tar98","Canada","Tara.Rodriguez@yahoo.com","1988-7-9","5399897580995085")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("368","Elio Jones","Eli68","China","Elio.Jones@mail.mcgill.ca","1997-11-19","5080819722721689")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("12","Misgana Rodriguez","Mis96","England","Misgana.Rodriguez@mail.mcgill.ca","1994-7-19","9924538894253373")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("164","Tara Markoski","Tar227","Russia","Tara.Markoski@yahoo.com","1989-8-28","1332488877654164")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("365","Theo Wilson","The376","Bolivia","Theo.Wilson@mail.mcgill.ca","1962-6-4","8650599064315371")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("179","Magnus D'Angelo","Mag130","Egypt","Magnus.D'Angelo@mail.mcgill.ca","1993-1-10","6219889675801038")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("320","Sam Kourilsky","Sam93","China","Sam.Kourilsky@mail.mcgill.ca","2001-1-29","6632499416486242")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("253","Janna Jones","Jan280","United States","Janna.Jones@gmail.com","2000-7-7","4924184892532238")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("34","Sam Nguyen","Sam113","United States","Sam.Nguyen@yahoo.com","2004-1-18","7323954989320699")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("108","Karim Porta","Kar99","Egypt","Karim.Porta@gmail.com","1984-10-14","2696361581140884")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("310","Olive Wilson","Oli140","Mexico","Olive.Wilson@gmail.com","1974-12-10","6239294986317183")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("168","Misgana Porta","Mis298","Vietnam","Misgana.Porta@gmail.com","2007-7-2","6971961882697821")
INSERT INTO users(uid,name,username,country,email,dob,credit_info) values ("185","Max Williams","Max186","Italy","Max.Williams@gmail.com","1977-11-16","3413259233798313")


-- ALL ARTISTS
INSERT INTO artists(uid,stage_name,balance) values ("89","Zaryah","0")
INSERT INTO artists(uid,stage_name,balance) values ("13","Emma Della","0")
INSERT INTO artists(uid,stage_name,balance) values ("334","NMN","0")
INSERT INTO artists(uid,stage_name,balance) values ("329","Lil Diggity","0")
INSERT INTO artists(uid,stage_name,balance) values ("246","Alec Wood","0")
INSERT INTO artists(uid,stage_name,balance) values ("27","Justin B","0")
INSERT INTO artists(uid,stage_name,balance) values ("216","Dutch Dabber","0")
INSERT INTO artists(uid,stage_name,balance) values ("315","Aya Nova","0")
INSERT INTO artists(uid,stage_name,balance) values ("145","Purpleplum","0")
INSERT INTO artists(uid,stage_name,balance) values ("270","Francois Delacour","0")
INSERT INTO artists(uid,stage_name,balance) values ("113","How About Now","0")
INSERT INTO artists(uid,stage_name,balance) values ("238","Isiah Deville","0")
INSERT INTO artists(uid,stage_name,balance) values ("387","LEIMA","0")
INSERT INTO artists(uid,stage_name,balance) values ("236","The Lilies","0")
INSERT INTO artists(uid,stage_name,balance) values ("146","KM Kid","0")
INSERT INTO artists(uid,stage_name,balance) values ("358","The Fireman","0")
INSERT INTO artists(uid,stage_name,balance) values ("124","Michael James","0")
INSERT INTO artists(uid,stage_name,balance) values ("353","Chitty Bang","0")
INSERT INTO artists(uid,stage_name,balance) values ("143","Lara O'Mara","0")
INSERT INTO artists(uid,stage_name,balance) values ("335","JP Edwards","0")
INSERT INTO artists(uid,stage_name,balance) values ("144","Alexandre Millet","0")
INSERT INTO artists(uid,stage_name,balance) values ("173","The Sunny Boys","0")
INSERT INTO artists(uid,stage_name,balance) values ("163","22 Seconds to Boston","0")
INSERT INTO artists(uid,stage_name,balance) values ("171","The Wheelies","0")
INSERT INTO artists(uid,stage_name,balance) values ("354","No Box","0")
INSERT INTO artists(uid,stage_name,balance) values ("200","The Kicking Eyes","0")
INSERT INTO artists(uid,stage_name,balance) values ("231","John Williams","0")
INSERT INTO artists(uid,stage_name,balance) values ("281","Ayden Page","0")
INSERT INTO artists(uid,stage_name,balance) values ("359","Kicking Dolls","0")
INSERT INTO artists(uid,stage_name,balance) values ("118","Alice In The Rain","0")
INSERT INTO artists(uid,stage_name,balance) values ("177","Greg McMiller","0")
INSERT INTO artists(uid,stage_name,balance) values ("373","David Olsen","0")
INSERT INTO artists(uid,stage_name,balance) values ("71","Zephiro","0")



INSERT INTO albums(article_id,type) values ("62","LP")
INSERT INTO albums(article_id,type) values ("278","Compilation")
INSERT INTO albums(article_id,type) values ("253","Single")
INSERT INTO albums(article_id,type) values ("357","LP")
INSERT INTO albums(article_id,type) values ("71","Single")
INSERT INTO albums(article_id,type) values ("351","LP")
INSERT INTO albums(article_id,type) values ("202","Single")
INSERT INTO albums(article_id,type) values ("417","DJ Mix")
INSERT INTO albums(article_id,type) values ("74","DJ Mix")
INSERT INTO albums(article_id,type) values ("327","LP")
INSERT INTO albums(article_id,type) values ("204","EP")
INSERT INTO albums(article_id,type) values ("248","DJ Mix")
INSERT INTO albums(article_id,type) values ("112","DJ Mix")
INSERT INTO albums(article_id,type) values ("193","DJ Mix")
INSERT INTO albums(article_id,type) values ("247","EP")
INSERT INTO albums(article_id,type) values ("24","LP")
INSERT INTO albums(article_id,type) values ("166","LP")
INSERT INTO albums(article_id,type) values ("391","Single")
INSERT INTO albums(article_id,type) values ("458","LP")
INSERT INTO albums(article_id,type) values ("189","LP")
INSERT INTO albums(article_id,type) values ("375","Single")
INSERT INTO albums(article_id,type) values ("483","Single")
INSERT INTO albums(article_id,type) values ("117","EP")
INSERT INTO albums(article_id,type) values ("72","LP")
INSERT INTO albums(article_id,type) values ("160","LP")
INSERT INTO albums(article_id,type) values ("254","Single")
INSERT INTO albums(article_id,type) values ("5","Single")
INSERT INTO albums(article_id,type) values ("142","EP")
INSERT INTO albums(article_id,type) values ("424","Mixtape")
INSERT INTO albums(article_id,type) values ("20","EP")
INSERT INTO albums(article_id,type) values ("171","EP")
INSERT INTO albums(article_id,type) values ("348","LP")
INSERT INTO albums(article_id,type) values ("149","LP")
INSERT INTO albums(article_id,type) values ("274","EP")
INSERT INTO albums(article_id,type) values ("66","Single")
INSERT INTO albums(article_id,type) values ("76","LP")
INSERT INTO albums(article_id,type) values ("177","Single")
INSERT INTO albums(article_id,type) values ("73","LP")
INSERT INTO albums(article_id,type) values ("90","LP")
INSERT INTO albums(article_id,type) values ("3","Single")
INSERT INTO albums(article_id,type) values ("205","Single")
INSERT INTO albums(article_id,type) values ("116","Single")
INSERT INTO albums(article_id,type) values ("37","Single")
INSERT INTO albums(article_id,type) values ("345","Single")
INSERT INTO albums(article_id,type) values ("406","Single")
INSERT INTO albums(article_id,type) values ("242","Single")
INSERT INTO albums(article_id,type) values ("316","Single")
INSERT INTO albums(article_id,type) values ("337","Single")
INSERT INTO albums(article_id,type) values ("226","Single")
INSERT INTO albums(article_id,type) values ("197","EP")
INSERT INTO albums(article_id,type) values ("97","LP")
INSERT INTO albums(article_id,type) values ("128","DJ Mix")
INSERT INTO albums(article_id,type) values ("251","DJ Mix")
INSERT INTO albums(article_id,type) values ("96","DJ Mix")
INSERT INTO albums(article_id,type) values ("106","Single")
INSERT INTO albums(article_id,type) values ("250","Single")
INSERT INTO albums(article_id,type) values ("188","EP")



INSERT INTO songs(article_id,duration) values ("25","3:23")
INSERT INTO songs(article_id,duration) values ("68","3:25")
INSERT INTO songs(article_id,duration) values ("252","5:42")
INSERT INTO songs(article_id,duration) values ("21","3:42")
INSERT INTO songs(article_id,duration) values ("0","3:29")
INSERT INTO songs(article_id,duration) values ("125","1:24")
INSERT INTO songs(article_id,duration) values ("446","0:38")
INSERT INTO songs(article_id,duration) values ("87","0:18")
INSERT INTO songs(article_id,duration) values ("364","4:14")
INSERT INTO songs(article_id,duration) values ("451","4:34")
INSERT INTO songs(article_id,duration) values ("464","4:28")
INSERT INTO songs(article_id,duration) values ("262","1:48")
INSERT INTO songs(article_id,duration) values ("392","4:57")
INSERT INTO songs(article_id,duration) values ("86","3:32")
INSERT INTO songs(article_id,duration) values ("360","0:34")
INSERT INTO songs(article_id,duration) values ("441","5:40")
INSERT INTO songs(article_id,duration) values ("179","4:57")
INSERT INTO songs(article_id,duration) values ("198","3:54")
INSERT INTO songs(article_id,duration) values ("409","4:57")
INSERT INTO songs(article_id,duration) values ("219","3:28")
INSERT INTO songs(article_id,duration) values ("400","0:35")
INSERT INTO songs(article_id,duration) values ("319","3:57")
INSERT INTO songs(article_id,duration) values ("416","2:26")
INSERT INTO songs(article_id,duration) values ("212","3:48")
INSERT INTO songs(article_id,duration) values ("264","3:33")
INSERT INTO songs(article_id,duration) values ("286","4:19")
INSERT INTO songs(article_id,duration) values ("339","5:57")
INSERT INTO songs(article_id,duration) values ("246","0:28")
INSERT INTO songs(article_id,duration) values ("497","2:12")
INSERT INTO songs(article_id,duration) values ("147","5:13")
INSERT INTO songs(article_id,duration) values ("114","5:48")
INSERT INTO songs(article_id,duration) values ("180","0:32")
INSERT INTO songs(article_id,duration) values ("70","2:33")
INSERT INTO songs(article_id,duration) values ("363","2:34")
INSERT INTO songs(article_id,duration) values ("420","3:44")
INSERT INTO songs(article_id,duration) values ("11","1:52")
INSERT INTO songs(article_id,duration) values ("482","4:50")
INSERT INTO songs(article_id,duration) values ("299","4:45")
INSERT INTO songs(article_id,duration) values ("88","1:16")
INSERT INTO songs(article_id,duration) values ("60","1:52")
INSERT INTO songs(article_id,duration) values ("431","0:29")
INSERT INTO songs(article_id,duration) values ("7","0:57")
INSERT INTO songs(article_id,duration) values ("229","2:54")
INSERT INTO songs(article_id,duration) values ("289","3:46")
INSERT INTO songs(article_id,duration) values ("217","5:35")
INSERT INTO songs(article_id,duration) values ("129","3:16")
INSERT INTO songs(article_id,duration) values ("390","3:33")
INSERT INTO songs(article_id,duration) values ("330","4:36")
INSERT INTO songs(article_id,duration) values ("132","1:38")
INSERT INTO songs(article_id,duration) values ("383","3:26")
INSERT INTO songs(article_id,duration) values ("194","5:40")
INSERT INTO songs(article_id,duration) values ("99","5:44")
INSERT INTO songs(article_id,duration) values ("159","1:24")
INSERT INTO songs(article_id,duration) values ("61","4:55")
INSERT INTO songs(article_id,duration) values ("470","0:13")
INSERT INTO songs(article_id,duration) values ("94","1:53")
INSERT INTO songs(article_id,duration) values ("472","3:21")
INSERT INTO songs(article_id,duration) values ("181","0:40")
INSERT INTO songs(article_id,duration) values ("174","3:50")
INSERT INTO songs(article_id,duration) values ("295","4:33")
INSERT INTO songs(article_id,duration) values ("317","4:32")
INSERT INTO songs(article_id,duration) values ("150","4:27")
INSERT INTO songs(article_id,duration) values ("361","1:12")
INSERT INTO songs(article_id,duration) values ("436","4:24")
INSERT INTO songs(article_id,duration) values ("398","1:13")
INSERT INTO songs(article_id,duration) values ("263","2:19")
INSERT INTO songs(article_id,duration) values ("196","2:58")
INSERT INTO songs(article_id,duration) values ("32","4:22")
INSERT INTO songs(article_id,duration) values ("168","1:55")
INSERT INTO songs(article_id,duration) values ("325","3:24")
INSERT INTO songs(article_id,duration) values ("300","1:33")
INSERT INTO songs(article_id,duration) values ("2","2:14")
INSERT INTO songs(article_id,duration) values ("341","4:46")
INSERT INTO songs(article_id,duration) values ("69","1:16")
INSERT INTO songs(article_id,duration) values ("31","3:43")
INSERT INTO songs(article_id,duration) values ("82","1:41")
INSERT INTO songs(article_id,duration) values ("75","5:21")
INSERT INTO songs(article_id,duration) values ("14","2:56")
INSERT INTO songs(article_id,duration) values ("119","1:39")
INSERT INTO songs(article_id,duration) values ("369","3:34")
INSERT INTO songs(article_id,duration) values ("439","5:55")
INSERT INTO songs(article_id,duration) values ("350","5:36")
INSERT INTO songs(article_id,duration) values ("310","4:33")
INSERT INTO songs(article_id,duration) values ("450","3:59")
INSERT INTO songs(article_id,duration) values ("187","5:15")
INSERT INTO songs(article_id,duration) values ("115","5:40")
INSERT INTO songs(article_id,duration) values ("474","5:44")
INSERT INTO songs(article_id,duration) values ("257","0:22")
INSERT INTO songs(article_id,duration) values ("261","3:35")
INSERT INTO songs(article_id,duration) values ("481","1:25")
INSERT INTO songs(article_id,duration) values ("93","2:28")
INSERT INTO songs(article_id,duration) values ("373","0:55")
INSERT INTO songs(article_id,duration) values ("475","4:13")
INSERT INTO songs(article_id,duration) values ("33","4:44")
INSERT INTO songs(article_id,duration) values ("167","1:42")
INSERT INTO songs(article_id,duration) values ("26","4:23")
INSERT INTO songs(article_id,duration) values ("145","0:55")
INSERT INTO songs(article_id,duration) values ("240","0:51")
INSERT INTO songs(article_id,duration) values ("141","2:54")
INSERT INTO songs(article_id,duration) values ("359","0:11")
INSERT INTO songs(article_id,duration) values ("139","0:48")
INSERT INTO songs(article_id,duration) values ("215","4:22")
INSERT INTO songs(article_id,duration) values ("277","0:13")
INSERT INTO songs(article_id,duration) values ("287","0:48")
INSERT INTO songs(article_id,duration) values ("102","1:34")
INSERT INTO songs(article_id,duration) values ("58","1:41")
INSERT INTO songs(article_id,duration) values ("366","3:43")
INSERT INTO songs(article_id,duration) values ("320","2:27")
INSERT INTO songs(article_id,duration) values ("397","4:25")
INSERT INTO songs(article_id,duration) values ("457","0:52")
INSERT INTO songs(article_id,duration) values ("335","2:10")
INSERT INTO songs(article_id,duration) values ("442","3:51")
INSERT INTO songs(article_id,duration) values ("140","1:48")
INSERT INTO songs(article_id,duration) values ("36","4:14")
INSERT INTO songs(article_id,duration) values ("421","5:53")
INSERT INTO songs(article_id,duration) values ("296","2:28")
INSERT INTO songs(article_id,duration) values ("230","0:48")
INSERT INTO songs(article_id,duration) values ("311","0:29")
INSERT INTO songs(article_id,duration) values ("452","3:25")
INSERT INTO songs(article_id,duration) values ("127","4:29")
INSERT INTO songs(article_id,duration) values ("279","0:55")
INSERT INTO songs(article_id,duration) values ("255","1:44")
INSERT INTO songs(article_id,duration) values ("387","0:44")
INSERT INTO songs(article_id,duration) values ("496","3:35")
INSERT INTO songs(article_id,duration) values ("435","4:55")
INSERT INTO songs(article_id,duration) values ("123","1:23")
INSERT INTO songs(article_id,duration) values ("184","5:17")
INSERT INTO songs(article_id,duration) values ("349","2:45")
INSERT INTO songs(article_id,duration) values ("81","5:33")
INSERT INTO songs(article_id,duration) values ("413","2:28")
INSERT INTO songs(article_id,duration) values ("265","2:18")
INSERT INTO songs(article_id,duration) values ("427","4:15")
INSERT INTO songs(article_id,duration) values ("495","3:29")
INSERT INTO songs(article_id,duration) values ("355","4:27")
INSERT INTO songs(article_id,duration) values ("136","2:14")
INSERT INTO songs(article_id,duration) values ("162","5:44")
INSERT INTO songs(article_id,duration) values ("395","1:57")
INSERT INTO songs(article_id,duration) values ("284","4:27")
INSERT INTO songs(article_id,duration) values ("354","0:30")
INSERT INTO songs(article_id,duration) values ("267","1:18")
INSERT INTO songs(article_id,duration) values ("272","2:58")
INSERT INTO songs(article_id,duration) values ("336","5:20")
INSERT INTO songs(article_id,duration) values ("190","3:31")
INSERT INTO songs(article_id,duration) values ("122","5:47")
INSERT INTO songs(article_id,duration) values ("233","1:58")
INSERT INTO songs(article_id,duration) values ("221","5:46")
INSERT INTO songs(article_id,duration) values ("303","3:59")
INSERT INTO songs(article_id,duration) values ("222","1:57")
INSERT INTO songs(article_id,duration) values ("433","3:50")

-- Releases
INSERT INTO Releases(artist_id,article_id) values ("89","25")
INSERT INTO Releases(artist_id,article_id) values ("89","68")
INSERT INTO Releases(artist_id,article_id) values ("89","252")
INSERT INTO Releases(artist_id,article_id) values ("89","21")
INSERT INTO Releases(artist_id,article_id) values ("89","0")
INSERT INTO Releases(artist_id,article_id) values ("89","62")
INSERT INTO Releases(artist_id,article_id) values ("13","125")
INSERT INTO Releases(artist_id,article_id) values ("13","446")
INSERT INTO Releases(artist_id,article_id) values ("13","87")
INSERT INTO Releases(artist_id,article_id) values ("13","278")
INSERT INTO Releases(artist_id,article_id) values ("334","364")
INSERT INTO Releases(artist_id,article_id) values ("334","253")
INSERT INTO Releases(artist_id,article_id) values ("329","451")
INSERT INTO Releases(artist_id,article_id) values ("329","464")
INSERT INTO Releases(artist_id,article_id) values ("329","262")
INSERT INTO Releases(artist_id,article_id) values ("329","357")
INSERT INTO Releases(artist_id,article_id) values ("329","392")
INSERT INTO Releases(artist_id,article_id) values ("329","71")
INSERT INTO Releases(artist_id,article_id) values ("246","86")
INSERT INTO Releases(artist_id,article_id) values ("246","360")
INSERT INTO Releases(artist_id,article_id) values ("246","441")
INSERT INTO Releases(artist_id,article_id) values ("246","179")
INSERT INTO Releases(artist_id,article_id) values ("246","351")
INSERT INTO Releases(artist_id,article_id) values ("27","198")
INSERT INTO Releases(artist_id,article_id) values ("27","202")
INSERT INTO Releases(artist_id,article_id) values ("216","409")
INSERT INTO Releases(artist_id,article_id) values ("216","417")
INSERT INTO Releases(artist_id,article_id) values ("216","219")
INSERT INTO Releases(artist_id,article_id) values ("216","74")
INSERT INTO Releases(artist_id,article_id) values ("315","400")
INSERT INTO Releases(artist_id,article_id) values ("315","319")
INSERT INTO Releases(artist_id,article_id) values ("315","416")
INSERT INTO Releases(artist_id,article_id) values ("315","212")
INSERT INTO Releases(artist_id,article_id) values ("315","327")
INSERT INTO Releases(artist_id,article_id) values ("315","264")
INSERT INTO Releases(artist_id,article_id) values ("315","286")
INSERT INTO Releases(artist_id,article_id) values ("315","339")
INSERT INTO Releases(artist_id,article_id) values ("315","204")
INSERT INTO Releases(artist_id,article_id) values ("145","246")
INSERT INTO Releases(artist_id,article_id) values ("145","248")
INSERT INTO Releases(artist_id,article_id) values ("145","497")
INSERT INTO Releases(artist_id,article_id) values ("145","112")
INSERT INTO Releases(artist_id,article_id) values ("145","147")
INSERT INTO Releases(artist_id,article_id) values ("145","193")
INSERT INTO Releases(artist_id,article_id) values ("270","114")
INSERT INTO Releases(artist_id,article_id) values ("270","180")
INSERT INTO Releases(artist_id,article_id) values ("270","247")
INSERT INTO Releases(artist_id,article_id) values ("113","70")
INSERT INTO Releases(artist_id,article_id) values ("113","363")
INSERT INTO Releases(artist_id,article_id) values ("113","420")
INSERT INTO Releases(artist_id,article_id) values ("113","11")
INSERT INTO Releases(artist_id,article_id) values ("113","482")
INSERT INTO Releases(artist_id,article_id) values ("113","299")
INSERT INTO Releases(artist_id,article_id) values ("113","24")
INSERT INTO Releases(artist_id,article_id) values ("113","88")
INSERT INTO Releases(artist_id,article_id) values ("113","60")
INSERT INTO Releases(artist_id,article_id) values ("113","431")
INSERT INTO Releases(artist_id,article_id) values ("113","7")
INSERT INTO Releases(artist_id,article_id) values ("113","229")
INSERT INTO Releases(artist_id,article_id) values ("113","289")
INSERT INTO Releases(artist_id,article_id) values ("113","217")
INSERT INTO Releases(artist_id,article_id) values ("113","166")
INSERT INTO Releases(artist_id,article_id) values ("238","129")
INSERT INTO Releases(artist_id,article_id) values ("238","391")
INSERT INTO Releases(artist_id,article_id) values ("238","390")
INSERT INTO Releases(artist_id,article_id) values ("238","330")
INSERT INTO Releases(artist_id,article_id) values ("238","132")
INSERT INTO Releases(artist_id,article_id) values ("238","383")
INSERT INTO Releases(artist_id,article_id) values ("238","194")
INSERT INTO Releases(artist_id,article_id) values ("238","458")
INSERT INTO Releases(artist_id,article_id) values ("387","99")
INSERT INTO Releases(artist_id,article_id) values ("387","159")
INSERT INTO Releases(artist_id,article_id) values ("387","61")
INSERT INTO Releases(artist_id,article_id) values ("387","470")
INSERT INTO Releases(artist_id,article_id) values ("387","94")
INSERT INTO Releases(artist_id,article_id) values ("387","472")
INSERT INTO Releases(artist_id,article_id) values ("387","189")
INSERT INTO Releases(artist_id,article_id) values ("236","181")
INSERT INTO Releases(artist_id,article_id) values ("236","375")
INSERT INTO Releases(artist_id,article_id) values ("236","174")
INSERT INTO Releases(artist_id,article_id) values ("236","483")
INSERT INTO Releases(artist_id,article_id) values ("236","295")
INSERT INTO Releases(artist_id,article_id) values ("236","317")
INSERT INTO Releases(artist_id,article_id) values ("236","117")
INSERT INTO Releases(artist_id,article_id) values ("146","150")
INSERT INTO Releases(artist_id,article_id) values ("146","361")
INSERT INTO Releases(artist_id,article_id) values ("146","436")
INSERT INTO Releases(artist_id,article_id) values ("146","398")
INSERT INTO Releases(artist_id,article_id) values ("146","263")
INSERT INTO Releases(artist_id,article_id) values ("146","72")
INSERT INTO Releases(artist_id,article_id) values ("358","196")
INSERT INTO Releases(artist_id,article_id) values ("358","32")
INSERT INTO Releases(artist_id,article_id) values ("358","168")
INSERT INTO Releases(artist_id,article_id) values ("358","325")
INSERT INTO Releases(artist_id,article_id) values ("358","300")
INSERT INTO Releases(artist_id,article_id) values ("358","160")
INSERT INTO Releases(artist_id,article_id) values ("358","2")
INSERT INTO Releases(artist_id,article_id) values ("358","254")
INSERT INTO Releases(artist_id,article_id) values ("358","341")
INSERT INTO Releases(artist_id,article_id) values ("358","5")
INSERT INTO Releases(artist_id,article_id) values ("124","69")
INSERT INTO Releases(artist_id,article_id) values ("124","31")
INSERT INTO Releases(artist_id,article_id) values ("124","82")
INSERT INTO Releases(artist_id,article_id) values ("124","75")
INSERT INTO Releases(artist_id,article_id) values ("124","142")
INSERT INTO Releases(artist_id,article_id) values ("353","14")
INSERT INTO Releases(artist_id,article_id) values ("353","119")
INSERT INTO Releases(artist_id,article_id) values ("353","369")
INSERT INTO Releases(artist_id,article_id) values ("353","439")
INSERT INTO Releases(artist_id,article_id) values ("353","424")
INSERT INTO Releases(artist_id,article_id) values ("353","350")
INSERT INTO Releases(artist_id,article_id) values ("353","310")
INSERT INTO Releases(artist_id,article_id) values ("353","20")
INSERT INTO Releases(artist_id,article_id) values ("143","450")
INSERT INTO Releases(artist_id,article_id) values ("143","187")
INSERT INTO Releases(artist_id,article_id) values ("143","115")
INSERT INTO Releases(artist_id,article_id) values ("143","474")
INSERT INTO Releases(artist_id,article_id) values ("143","257")
INSERT INTO Releases(artist_id,article_id) values ("143","171")
INSERT INTO Releases(artist_id,article_id) values ("335","261")
INSERT INTO Releases(artist_id,article_id) values ("335","481")
INSERT INTO Releases(artist_id,article_id) values ("335","93")
INSERT INTO Releases(artist_id,article_id) values ("335","373")
INSERT INTO Releases(artist_id,article_id) values ("335","475")
INSERT INTO Releases(artist_id,article_id) values ("335","348")
INSERT INTO Releases(artist_id,article_id) values ("144","33")
INSERT INTO Releases(artist_id,article_id) values ("144","167")
INSERT INTO Releases(artist_id,article_id) values ("144","26")
INSERT INTO Releases(artist_id,article_id) values ("144","145")
INSERT INTO Releases(artist_id,article_id) values ("144","149")
INSERT INTO Releases(artist_id,article_id) values ("173","240")
INSERT INTO Releases(artist_id,article_id) values ("173","141")
INSERT INTO Releases(artist_id,article_id) values ("173","359")
INSERT INTO Releases(artist_id,article_id) values ("173","139")
INSERT INTO Releases(artist_id,article_id) values ("173","274")
INSERT INTO Releases(artist_id,article_id) values ("173","215")
INSERT INTO Releases(artist_id,article_id) values ("173","66")
INSERT INTO Releases(artist_id,article_id) values ("163","277")
INSERT INTO Releases(artist_id,article_id) values ("163","287")
INSERT INTO Releases(artist_id,article_id) values ("163","102")
INSERT INTO Releases(artist_id,article_id) values ("163","58")
INSERT INTO Releases(artist_id,article_id) values ("163","366")
INSERT INTO Releases(artist_id,article_id) values ("163","76")
INSERT INTO Releases(artist_id,article_id) values ("163","320")
INSERT INTO Releases(artist_id,article_id) values ("163","177")
INSERT INTO Releases(artist_id,article_id) values ("171","397")
INSERT INTO Releases(artist_id,article_id) values ("171","457")
INSERT INTO Releases(artist_id,article_id) values ("171","335")
INSERT INTO Releases(artist_id,article_id) values ("171","442")
INSERT INTO Releases(artist_id,article_id) values ("171","140")
INSERT INTO Releases(artist_id,article_id) values ("171","36")
INSERT INTO Releases(artist_id,article_id) values ("171","73")
INSERT INTO Releases(artist_id,article_id) values ("354","421")
INSERT INTO Releases(artist_id,article_id) values ("354","296")
INSERT INTO Releases(artist_id,article_id) values ("354","230")
INSERT INTO Releases(artist_id,article_id) values ("354","311")
INSERT INTO Releases(artist_id,article_id) values ("354","452")
INSERT INTO Releases(artist_id,article_id) values ("354","90")
INSERT INTO Releases(artist_id,article_id) values ("200","127")
INSERT INTO Releases(artist_id,article_id) values ("200","3")
INSERT INTO Releases(artist_id,article_id) values ("200","279")
INSERT INTO Releases(artist_id,article_id) values ("200","205")
INSERT INTO Releases(artist_id,article_id) values ("200","255")
INSERT INTO Releases(artist_id,article_id) values ("200","116")
INSERT INTO Releases(artist_id,article_id) values ("231","387")
INSERT INTO Releases(artist_id,article_id) values ("231","37")
INSERT INTO Releases(artist_id,article_id) values ("231","496")
INSERT INTO Releases(artist_id,article_id) values ("231","345")
INSERT INTO Releases(artist_id,article_id) values ("281","435")
INSERT INTO Releases(artist_id,article_id) values ("281","406")
INSERT INTO Releases(artist_id,article_id) values ("281","123")
INSERT INTO Releases(artist_id,article_id) values ("281","242")
INSERT INTO Releases(artist_id,article_id) values ("281","184")
INSERT INTO Releases(artist_id,article_id) values ("281","316")
INSERT INTO Releases(artist_id,article_id) values ("281","349")
INSERT INTO Releases(artist_id,article_id) values ("281","337")
INSERT INTO Releases(artist_id,article_id) values ("359","81")
INSERT INTO Releases(artist_id,article_id) values ("359","413")
INSERT INTO Releases(artist_id,article_id) values ("359","265")
INSERT INTO Releases(artist_id,article_id) values ("359","427")
INSERT INTO Releases(artist_id,article_id) values ("359","495")
INSERT INTO Releases(artist_id,article_id) values ("359","226")
INSERT INTO Releases(artist_id,article_id) values ("118","355")
INSERT INTO Releases(artist_id,article_id) values ("118","136")
INSERT INTO Releases(artist_id,article_id) values ("118","162")
INSERT INTO Releases(artist_id,article_id) values ("118","197")
INSERT INTO Releases(artist_id,article_id) values ("177","395")
INSERT INTO Releases(artist_id,article_id) values ("177","284")
INSERT INTO Releases(artist_id,article_id) values ("177","354")
INSERT INTO Releases(artist_id,article_id) values ("177","267")
INSERT INTO Releases(artist_id,article_id) values ("177","272")
INSERT INTO Releases(artist_id,article_id) values ("177","97")
INSERT INTO Releases(artist_id,article_id) values ("373","336")
INSERT INTO Releases(artist_id,article_id) values ("373","128")
INSERT INTO Releases(artist_id,article_id) values ("373","190")
INSERT INTO Releases(artist_id,article_id) values ("373","251")
INSERT INTO Releases(artist_id,article_id) values ("373","122")
INSERT INTO Releases(artist_id,article_id) values ("373","96")
INSERT INTO Releases(artist_id,article_id) values ("71","233")
INSERT INTO Releases(artist_id,article_id) values ("71","106")
INSERT INTO Releases(artist_id,article_id) values ("71","221")
INSERT INTO Releases(artist_id,article_id) values ("71","250")
INSERT INTO Releases(artist_id,article_id) values ("71","303")
INSERT INTO Releases(artist_id,article_id) values ("71","222")
INSERT INTO Releases(artist_id,article_id) values ("71","433")
INSERT INTO Releases(artist_id,article_id) values ("71","188")