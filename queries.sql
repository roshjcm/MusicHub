/* Display the content of an Album*/
SELECT S.title, S.release_date, S.genre, S.price
FROM Song S
WHERE S.articleID IN (SELECT B.songID
				FROM BelongsTo B, Album A
				WHERE A.articleID = B.albumID )

/* Search all the Artist releases*/
SELECT title, release_date, genre, price
FROM Article
WHERE articleID IN (SELECT R.songID
				FROM Releases R, Artist A
				WHERE A.userID = R.artistID)

/* Get all the Articles that the Listener selected in his shopping cart*/
SELECT DISTINCT Article.id
FROM Article
WHERE articleID IN (SELECT C.articleID
				FROM Contains C, ShoppingCart S
				WHERE S.orderID = C.orderID)

/* Display all the songs from a specific artist in the Listener's Library*/
SELECT S.title
FROM Song S
WHERE S.articleID IN (SELECT R.songID
				FROM Releases R, Artist A
				WHERE A.userID = R.artistID)
INTERSECT
SELECT S.title
FROM Song S
WHERE S.articleID IN (SELECT A.articleID
				FROM Library L, isAdded A
				WHERE A.libid = L.libid)

/*Display the Listener's order history*/
SELECT Uses.orderID
FROM Uses, Listener
WHERE Uses.listenerID = Listener.userID