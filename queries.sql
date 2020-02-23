/* Display the content of an Album*/
SELECT S.title, S.release_date, S.genre, S.price
FROM songs S
WHERE S.article_id IN (SELECT B.song_id
				FROM BelongsTo B, albums A
				WHERE A.article_id = B.album_id )

/* Search all the Artist releases*/
SELECT title, release_date, genre, price
FROM articles
WHERE article_id IN (SELECT R.song_id
				FROM Releases R, artist A
				WHERE A.user_id = R.artist_id)

/* Get all the Articles that the Listener selected in his shopping cart*/
SELECT DISTINCT Article.id
FROM articles
WHERE article_id IN (SELECT C.articleID
				FROM Contains C, shopping_carts S
				WHERE S.order_id = C.order_id)

/* Display all the songs from a specific artist in the Listener's Library*/
SELECT S.title
FROM songs S
WHERE S.articleID IN (SELECT R.songID
				FROM Releases R, Artist A
				WHERE A.userID = R.artistID)
INTERSECT
SELECT S.title
FROM songs S
WHERE S.article_id IN (SELECT A.article_id
				FROM libraries L, IsAddedTo A
				WHERE A.libid = L.libid)

/*Display the Listener's order history*/
SELECT Uses.order_id
FROM Uses, listeners
WHERE Uses.listener_Iid = listeners.uid