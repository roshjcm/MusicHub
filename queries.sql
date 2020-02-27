--Display the content of an Album--
SELECT articles.title, articles.genre, articles.duration
FROM articles, BelongsTo
WHERE articles.article_id = BelongsTo.song_id AND BelongsTo.album_id = "album_id_of_interest";

--Search all the releases of specific artist--
SELECT title
FROM articles
WHERE article_id IN (SELECT song_id
				FROM Releases
				WHERE artist_id = "artist_id_of_interest");

--Get all the Articles that the Listener selected in his shopping cart--
SELECT DISTINCT title, price
FROM articles
WHERE EXISTS (SELECT article_id
				FROM Contains
				WHERE order_id = "shopping_cart_id_of_interest");

--get the total number of songs bought for each artist in a specific order --
SELECT r.artist_id, COUNT(a.article_id)
FROM articles a, Releases r
WHERE a.article_id = r.article_id
	AND a.article_id = ANY (SELECT article_id FROM Contains WHERE order_id = "orderid_of_interest")
GROUP BY artist_id;

--Display all the artists that realeased Rap musics and Pop musics--
SELECT stage_name
FROM artists
WHERE EXISTS (
	SELECT DISTINCT R.artist_id
	FROM artticles A, releases R
	WHERE A.article_id = R.song_id AND R.genre = "Rap"
	INTERSECT
	SELECT DISTINCT R.artist_id
	ROM articles A, releases R
	WHERE A.article_id = R.song_id AND R.genre = "Pop";
	)

--Display the Listener's order history--
SELECT Uses.order_id
FROM Uses
WHERE Uses.listener_id = "listener_id_of_interest";

-- Ideas for the creativity part--

-- find the artists who made more than 10 releases in january 2020--

CREATE VIEW january_selection AS
SELECT A.article_id, R.artist_id
FROM Releases R, articles A
WHERE R.article_id = A.article_id AND 2020-01-01 <= A.release_date < 2020-02-01;

SELECT artists.stage_name
FROM artists
WHERE EXISTS (	SELECT COUNT(article_id), A.uid 
				FROM january_selection
				GROUP BY A.uid 
				HAVING COUNT(article_id) >10); 

DROP VIEW IF EXISTS january_selection;


