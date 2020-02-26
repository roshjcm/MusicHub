--Display the content of an Album--
SELECT *
FROM songs, BelongsTo
WHERE songs.article_id = BelongsTo.song_id AND BelongsTo.album_id = "album_id_of_interest";


--Search all the releases of specific artist--
SELECT title
FROM articles
WHERE article_id IN (SELECT song_id
				FROM Releases
				WHERE artist_id = "artist_id_of_interest");

--Get all the Articles that the Listener selected in his shopping cart--
SELECT DISTINCT Article.id
FROM articles
WHERE article_id IN (SELECT C.articleID
				FROM Contains C
				WHERE S.order_id = C.order_id);

--Display all the songs from a specific artist in the Listener's Library--
SELECT S.title
FROM songs S, releases R
WHERE S.article_id = R.song_id AND R.artist_id = "artist_id_of_interest"
INTERSECT
SELECT S.title
FROM songs S, isAddedTo A
WHERE S.article_id = A.article_id AND A.libid = "lib_id_of_interest";

--Display the Listener's order history--
SELECT Uses.order_id
FROM Uses,
WHERE Uses.listener_id = "listener_id_of_interest";

-- find the  artist who made more than 20 releases in january--

CREATE VIEW [january selection] AS
SELECT A.article_id, R.artist_id
FROM Releases R, articles A
WHERE R.article_id = A.article_id AND 2020-01-01 <= A.release_date < 2020-02-01;

SELECT artists.stage_name
FROM artists
WHERE artists.uid EXISTS (SELECT COUNT(article_id), A.uid FROM [january selection] GROUP BY A.uid) AND COUNT(article_id)>20;

