drop database if exists MusicDB_Project;

create database MusicDB_Project;

use MusicDB_Project;

/* create a user table to store information of registered users*/

create table User (
user_id int NOT NULL AUTO_INCREMENT,
user_name varchar(30),
CONSTRAINT user_pk PRIMARY KEY (user_id) 
);
insert into User (user_name) values ("Murphy Lee");
insert into User (user_name) values ("Amy Tan");
insert into User (user_name) values ("Jordan Jason");
insert into User (user_name) values ("Steven Madison");
insert into User (user_name) values ("Jose Wasenger");
insert into User (user_name) values ("ChrisJ");
insert into User (user_name) values ("Chris Jason");
/* There will have two more users be created by the following procedure,
They are "Stanley" and "Baron"*/

/* create a administrator table to store administrators' information*/
create table Administrator (
admin_id int NOT NULL AUTO_INCREMENT,
admin_name varchar(30),
admin_user_id int,
CONSTRAINT admin_pk PRIMARY KEY (admin_id),
CONSTRAINT user_admin_fk
    FOREIGN KEY (admin_user_id)
    REFERENCES User (user_id)
);
insert into Administrator (admin_name, admin_user_id) values ("Murphy Lee", 1);
insert into Administrator (admin_name, admin_user_id) values ("Amy Tan", 2);
insert into Administrator (admin_name, admin_user_id) values ("Jordan Jason", 3);
insert into Administrator (admin_name, admin_user_id) values ("Amily", (select user_id from User where user_name = "Amily"));

/* create a member table to store member information*/
create table Member (
member_id int NOT NULL AUTO_INCREMENT,
member_name varchar(30),
member_user_id int,
CONSTRAINT memb_pk PRIMARY KEY (member_id),
CONSTRAINT user_member_fk
    FOREIGN KEY (member_user_id)
    REFERENCES User (user_id)
);
/* the first Meber "Steven Madison" 's indentity will be updated by the following procedure*/
/* the first Meber "Steven Madison" will be deleted by the following procedure*/
insert into Member (member_name, member_user_id) values ("Steven Madison", 4);

insert into Member (member_name, member_user_id) values ("Jose Wasenger", 5);
insert into Member (member_name, member_user_id) values ("Chris Jason", 6);


/* create a genre table to store music genre, artist genre, album genre information*/
create table Genre (
genre_id int NOT NULL AUTO_INCREMENT,
genre_name varchar(30),
CONSTRAINT genre_pk PRIMARY KEY( genre_id)
);
insert into Genre(genre_name) values ("R&B");
insert into Genre(genre_name) values ("Rock");
insert into Genre(genre_name) values ("EDM");
insert into Genre(genre_name) values ("Classical Music");


/* create a artist table to store artists' information*/
create table Artist (
artist_id int NOT NULL AUTO_INCREMENT,
artist_name varchar(30),
artist_genre int,
CONSTRAINT artist_pk PRIMARY KEY(artist_id),
CONSTRAINT artist_genre_fk
    FOREIGN KEY (artist_genre)
    REFERENCES Genre (genre_id)
);
insert into Artist(artist_name, artist_genre) 
values ("Queen", 2);
insert into Artist(artist_name, artist_genre) 
values ("Suede", 2);
insert into Artist(artist_name, artist_genre) 
values ("The Chainsmokers", 3);
insert into Artist(artist_name, artist_genre) 
values ("Rihanna", 1);
insert into Artist(artist_name, artist_genre) 
values ("YunDi Li", 4);
insert into Artist(artist_name, artist_genre) 
values ("Elstica", 2);


/* create a Album table to store albums'' information*/
create table Album (
album_id int NOT NULL AUTO_INCREMENT,
album_name varchar(30),
album_artist int,
CONSTRAINT album_pk PRIMARY KEY (album_id),
CONSTRAINT album_artist_fk
    FOREIGN KEY (album_artist)
    REFERENCES Artist (artist_id)
);
insert into Album(album_name, album_artist) 
values ("Absolulte Greatest", 1);
insert into Album(album_name, album_artist) 
values ("A New Memory", 2);
insert into Album(album_name, album_artist) 
values ("Memories Do Not Open", 3);
insert into Album(album_name, album_artist) 
values ("Loud", 4);
insert into Album(album_name, album_artist) 
values ("Portrait", 5);
insert into Album(album_name, album_artist) 
values ("Nothing Is Promised", 4);
insert into Album(album_name, album_artist) 
values ("Elastica", 6);





/* create a song table to store songs' information*/
create table Song (
song_id int NOT NULL AUTO_INCREMENT,
song_name varchar(30),
singer_id int,
song_in_album int,
song_genre_id int,
CONSTRAINT song_pk PRIMARY KEY (song_id),
CONSTRAINT singer_fk
    FOREIGN KEY (singer_id)
    REFERENCES Artist (artist_id),
CONSTRAINT song_album_fk
    FOREIGN KEY (song_in_album)
    REFERENCES Album (album_id),
CONSTRAINT song_genre_id_fk
    FOREIGN KEY (song_genre_id)
    REFERENCES Genre (genre_id)
);
/* The first song "Radio Ga Ga" will be deleted by the following procedure*/
insert into Song(song_name, singer_id, song_in_album, song_genre_id) 
values ("Radio Ga Ga", 1, 1, 2);
insert into Song(song_name, singer_id, song_in_album, song_genre_id) 
values ("Lost in TV", 2, 2, 2);
insert into Song(song_name, singer_id, song_in_album, song_genre_id) 
values ("Paris", 3, 3, 3);
insert into Song(song_name, singer_id, song_in_album, song_genre_id) 
values ("What's My Name", 4, 4, 1);
insert into Song(song_name, singer_id, song_in_album, song_genre_id) 
values ("Nocturne, Op.9, No.2", 5, 5, 4);
insert into Song(song_name, singer_id, song_in_album, song_genre_id) 
values ("Nothing Is Promised", 4, 6, 1);
insert into Song(song_name, singer_id, song_in_album, song_genre_id) 
values ("Skin", 4, 4, 1);
insert into Song(song_name, singer_id, song_in_album, song_genre_id) 
values ("Man Down", 4, 4, 1);
insert into Song(song_name, singer_id, song_in_album, song_genre_id) 
values ("Car Song", 6, 7, 2);


/* create a comment table to store comments' information*/
create table Comment (
comment_id int NOT NULL AUTO_INCREMENT,
comments varchar(30),
commented_song int,
commented_by int, /* commented by user */
CONSTRAINT comment_pk PRIMARY KEY (comment_id),
CONSTRAINT comment_song_fk
    FOREIGN KEY (commented_song)
    REFERENCES Song (song_id),
CONSTRAINT comment_by_fk
    FOREIGN KEY (commented_by)
    REFERENCES User (user_id)
);
insert into Comment(comments, commented_song, commented_by) 
values("Awesome song", 3, 1);

insert into Comment(comments, commented_song, commented_by) 
values("Love this one's genre", 4, 2);






