


/* songs that are also albums (singles) */


CREATE VIEW singles ()AS
SELECT * 
FROM albums article
WHERE albums.type='single';

-- create view of the top 10 artists so far--

CREATE VIEW Top10Artists AS
SELECT art.stage_name, COUNT(a.article_id)
FROM isAddedTo A, releases R, artists art
WHERE A.article_id = R.article_id AND art.uid = R.artist_id
GROUP BY art.stage_name
ORDER BY COUNT(a.article_id) DESC 
LIMIT 10;



