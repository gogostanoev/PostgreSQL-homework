-- Pre-requisites: database from Homework 1 with some dummy data inserted


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
(2, 'Bob', 'Bobski', '2001-04-21', '2020-09-15', 'M', '5846', '20'),
(3, 'David', 'Szymanski', '1997-11-10', '2021-01-10', 'M', '6543', '87'),
(4, 'Emily', 'Dale', '1996-06-05', '2022-03-12', 'F', '4567', '23'),
(5, 'Andrew', 'Garfield', '1999-09-18', '2023-02-28', 'M', '7891', '56'),
(6, 'Sarah', 'Wilson', '1999-02-28', '2023-01-05', 'F', '7321', '21'),
(7, 'Michael', 'Johnson', '1997-09-14', '2022-08-18', 'M', '6123', '23'),
(8, 'Emily', 'Brown', '1996-06-20', '2021-09-02', 'F', '9456', '56'),
(9, 'David', 'Smith', '1998-04-05', '2020-12-10', 'M', '1654', '54'),
(10, 'Jessica', 'Lee', '1997-07-12', '2023-03-15', 'F', '9321', '21'),
(11, 'Daniel', 'Davis', '1999-11-25', '2022-06-20', 'M', '4987', '87'),
(12, 'Sophia', 'Miller', '1998-08-08', '2021-10-30', 'F', '3654', '54'),
(13, 'Oliver', 'Thompson', '1997-03-18', '2020-07-05', 'M', '1789', '89'),
(14, 'Mia', 'Anderson', '1996-12-01', '2022-02-12', 'F', '6987', '87'),
(15, 'James', 'Wilson', '1999-05-09', '2023-04-22', 'M', '1456', '56');



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
(2, 'Jenny', 'Watson', '1991-07-01', 'Assistant', '2022-10-17'),
(3, 'Sarah', 'Davis', '1985-12-03', 'Assistant', '2015-02-15'),
(4, 'Robert', 'Wilson', '1975-08-20', 'Associate', '2005-04-20'),
(5, 'Jessica', 'Thompson', '1982-03-28', 'Professor', '2008-11-30'),
(6, 'Rachel', 'Taylor', '1983-08-14', 'Trainer', '2012-09-01'),
(7, 'Benjamin', 'Clark', '1979-06-22', 'Assistant', '2014-11-15'),
(8, 'Victoria', 'Hall', '1985-02-05', 'Associate', '2010-04-20'),
(9, 'Andrew', 'Wilson', '1978-11-10', 'Professor', '2009-07-30'),
(10, 'Natalie', 'Anderson', '1981-04-18', 'Associate', '2018-03-10'),
(11, 'Christopher', 'Moore', '1986-01-25', 'Assistant', '2015-06-20'),
(12, 'Sophie', 'King', '1980-11-08', 'Associate', '2007-09-30'),
(13, 'Jacob', 'Taylor', '1979-03-18', 'Trainer', '2006-07-05'),
(14, 'Ava', 'Clark', '1984-12-01', 'Assistant', '2011-02-12'),
(15, 'Ethan', 'Hall', '1977-09-09', 'Associate', '2017-04-22');



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
(2, 15, 4, 28, 99, '2018-02-10'),
(3, 2, 1, 75, 100, '2023-04-30'),
(4, 2, 2, 88, 100, '2023-05-20'),
(5, 3, 1, 92, 100, '2023-05-05'),
(6, 3, 3, 70, 75, '2023-05-10'),
(7, 4, 4, 94, 80, '2023-05-18'),
(8, 5, 2, 80, 100, '2023-05-22'),
(9, 6, 1, 91, 100, '2023-05-05'),
(10, 7, 4, 87, 90, '2023-05-29'),
(11, 8, 2, 83, 95, '2023-05-14'),
(12, 9, 3, 76, 100, '2023-05-20'),
(13, 10, 1, 89, 85, '2023-05-25'),
(14, 11, 4, 95, 100, '2023-06-02'),
(15, 12, 2, 78, 100, '2023-05-09');



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
(2, 'DevOps Academy', 8, '2022-2023', '1st semester'),
(3, 'Digital Marketing', 5, '2021-2022', '2nd semester'),
(4, 'Game Design', 3, '2022-2023', '1st semester'),
(5, 'Cyber Security', 4, '2021-2022', '1st semester'),
(6, 'Physics', 4, '2022-2023', '1st semester'),
(7, 'Biology', 3, '2022-2023', '2nd semester'),
(8, 'Art History', 3, '2021-2022', '2nd semester'),
(9, 'Geography', 4, '2022-2023', '1st semester'),
(10, 'Physical Education', 2, '2021-2022', '1st semester'),
(11, 'Music', 2, '2022-2023', '2nd semester'),
(12, 'Economics', 3, '2021-2022', '1st semester'),
(13, 'Psychology', 4, '2022-2023', '2nd semester'),
(14, 'Sociology', 3, '2021-2022', '1st semester'),
(15, 'Political Science', 4, '2022-2023', '1st semester');



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
(2, 13, 2, 3, 9.75, 'Exceptionally high', '2023-05-14'),
(3, 2, 1, 1, 7.77, 'Keep it up!', '2023-05-12'),
(4, 2, 3, 3, 8.55, 'Great effort', '2023-05-18'),
(5, 3, 2, 2, 9.31, 'Excellent work', '2023-05-22'),
(6, 3, 6, 6, 8.2, 'Good effort', '2023-05-15'),
(7, 4, 7, 7, 8.8, 'Well done!', '2023-05-25'),
(8, 5, 8, 8, 7.9, 'Keep it up!', '2023-05-12'),
(9, 6, 9, 9, 8.56, 'Great job', '2023-05-18'),
(10, 7, 10, 10, 9.24, 'Excellent work', '2023-05-22'),
(11, 8, 11, 11, 8.73, 'Good performance', '2023-05-15'),
(12, 9, 12, 12, 8.1, 'Well done!', '2023-05-25'),
(13, 10, 13, 13, 7.64, 'Keep it up!', '2023-05-12'),
(14, 11, 14, 14, 9, 'Great job', '2023-05-18'),
(15, 12, 15, 15, 8, 'Excellent work', '2023-05-22');



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
(2, 'hardworker', 'Awarded for creating and finishing over 100+ projects', '4%'),
(3, 'Attendance', 'Attendance achievement', '80%'),
(4, 'Homework', 'Homework achievement', '90%'),
(5, 'Exam', 'Exam achievement', '90%'),
(6, 'Extra Credit', 'Extra credit achievement', '80%'),
(7, 'Presentation', 'Presentation achievement', '50%'),
(8, 'Final Exam', 'Final exam achievement', '100%'),
(9, 'Group Project', 'Group project achievement', '95%'),
(10, 'Essay', 'Essay achievement', '90%'),
(11, 'Midterm Exam', 'Midterm exam achievement', '85%'),
(12, 'Lab Report', 'Lab report achievement', '95%'),
(13, 'Class Participation', 'Class participation achievement', '90%'),
(14, 'Research Paper', 'Research paper achievement', '95%'),
(15, 'Discussion Forum', 'Discussion forum achievement', '90%');