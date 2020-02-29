


-- create view of the frequency of each genre for all articles (albums and songs) --

CREATE VIEW GenreFrequency AS
SELECT genre, COUNT(articles.genre)
FROM articles
GROUP BY genre
ORDER BY COUNT(articles.genre) DESC;


-- create view of the countries that listeners are from in descending order --

CREATE VIEW TopCountries AS
SELECT country, COUNT(users.uid)
FROM users, listeners
WHERE users.uid = listeners.uid
GROUP BY country
ORDER BY COUNT(users.uid) DESC;


-- create view of the top 10 artists so far--

CREATE VIEW Top10Artists AS
SELECT art.stage_name, COUNT(a.article_id)
FROM isAddedTo A, releases R, artists art
WHERE A.article_id = R.article_id AND art.uid = R.artist_id
GROUP BY art.stage_name
ORDER BY COUNT(a.article_id) DESC 
LIMIT 10;



