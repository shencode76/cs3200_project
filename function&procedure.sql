use MusicDB_Project;

-- member can search songs
-- member can leave comment on songs
-- member can search album
-- member can search artists
-- member can search songs according to genre
-- member can leave comment under songs
-- only search for given album
drop procedure if exists search_album;
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
drop procedure if exists search_song;
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
drop procedure if exists search_artist;
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
drop procedure if exists search;
DELIMITER $$
CREATE PROCEDURE Search (in search_condition VARCHAR(30))
BEGIN
		if (search_condition in (select album_name from Album))
    then select * from Album where album_name = search_condition;
    	elseif (search_condition in (select song_name from Song))
    then select * from Song where song_name = search_condition ;
    	elseif (search_condition in (select artist_name from Artist))
    then select * from Artist where artist_name = search_condition ;
        else select "no such album or artist or song.";
    end if;

END$$
DELIMITER ;


-- procedure : produce all the songs that is in given genre
-- Output : the songs fit this genre
drop procedure if exists genre_search;
delimiter $$ 
create procedure genre_search(in given_genre varchar(30))
begin 

select genre_name, count(song_name) as count_songs, group_concat(" ", song_name) as songs_in_genre from Genre
join Song on genre_id = song_genre_id and genre_name = given_genre
group by genre_name;

end $$
delimiter ;
call genre_search ("Rock");


-- leave commet under songs 
drop procedure if exists comment_on;
delimiter $$
create procedure comment_on(in comment_content varchar(30))
begin 
insert into Comment(comments) values (comment_content); 

end $$
delimiter ;


-- create account 
drop procedure if exists create_account;

delimiter $$
create procedure create_account(in userName varchar(30))
begin 

declare nameOccupied varchar(100);
declare typeNotExist varchar(100);

select nameOccupied = 'Name already occupied';
select typeNotExist = 'Please lowercase account type.';



if (userName not in (select user_name from user)) then 
insert into User (user_name) values (userName);
else select nameOccupied;
end if;

insert into Member (member_name) 
values  (userName);



end $$
delimiter ;
call create_account("Stanley");
call create_account("Baron");


-- recommend alogorithm :
-- recommend users the songs from their favourite artist, or the music that is in the same genre as their favorite singer

drop procedure if exists recommendation;
delimiter $$ 
create procedure recommendation(fav_singer varchar(30))
begin 

declare fav_genre int;
select artist_genre into fav_genre from Artist where artist_name = fav_singer;

select song_name as recommend_songs, artist_name from Song 
join Artist 
on artist_id = singer_id
and (artist_name = fav_singer
or song_genre_id = fav_genre);


end $$
delimiter ;
call recommendation("Rihanna");
call recommendation("Queen");
						   


-- user can update their user name 
drop procedure if exists update_identity;
delimiter $$
create procedure update_identity(exist_id int, new_user_name varchar(30))
begin 

update User set user_name = new_user_name where user_id = exist_id;

end $$
delimiter ;

call update_identity(4, "Steven Madi");


-- admin can delete database tuples
drop procedure if exists delete_song;
delimiter $$
create procedure delete_song(delete_song_id int)
begin 

delete from Song where song_id = delete_song_id;
 


end $$
delimiter ;
call delete_song(1);


-- admin can delete database member information
drop procedure if exists delete_member;
delimiter $$
create procedure delete_member(delete_member_id int)
begin 

delete from member where member_id = delete_member_id;
 


end $$
delimiter ;
call delete_member(1);

