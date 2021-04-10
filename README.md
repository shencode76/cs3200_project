# cs3200_project
Music Database System


Topic --- Music database project


Project description:

People often listen to music. Sometimes they search for the music they want to listen to directly. Sometimes they search for music by artists or genres of their interests. Sometimes when they do not have particular songs they want to listen to, they just use websites or music applications to recommend music for them. When they find some good music, they may want to follow the artists, collect albums or share music with others. A database system for music can allow users to do plenty of things they wish to do.
We planned to build a Music Database System, where users can log in by Apply ID or their FaceBook ID, and search for songs in the library by songs’ names, album’s names or musicians’ names. At the same time, users can share their feelings with other listeners by leaving comments under the songs.

Database Language
--- MySQL
--- Software: MySQL WorkBench
--- Language: Java

Justification for SQL Database:
(cite from Project_Proposal_Example2)				
●	MySQL Database can support complex queries to be performed on the data stored in the database.
 						
●	It is important that the database responds quickly to the user requirements.
 						
●	MySQL also supports Replication, so the database can be hosted on multiple servers which ensures workload balance and scalability as the users of the applications increase.
 						
●	NoSQL databases are slow in providing response if the queries are complex.
 						
●	Also, NoSQL databases are suitable if schema of the database are dynamic. In our application schema is not dynamic.


Description of the Application:
We plan to create a website for searching songs and albums from global musicians. There will be three main sources of registered users : APPLE users, FaceBook users, and email_registered users, as well as the administrators. Administrators have access to registered users’ personal information and search history. First, users can CREATE their account with a unique username. After logging into the account, users can either LISTEN to the recommended playlists or SEARCH for songs to listen. Then, the search panel could READ users’ search information, and DISPLAY the result. After that, users could LISTEN to the song or CREATE a new playlist folder with it. A user can UPDATE their personal data. Admin can UPDATE the database information or any other user information. Admin can DELETE a user or song related information.
 						
Why this project?
We all like to listen to music in our free time. Hence we wanted to create a website in which users can search for songs or artists, collect music, leave comments under songs and create playlists.

User interaction 
-- What users can do?
1.   Create your playlists
In the library panel, users can create their own playlist
 
2.   Follow artists
In the library panel, users can check the artists they followed.
 
3.   Collect albums
In the library panel, users can check the albums they collected.
 
4.   Organizing playlist with folders
Once you’ve created your folders, you can drag playlists into them.

5.   Leaving comments under songs
Once audiences were touched by the specific song, they could leave their stories on comments.



