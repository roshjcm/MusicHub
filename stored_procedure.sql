create or replace function orders_by_genre(vargenre VARCHAR(30))
	returns table (
		artist_id INTEGER,
		ordered numeric
		)
	as $$
	begin 
	return query 
	SELECT r.artist_id, SUM(bygenre.sales)
	FROM releases r, 
			(SELECT a.article_id, COUNT(order_id) as sales
			FROM contains c, articles a 
			WHERE c.article_id = a.article_id AND a.genre = vargenre 
			GROUP BY a.article_id) bygenre
	WHERE r.article_id = bygenre.article_id
	GROUP BY r.artist_id;
	end; 
	$$ language plpgsql;


	create or replace function top_artist_genre(vargenre VARCHAR(30)) 
		returns table(
			top_artist VARCHAR(20),
			sales numeric
			)
	as $$
	begin 
	return query
	SELECT a.stage_name, b.ordered
	FROM artists a, orders_by_genre(vargenre) b
	WHERE a.uid = b.artist_id AND b.ordered >= ALL (
		SELECT ordered
		FROM orders_by_genre(vargenre) b);
	end;
	$$ language plpgsql;


	create or replace function introduction() returns void
	as $$
	declare 
	v_libid integer;
	v_articles bigint;
	cx cursor for select lib_id, COUNT(article_id) FROM isaddedto GROUP BY lib_id;
	begin 

	INSERT INTO articles VALUES (1,'Welcome to MusicHub!', NULL, 0, NULL);
	open cx;
	loop 
	fetch cx into v_libid, v_articles;
	exit when not found;

	if (v_articles = 0) then
	INSERT INTO isaddedto VALUES (1, v_libid);
	end if;
	end loop;
	close cx;
	end;
	$$ language plpgsql;
	
