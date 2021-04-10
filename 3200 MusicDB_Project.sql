create database MusicDB_Project;

use MusicDB_Project;

/* create a user table to store information of registered users*/
drop table User;
create table User (
user_id int primary key,
user_name varchar(30)
);

/* create a administrator table to store administrators' information*/
drop table Administrator;
create table Administrator (
admin_id int,
admin_name varchar(30),
CONSTRAINT admin_pk PRIMARY KEY (admin_id),
CONSTRAINT user_admin_fk
    FOREIGN KEY (admin_id)
    REFERENCES User (user_id)
);

/* create a member table to store member' information*/
drop table Member;
create table Member (
member_id int,
member_name varchar(30),
CONSTRAINT memb_pk PRIMARY KEY (member_id),
CONSTRAINT user_member_fk
    FOREIGN KEY (member_id)
    REFERENCES User (user_id)
);

/* create a song table to store songs' information*/
drop table Song;
create table Song (
song_id int primary key,
song_name varchar(30),
commenter int,
comment_num int,
song_genre_id int,
CONSTRAINT comment_by_fk
    FOREIGN KEY (commenter)
    REFERENCES Member (member_id),
CONSTRAINT comment_num_fk
    FOREIGN KEY (comment_num)
    REFERENCES Comment (comment_id),
CONSTRAINT song_genre_id_fk
    FOREIGN KEY (song_genre_id)
    REFERENCES Genre (genre_id)
    
);

/* create a comment table to store comments' information*/
drop table Comment;
create table Comment (
comment_id int not null auto_increment,
comments varchar(30),
CONSTRAINT comment_pk PRIMARY KEY (comment_id)
);


/* create a Album table to store albums'' information*/
drop table Album;
create table Album (
album_id int primary key,
album_name varchar(30),
songs_id int,
album_genre int,
CONSTRAINT album_has_song_fk
    FOREIGN KEY (songs_id)
    REFERENCES Song (song_id),
CONSTRAINT album_genre_fk
    FOREIGN KEY (album_genre)
    REFERENCES Genre (genre_id)

);

/* create a genre table to store music genre, artist genre, album genre information*/
drop table Genre;
create table Genre (
genre_id int primary key,
genre_name varchar(30)
);

/* create a artist table to store artists' information*/
drop table Artist;
create table Artist (
artist_id int primary key,
artist_name varchar(30),
songs_id int,
album_id int,
artist_genre int,
CONSTRAINT sing_fk
    FOREIGN KEY (songs_id)
    REFERENCES Song (song_id),
CONSTRAINT artist_album_fk
    FOREIGN KEY (album_id)
    REFERENCES Album (album_id),
CONSTRAINT artist_genre_fk
    FOREIGN KEY (artist_genre)
    REFERENCES Genre (genre_id)
);



