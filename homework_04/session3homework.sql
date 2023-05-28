-- Homework requirement 1/3
-- Calculate the count of all grades in the system

SELECT COUNT(g.grade) AS GradeCount
FROM grade AS g;


-- Calculate the count of all grades per Teacher in the system

SELECT teacherid,
COUNT (g.grade) AS GradePerTeacher
FROM grade AS g
GROUP BY teacherid;


-- Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)

SELECT g.teacherid,
COUNT (g.grade) AS GradePerTeacher
FROM grade AS g
INNER JOIN student AS s ON g.studentid = s.id
WHERE s.id < 100
GROUP BY g.teacherid;


-- Find the Maximal Grade, and the Average Grade per Student on all grades in the system

SELECT g.studentid,
MAX(g.grade),
AVG(g.grade)
FROM grade AS g
GROUP BY g.studentid;




-- Homework requirement 2/3
-- Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200

-- Nema tuka da dade zapis no vaka bi trebalo da bide query-to
SELECT g.teacherid,
COUNT (g.grade) AS GradePerTeacher
FROM grade AS g
GROUP BY g.teacherid
HAVING COUNT(g.grade) > 200;


-- Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100) and filter teachers with more than 50 Grade count

-- I tuka nema da dade zapis..
SELECT g.teacherid,
COUNT (g.grade) AS GradeCount
FROM grade AS g
INNER JOIN student s ON g.studentid = s.id
WHERE s.id < 100
GROUP BY g.teacherid
HAVING COUNT(g.grade) > 50;


-- Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system. Filter only records where Maximal Grade is equal to Average Grade

SELECT g.studentid,
COUNT (g.grade) AS GradeCount,
MAX (g.grade) AS MaxGrade,
AVG (g.grade) AS AvgGrade
FROM grade AS g
GROUP BY g.studentid
HAVING MAX(g.grade) = AVG(g.grade);


-- List Student First Name and Last Name next to the other details from previous query

SELECT s.firstname, s.lastname, g.studentid,
COUNT (g.grade) AS GradeCount,
MAX (g.grade) AS MaxGrade,
AVG (g.grade) AS AvgGrade
FROM grade AS g
INNER JOIN student AS s ON g.studentid = s.id
GROUP BY g.studentid, s.firstname, s.lastname
HAVING MAX(g.grade) = AVG(g.grade);




-- Homework requirement 3/3
-- Create new view (vw_StudentGrades) that will List all StudentIds and count of Grades per student

CREATE VIEW vw_StudentGrades AS
SELECT g.studentid,
COUNT (g.grade)
FROM grade AS g
GROUP BY g.studentid;

SELECT * FROM vw_StudentGrades;


-- Change the view to show Student First and Last Names instead of StudentID

-- Morav na ovoj nachin bidejki nitu so alter view, nitu so create or replace view ne raboteshe, nitu so rename column
DROP VIEW IF EXISTS vw_StudentGrades;

CREATE OR REPLACE VIEW vw_StudentGrades AS
SELECT s.firstname, s.lastname,
COUNT (g.grade) AS GradeCount
FROM grade AS g
INNER JOIN student AS s ON g.studentid = s.id
GROUP BY s.firstname, s.lastname;


-- List all rows from view ordered by biggest Grade Count

SELECT *
FROM vw_StudentGrades
ORDER BY GradeCount DESC;


-- Create new view (vw_StudentGradeDetails) that will List all Students (FirstName and LastName) and Count the courses he passed through the exam

CREATE OR REPLACE VIEW vw_StudentGradeDetails AS
SELECT s.firstname, s.lastname,
COUNT (DISTINCT g.courseid) AS PassedCourse
FROM grade AS g
INNER JOIN student AS s ON g.studentid = s.id
WHERE g.grade >= 8.5
GROUP BY s.firstname, s.lastname;

SELECT * FROM vw_StudentGradeDetails;