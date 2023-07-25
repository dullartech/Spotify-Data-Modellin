CREATE TABLE Users (
  User_ID INT AUTO_INCREMENT PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  Email VARCHAR(50) NOT NULL UNIQUE,
  Password VARCHAR(100) NOT NULL,
  Date_of_Birth DATE,
  Profile_Image Blob
);

CREATE TABLE Artists (
  Artist_ID INT AUTO_INCREMENT PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  Genre VARCHAR(50),
  Image Blob
);

CREATE TABLE Albums (
  Album_ID INT AUTO_INCREMENT PRIMARY KEY,
  Artist_ID INT,
  Name VARCHAR(50) NOT NULL,
  Release_Date DATE,
  Image VARCHAR(255),
  FOREIGN KEY (Artist_ID) REFERENCES Artists(Artist_ID)
);

CREATE TABLE Tracks (
  Track_ID INT AUTO_INCREMENT PRIMARY KEY,
  Album_ID INT,
  Name VARCHAR(50) NOT NULL,
  Duration INT NOT NULL,
  Path VARCHAR(255),
  FOREIGN KEY (Album_ID) REFERENCES Albums(Album_ID)
);

CREATE TABLE Playlists (
  Playlist_ID INT AUTO_INCREMENT PRIMARY KEY,
  User_ID INT,
  Name VARCHAR(50) NOT NULL,
  Image Blob,
  FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);

CREATE TABLE Playlist_Tracks (
  Playlist_ID INT,
  Track_ID INT,
  `Order` INT,
  PRIMARY KEY (Playlist_ID, Track_ID),
  FOREIGN KEY (Playlist_ID) REFERENCES Playlists(Playlist_ID),
  FOREIGN KEY (Track_ID) REFERENCES Tracks(Track_ID)
);

CREATE TABLE Followers (
  User_ID INT,
  Artist_ID INT,
  PRIMARY KEY (User_ID, Artist_ID),
  FOREIGN KEY (User_ID) REFERENCES Users(User_ID),
  FOREIGN KEY (Artist_ID) REFERENCES Artists(Artist_ID)
);

CREATE TABLE Likes (
  User_ID INT,
  Track_ID INT,
  Like_Date_Time DATETIME,
  PRIMARY KEY (User_ID, Track_ID),
  FOREIGN KEY (User_ID) REFERENCES Users(User_ID),
  FOREIGN KEY (Track_ID) REFERENCES Tracks(Track_ID)
);


SELECT * FROM Users
SELECT * FROM artists
SELECT * FROM albums
SELECT * FROM tracks
SELECT * FROM Playlists
SELECT * FROM Playlist_tracks
SELECT * FROM likes
SELECT * FROM Followers
