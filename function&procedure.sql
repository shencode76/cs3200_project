use MusicDB_Project;

-- member can search songs
-- member can leave comment on songs
-- member can search album
-- member can search artists
-- member can search songs according to genre
-- member can leave comment under songs

/*
e.g. 
artist : Beach Fossils
song :  Lessons
album : Shallow / Lesson
search_album(shallow) -> 
search_song(sson) -> 
search_artist(beach) ->

select * from table where 
_name like '% ? %';

*/

-- only search for given album
DELIMITER $$
CREATE PROCEDURE search_album(in given_album VARCHAR(30))
BEGIN
	if (search_album in (select album_name from Album))
    then select * from Album where album_name = search_album ;
    end if;
END$$
DELIMITER ;

-- only search for given song
DELIMITER $$
CREATE PROCEDURE search_song(in given_song VARCHAR(30))
BEGIN
	if (given_song in (select song_name from Song))
    then select * from Song where song_name = given_song ;
    end if;
END$$
DELIMITER ;

-- only search for given artist
DELIMITER $$
CREATE PROCEDURE search_artist(in given_artist VARCHAR(30))
BEGIN
	if (given_artist in (select artist_name from Artist))
    then select * from Artist where artist_name = given_artist ;
    end if;
END$$
DELIMITER ;


-- generate all the artist, song, album that have given searcing condition 
DELIMITER $$
CREATE PROCEDURE Search (in search_condition VARCHAR(30))
BEGIN
		if (search_condition in (select album_name from Album))
    then select * from Album where album_name = search_condition;
    	elseif (search_condition in (select song_name from Song))
    then select * from Song where song_name = search_condition ;
    	elseif (search_condition in (select artist_name from Artist))
    then select * from Artist where artist_name = search_condition ;
        else select"no such album or artist or song.";
    end if;

END$$
DELIMITER ;

/*
-- select all the songs has Jazz as genre
select song_name from Song join Genre 
on song_genre_id = genre_id
and genre_name = "Jazz";
*/

-- procedure : produce all the songs that is in given genre
-- Output : the songs fit this genre
delimiter $$ 

create procedure genre_search(in given_genre varchar(30))
begin 

select count(*) as song_numbers, song_name from Song 
join Genre
on song_genre_id = genre_id
and genre_name = given_genre
group by song_name;

return song_fit_genre;
end $$
delimiter ;

-- leave commet under songs 
delimiter $$
create procedure comment_on(in comment varchar(30))
begin 
insert into Comment values (comment); 

end $$
delimiter ;


















