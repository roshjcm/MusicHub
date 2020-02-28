
--Display all the artists that realeased R&B music--
SELECT stage_name
FROM artists
WHERE EXISTS (
	SELECT DISTINCT R.artist_id
	FROM articles A, releases R
	WHERE A.article_id = R.article_id AND A.genre = 'R&B');

-- Send receipt to all listeners about their current placed orders --> select all their emails, orderid, total price for each --
SELECT l.email, u.order_id, s.total_amount
FROM Uses u, shopping_carts s, users l
WHERE u.order_id = s.order_id AND u.listener_id = l.uid;

-- List all artists in ascending order by stage name(browsing)
SELECT DISTINCT a.stage_name, m.genre
FROM artists a, releases r, articles m
WHERE r.artist_id = a.uid AND m.artist_id = r.article_id
ORDER BY a.stage_name ASC;


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








