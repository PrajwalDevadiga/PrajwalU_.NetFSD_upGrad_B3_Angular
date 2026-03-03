CREATE DATABASE EventDb

USE EventDb

CREATE TABLE UserInfo 
(
	EmailId VARCHAR(20) PRIMARY KEY, 
	UserName VARCHAR(50) NOT NULL CHECK (LEN(UserName) BETWEEN 1 AND 50),
	Role VARCHAR(25) NOT NULL CHECK (Role IN ('Admin','Participant')), 
	Password VARCHAR(20) NOT NULL CHECK (LEN(Password) BETWEEN 6 AND 20) 
); 

CREATE TABLE EventDetails 
( 
	EventId INT PRIMARY KEY, 
	EventName varchar(50) NOT NULL CHECK (LEN(EventName) BETWEEN 1 AND 50), 
	EventCategory varchar(50) NOT NULL CHECK (LEN(EventCategory) BETWEEN 1 AND 50), 
	EventDate datetime NOT NULL,
	Description varchar(250) NULL, 
	status varchar(20) NOT NULL check (status in ('Active','In-Active'))
); 

CREATE TABLE SpeakersDetails
( 
	SpeakerId INT PRIMARY KEY, 
	SpeakerName varchar(50) NOT NULL CHECK (LEN(SpeakerName) BETWEEN 1 AND 50)
); 

CREATE TABLE SessionInfo 
( 
	SessionId INT PRIMARY KEY, 
	EventId INT NOT NULL, 
	SessionTitle varchar(50) NOT NULL CHECK (LEN(SessionTitle) Between 1 and 50), 
	SpeakerId INT NOT NULL, 
	Description varchar(250) NULL, 
	SessionStart DATETIME NOT NULL, 
	SessionEnd DATETIME NOT NULL, 
	SessionUrl varchar(50),
	FOREIGN KEY(EventId) REFERENCES EventDetails(EventId), 
	FOREIGN KEY(SpeakerId) REFERENCES SpeakersDetails(SpeakerId) 
); 

CREATE TABLE ParticipantEventDetails 
( 
	Id INT PRIMARY KEY, 
	ParticipantEmailId varchar(20) NOT NULL,
	EventId INT NOT NULL, 
	SessionId INT NOT NULL, 
	IsAttended BIT NOT NULL CHECK (IsAttended IN (0,1)),
	FOREIGN KEY(ParticipantEmailId) REFERENCES UserInfo(EmailId), 
	FOREIGN KEY(EventId) REFERENCES EventDetails(EventId), 
	FOREIGN KEY(SessionId) REFERENCES SessionInfo(SessionId) 
);
