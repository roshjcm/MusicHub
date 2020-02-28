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

--Display all the artists that realeased R&B music--
SELECT stage_name
FROM artists
WHERE EXISTS (
	SELECT DISTINCT R.artist_id
	FROM articles A, releases R
	WHERE A.article_id = R.article_id AND A.genre = 'R&B');

/*	INTERSECT
	SELECT DISTINCT R.artist_id
	FROM articles A, releases R
	WHERE A.article_id = R.article_id AND A.genre = 'Pop'
	);*/

--Display the Listener's order history--
SELECT Uses.order_id
FROM Uses
WHERE Uses.listener_id = "listener_id_of_interest";


-- Display the listeners that have spent the most money buying songs and albums --
SELECT uses.listener_id, total_amount
FROM uses, shopping_carts, listeners
WHERE shopping_carts.order_id = uses.order_id AND uses.listener_id = listeners.uid
ORDER BY total_amount DESC;



-- Display the most frequently bought articles on the platform --
SELECT articles.title, COUNT(contains.article_id) AS times_bought, SUM(price)
FROM articles, contains, shopping_carts
WHERE articles.article_id = contains.article_id AND shopping_carts.order_id = contains.order_id
GROUP BY articles.title
ORDER BY COUNT(articles.article_id) DESC;




-- Ideas for the creativity part--

-- find the artists who made more than 10 releases in january 2020--

CREATE VIEW january_selection AS
SELECT A.article_id, R.artist_id
FROM Releases R, articles A
WHERE R.article_id = A.article_id AND A.release_date BETWEEN 2020-01-01 AND 2020-02-01;

SELECT artists.stage_name
FROM artists
WHERE EXISTS (	SELECT COUNT(article_id), A.uid 
				FROM january_selection
				GROUP BY A.uid 
				HAVING COUNT(article_id) >10); 

DROP VIEW IF EXISTS january_selection;








