create or replace function orders_by_genre(vargenre VARCHAR(30))
	returns table (
		article_id INTEGER,
		ordered bigint
		)
	as $$
	begin 
	return query 
	SELECT a.article_id, COUNT(order_id)
	FROM contains c, articles a 
	WHERE c.article_id = a.article_id AND a.genre = vargenre 
	GROUP BY a.article_id;
	end; 
	$$ language plpgsql;

	create or replace function top_artist_genre(vargenre VARCHAR(30)) 
		returns VARCHAR(20)
	as $$
	begin 



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
	
