use MusicDB_Project;

-- member can search songs
-- member can leave comment on songs
-- member can search album
-- member can search artists



DELIMITER $$
CREATE PROCEDURE search_album(in search_album VARCHAR(30))
BEGIN
	if (search_album in (select album_name from Album))
    then select * from Album where album_name = search_album ;
    end if;
END$$
DELIMITER ;



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

