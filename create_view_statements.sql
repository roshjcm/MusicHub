


/* songs that are also albums (singles) */


CREATE VIEW singles ()
AS SELECT * 
FROM albums article_id
WHERE albums.type='single'

