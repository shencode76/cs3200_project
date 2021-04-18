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
drop procedure search_album;
DELIMITER $$
CREATE PROCEDURE search_album(in given_album VARCHAR(30))
BEGIN
	if (given_album in (select album_name from Album))
    then select album_name, song_name from Album 
	join Song on album_id = song_in_album
	and album_name =  given_album;
    end if;
END$$
DELIMITER ;
call search_album("Loud");


-- only search for given song
drop procedure search_song;
DELIMITER $$
CREATE PROCEDURE search_song(in given_song VARCHAR(30))
BEGIN
	if (given_song in (select song_name from Song))
    then select album_name, song_name, artist_name from Album 
	join Song on album_id = song_in_album
	join Artist on artist_id = singer_id
	and song_name = given_song;
    end if;
END$$
DELIMITER ;
call search_song("What's My Name");

-- only search for given artist
DELIMITER $$
CREATE PROCEDURE search_artist(in given_artist VARCHAR(30))
BEGIN
	if (given_artist in (select artist_name from Artist))
    then select artist_name, genre_name, album_name, song_name from Album 
	join Song on album_id = song_in_album
	join Artist on artist_id = singer_id
	join Genre on artist_genre = genre_id
	and artist_name = given_artist;
    end if;
END$$
DELIMITER ;
call search_artist("Rihanna");
call search_artist("Suede");


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


















