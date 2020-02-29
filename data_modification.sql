-- give a reward of 10$ to all artist that submitted more than 5 free songs--

UPDATE artists
SET balance = balance + 10
WHERE uid IN (SELECT r.artist_id
	FROM Articles a, releases r 
	WHERE a.article_id = r.article_id AND a.price = 0 
	GROUP BY r.artist_id
	HAVING COUNT(r.article_id)>5) ;

--give a 10$ discount to all orders more than 3.50$--

UPDATE shopping_carts
SET total_amount = total_amount*0.9
WHERE total_amount > 3.50;

-- Give a $3 gift to all artist younger than 25 who haven't made any revenue yet--

UPDATE artists
SET balance = 3
WHERE balance = 0 AND
	uid IN (SELECT a.uid 
		FROM users u, artists a
		WHERE u.dob> '1995-02-28' AND u.uid = a.uid);
