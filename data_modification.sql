-- give a reward of 10$ to all artist that submitted more than 5 free songs--

UPDATE artists
SET balance = balance + 10
WHERE uid IN (SELECT r.artist_id
	FROM Articles a, releases r 
	WHERE a.article_id = r.article_id AND a.price = 0 
	GROUP BY r.artist_id
	HAVING COUNT(r.article_id)>5) ;

