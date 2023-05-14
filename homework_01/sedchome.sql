CREATE TABLE Student
(
	ID INTEGER PRIMARY KEY NOT NULL,
	FirstName varchar(20) NOT NULL,
	LastName varchar(20) NOT NULL,
	DateOfBirth date,
	EnrolledDate date,
	Gender nchar(1) NOT NULL,
	NationalIDNumber varchar(20),
	StudentCardNumber varchar(20)
);

SELECT * FROM student;

INSERT INTO student (ID, FirstName, LastName, DateOfBirth, EnrolledDate, Gender, NationalIDNumber, StudentCardNumber)
VALUES
(1, 'John', 'Doe', '1998-12-10', '2022-10-17', 'M', '1046', '13'),
(2, 'Bob', 'Bobski', '2001-04-21', '2020-09-15', 'M', '5846', '20');



CREATE TABLE Teacher
(
	ID INTEGER PRIMARY KEY NOT NULL,
	FirstName varchar(20) NOT NULL,
	LastName varchar(20) NOT NULL,
	DateOfBirth date NOT NULL,
	AcademicRank varchar(30) NOT NULL,
	HireDate date NOT NULL
);

SELECT * FROM teacher;

INSERT INTO teacher (ID, FirstName, LastName, DateOfBirth, AcademicRank, HireDate)
VALUES
(1, 'Michael', 'Levrey', '1995-02-09', 'Trainer', '2015-03-16'),
(2, 'Jenny', 'Watson', '1991-07-01', 'Assistant', '2022-10-17');



CREATE TABLE GradeDetails
(
	ID INTEGER PRIMARY KEY NOT NULL,
	GradeID integer NOT NULL,
	AchievementTypeID integer,
	AchievementPoints integer,
	AchievementMaxPoints integer,
	AchievementDate date
);

SELECT * FROM gradedetails;

INSERT INTO gradedetails (ID, GradeID, AchievementTypeID, AchievementPoints, AchievementMaxPoints, AchievementDate)
VALUES
(1, 10, 3, 43, 90, '2021-08-25'),
(2, 15, 4, 28, 99, '2018-02-10');



CREATE TABLE Course
(
	ID INTEGER PRIMARY KEY NOT NULL,
	Name varchar(20) NOT NULL,
	Credit integer,
	AcademicYear varchar(20),
	Semester varchar(20)
);

SELECT * FROM course;

INSERT INTO course (ID, Name, Credit, AcademicYear, Semester)
VALUES
(1, 'Programming Academy', 8, '2022-2023', '2nd semester'),
(2, 'DevOps Academy', 8, '2022-2023', '1st semester');



CREATE TABLE Grade
(
	ID INTEGER PRIMARY KEY NOT NULL,
	StudentID integer NOT NULL,
	CourseID integer NOT NULL,
	TeacherID integer NOT NULL,
	Grade decimal,
	Comment varchar(50),
	CreatedDate date
);

SELECT * FROM grade;

INSERT INTO grade (ID, StudentID, CourseID, TeacherID, Grade, Comment, CreatedDate)
VALUES
(1, 10, 1, 1, 7.45, 'Above average', '2023-05-14'),
(2, 13, 2, 3, 9.75, 'Exceptionally high', '2023-05-14');



CREATE TABLE AchievementType
(
	ID INTEGER PRIMARY KEY NOT NULL,
	Name varchar(20) NOT NULL,
	Description varchar(60),
	ParticipationRate varchar(10)
);

SELECT * FROM achievementtype;

INSERT INTO achievementtype (ID, Name, Description, ParticipationRate)
VALUES
(1, 'hatchling', 'Awarded for making a new project', '75%'),
(2, 'hardworker', 'Awarded for creating and finishing over 100+ projects', '4%');