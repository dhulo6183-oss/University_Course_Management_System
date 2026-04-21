-- STEP 1 : CREATE THE DATABASE

CREATE DATABASE CMS;
USE CMS;

-- STEP 2 : CREATE ALL TABLES

-- 1. Departments Table 
CREATE TABLE  Departments (
    DepartmentID   INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);

-- 2. Students Table
CREATE TABLE  Students (
    StudentID      INT PRIMARY KEY AUTO_INCREMENT,
    FirstName      VARCHAR(50)  NOT NULL,
    LastName       VARCHAR(50)  NOT NULL,
    Email          VARCHAR(100) UNIQUE NOT NULL,
    BirthDate      DATE         NOT NULL,
    EnrollmentDate DATE         NOT NULL
);

-- 3. Courses Table
CREATE TABLE  Courses (
    CourseID     INT PRIMARY KEY AUTO_INCREMENT,
    CourseName   VARCHAR(100) NOT NULL,
    DepartmentID INT,
    Credits      INT          NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- 4. Instructors Table
CREATE TABLE  Instructors (
    InstructorID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName    VARCHAR(50)  NOT NULL,
    LastName     VARCHAR(50)  NOT NULL,
    Email        VARCHAR(100) UNIQUE NOT NULL,
    DepartmentID INT,
    Salary       DECIMAL(10,2) NOT NULL DEFAULT 50000.00,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- 5. Enrollments Table
CREATE TABLE  Enrollments (
    EnrollmentID   INT PRIMARY KEY AUTO_INCREMENT,
    StudentID      INT,
    CourseID       INT,
    EnrollmentDate DATE NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID)  REFERENCES Courses(CourseID)
);

-- STEP 3 : INSERT SAMPLE DATA (30+ rows per table)

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1,  'Computer Science'),
(2,  'Mathematics'),
(3,  'Physics'),
(4,  'Chemistry'),
(5,  'Biology'),
(6,  'English Literature'),
(7,  'History'),
(8,  'Economics'),
(9,  'Mechanical Engineering'),
(10, 'Civil Engineering');

INSERT INTO Students (StudentID, FirstName, LastName, Email, BirthDate, EnrollmentDate) VALUES
(1,  'Aarav',    'Patel',     'aarav.patel@edu.in',      '2000-01-15', '2022-08-01'),
(2,  'Vivaan',   'Shah',      'vivaan.shah@edu.in',      '1999-05-25', '2021-08-01'),
(3,  'Aditya',   'Mehta',     'aditya.mehta@edu.in',     '2001-03-10', '2023-08-01'),
(4,  'Arjun',    'Joshi',     'arjun.joshi@edu.in',      '2000-07-22', '2022-01-15'),
(5,  'Ishaan',   'Desai',     'ishaan.desai@edu.in',     '1998-11-05', '2019-08-01'),
(6,  'Diya',     'Sharma',    'diya.sharma@edu.in',      '2001-09-18', '2023-01-10'),
(7,  'Riya',     'Verma',     'riya.verma@edu.in',       '1999-02-28', '2020-08-01'),
(8,  'Ananya',   'Singh',     'ananya.singh@edu.in',     '2002-06-14', '2024-01-15'),
(9,  'Kabir',    'Nair',      'kabir.nair@edu.in',       '2000-12-30', '2022-08-01'),
(10, 'Meera',    'Pillai',    'meera.pillai@edu.in',     '1997-04-17', '2018-08-01'),
(11, 'Rohan',    'Gupta',     'rohan.gupta@edu.in',      '2001-08-05', '2023-08-01'),
(12, 'Priya',    'Kumar',     'priya.kumar@edu.in',      '2000-03-21', '2022-01-10'),
(13, 'Karan',    'Mishra',    'karan.mishra@edu.in',     '1999-07-09', '2021-08-01'),
(14, 'Nisha',    'Iyer',      'nisha.iyer@edu.in',       '2002-01-25', '2024-08-01'),
(15, 'Yash',     'Bhat',      'yash.bhat@edu.in',        '1998-09-13', '2019-01-15'),
(16, 'Pooja',    'Rao',       'pooja.rao@edu.in',        '2001-05-07', '2023-01-10'),
(17, 'Kunal',    'Tiwari',    'kunal.tiwari@edu.in',     '2000-10-19', '2022-08-01'),
(18, 'Neha',     'Pandey',    'neha.pandey@edu.in',      '1999-12-03', '2020-08-01'),
(19, 'Rahul',    'Chauhan',   'rahul.chauhan@edu.in',    '2002-04-11', '2024-01-15'),
(20, 'Simran',   'Kapoor',    'simran.kapoor@edu.in',    '2001-06-29', '2023-08-01'),
(21, 'Harsh',    'Malhotra',  'harsh.malhotra@edu.in',   '1997-08-16', '2017-08-01'),
(22, 'Tanya',    'Saxena',    'tanya.saxena@edu.in',     '2000-02-08', '2022-01-10'),
(23, 'Om',       'Dubey',     'om.dubey@edu.in',         '2001-11-24', '2023-08-01'),
(24, 'Vikas',    'Srivastava','vikas.srivastava@edu.in', '1999-03-15', '2021-01-15'),
(25, 'Heena',    'Agarwal',   'heena.agarwal@edu.in',    '2002-07-02', '2024-08-01'),
(26, 'Jay',      'Chandra',   'jay.chandra@edu.in',      '1998-10-20', '2019-08-01'),
(27, 'Maya',     'Banerjee',  'maya.banerjee@edu.in',    '2001-01-12', '2023-01-10'),
(28, 'Zaid',     'Ansari',    'zaid.ansari@edu.in',      '2000-05-27', '2022-08-01'),
(29, 'Ankita',   'Thakur',    'ankita.thakur@edu.in',    '1999-09-08', '2021-08-01'),
(30, 'Ritu',     'Bose',      'ritu.bose@edu.in',        '2002-12-14', '2024-01-15');

-- ── Courses (30 rows) ─────────────────────────────────────
INSERT INTO Courses (CourseID, CourseName, DepartmentID, Credits) VALUES
(101, 'Introduction to SQL',        1, 3),
(102, 'Data Structures',            1, 4),
(103, 'Calculus I',                 2, 4),
(104, 'Linear Algebra',             2, 3),
(105, 'Classical Mechanics',        3, 4),
(106, 'Organic Chemistry',          4, 4),
(107, 'Cell Biology',               5, 3),
(108, 'British Literature',         6, 3),
(109, 'World History',              7, 3),
(110, 'Microeconomics',             8, 3),
(111, 'Machine Learning',           1, 4),
(112, 'Operating Systems',          1, 4),
(113, 'Calculus II',                2, 4),
(114, 'Statistics',                 2, 3),
(115, 'Quantum Mechanics',          3, 4),
(116, 'Inorganic Chemistry',        4, 3),
(117, 'Genetics',                   5, 4),
(118, 'American Literature',        6, 3),
(119, 'Modern History',             7, 3),
(120, 'Macroeconomics',             8, 3),
(121, 'Web Development',            1, 3),
(122, 'Computer Networks',          1, 4),
(123, 'Discrete Mathematics',       2, 3),
(124, 'Thermodynamics',             3, 4),
(125, 'Biochemistry',               4, 4),
(126, 'Ecology',                    5, 3),
(127, 'Creative Writing',           6, 3),
(128, 'Ancient History',            7, 3),
(129, 'International Economics',    8, 3),
(130, 'Structural Engineering',     10,4);

INSERT INTO Instructors (InstructorID, FirstName, LastName, Email, DepartmentID, Salary) VALUES
(1,  'Rajesh',   'Patel',      'rajesh.patel@univ.in',     1, 75000.00),
(2,  'Suresh',   'Shah',       'suresh.shah@univ.in',      2, 68000.00),
(3,  'Kiran',    'Mehta',      'kiran.mehta@univ.in',      3, 72000.00),
(4,  'Nikhil',   'Joshi',      'nikhil.joshi@univ.in',     4, 69000.00),
(5,  'Priti',    'Desai',      'priti.desai@univ.in',      5, 65000.00),
(6,  'Anita',    'Sharma',     'anita.sharma@univ.in',     6, 62000.00),
(7,  'Geeta',    'Verma',      'geeta.verma@univ.in',      7, 63000.00),
(8,  'Manish',   'Singh',      'manish.singh@univ.in',     8, 70000.00),
(9,  'Rekha',    'Nair',       'rekha.nair@univ.in',       9, 71000.00),
(10, 'Vijay',    'Pillai',     'vijay.pillai@univ.in',     10,73000.00),
(11, 'Kavita',   'Gupta',      'kavita.gupta@univ.in',     1, 80000.00),
(12, 'Lalit',    'Kumar',      'lalit.kumar@univ.in',      2, 67000.00),
(13, 'Meena',    'Mishra',     'meena.mishra@univ.in',     3, 74000.00),
(14, 'Naveen',   'Iyer',       'naveen.iyer@univ.in',      4, 66000.00),
(15, 'Omkar',    'Bhat',       'omkar.bhat@univ.in',       5, 64000.00),
(16, 'Pooja',    'Rao',        'pooja.rao@univ.in',        6, 61000.00),
(17, 'Qaiser',   'Tiwari',     'qaiser.tiwari@univ.in',    7, 60000.00),
(18, 'Ramesh',   'Pandey',     'ramesh.pandey@univ.in',    8, 69500.00),
(19, 'Savita',   'Chauhan',    'savita.chauhan@univ.in',   9, 72500.00),
(20, 'Tarun',    'Kapoor',     'tarun.kapoor@univ.in',     10,74000.00),
(21, 'Usha',     'Malhotra',   'usha.malhotra@univ.in',    1, 82000.00),
(22, 'Vivek',    'Saxena',     'vivek.saxena@univ.in',     2, 65000.00),
(23, 'Waqar',    'Dubey',      'waqar.dubey@univ.in',      3, 71000.00),
(24, 'Xenia',    'Srivastava', 'xenia.srivastava@univ.in', 4, 68500.00),
(25, 'Yusuf',    'Agarwal',    'yusuf.agarwal@univ.in',    5, 63500.00),
(26, 'Zara',     'Chandra',    'zara.chandra@univ.in',     6, 60500.00),
(27, 'Abha',     'Banerjee',   'abha.banerjee@univ.in',    7, 62500.00),
(28, 'Bharat',   'Ansari',     'bharat.ansari@univ.in',    8, 71500.00),
(29, 'Chetan',   'Thakur',     'chetan.thakur@univ.in',    9, 73500.00),
(30, 'Deepa',    'Bose',       'deepa.bose@univ.in',       10,75500.00);


INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate) VALUES

(1,  1,  101, '2022-08-01'),
(2,  3,  101, '2023-08-01'),
(3,  9,  101, '2022-08-01'),
(4,  16, 101, '2023-01-10'),
(5,  23, 101, '2023-08-01'),
(6,  4,  101, '2022-01-15'),
(7,  6,  101, '2023-01-10'),  
(8,  11, 101, '2023-08-01'),  
(9,  17, 101, '2022-08-01'),
(10, 22, 101, '2022-01-10'),
(11, 27, 101, '2023-01-10'),   
(12, 2,  102, '2021-08-01'),
(13, 6,  102, '2023-01-10'),   
(14, 11, 102, '2023-08-01'),  
(15, 20, 102, '2023-08-01'),
(16, 27, 102, '2023-01-10'),   
(17, 8,  102, '2024-01-15'),
(18, 5,  104, '2019-08-01'),
(19, 7,  105, '2020-08-01'),
(20, 10, 107, '2018-08-01'),
(21, 12, 108, '2022-01-10'),
(22, 13, 109, '2021-08-01'),
(23, 14, 110, '2024-08-01'),
(24, 15, 111, '2019-01-15'),
(25, 18, 113, '2020-08-01'),
(26, 19, 114, '2024-01-15'),
(27, 21, 115, '2017-08-01'),
(28, 24, 117, '2021-01-15'),
(29, 25, 118, '2024-08-01'),
(30, 26, 119, '2019-08-01'),
(31, 28, 120, '2022-08-01'),
(32, 29, 121, '2021-08-01'),
(33, 30, 122, '2024-01-15');

-- STEP 4 : CRUD OPERATIONS  (Query 1)

-- Add a new student
INSERT INTO Students (StudentID, FirstName, LastName, Email, BirthDate, EnrollmentDate)
VALUES (31, 'New', 'Student', 'new.student@edu.in', '2003-01-01', '2025-08-01');

-- Add a new course
INSERT INTO Courses (CourseID, CourseName, DepartmentID, Credits)
VALUES (131, 'Artificial Intelligence', 1, 4);

--  READ (SELECT) 
SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Instructors;
SELECT * FROM Enrollments;
SELECT * FROM Departments;

--  UPDATE (INCREMENT & DECREMENT)
-- INCREMENT: Increase credits by 1 for all CS courses
UPDATE Courses
SET Credits = Credits + 1          
WHERE DepartmentID = 1;

-- DECREMENT: Reduce credits by 1 for History courses
UPDATE Courses
SET Credits = Credits - 1         
WHERE DepartmentID = 7;

-- INCREMENT: Give all CS instructors a $5000 salary raise
UPDATE Instructors
SET Salary = Salary + 5000        
WHERE DepartmentID = 1;

-- DECREMENT: Reduce salary of instructors earning above $80000 by $2000
UPDATE Instructors
SET Salary = Salary - 2000         -
WHERE Salary > 80000;

-- DELETE 
-- Remove the newly added test student
DELETE FROM Students WHERE StudentID = 31;

-- QUERY 2 : Retrieve students who enrolled AFTER 2022
SELECT
    StudentID,
    FirstName,
    LastName,
    EnrollmentDate
FROM Students
WHERE EnrollmentDate > '2022-12-31'   
ORDER BY EnrollmentDate;

-- QUERY 3 : Courses by Mathematics dept, limit 5
SELECT
    CourseID,
    CourseName,
    Credits
FROM Courses
WHERE DepartmentID = 2             
ORDER BY CourseID
LIMIT 5;

-- QUERY 4 : Number of students per course, only courses
--           with MORE than 5 students
SELECT
    c.CourseID,
    c.CourseName,
    COUNT(e.StudentID) AS TotalStudents   
FROM Courses c
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.CourseName
ORDER BY TotalStudents DESC;

-- QUERY 5 : Students enrolled in BOTH courses 101 AND 102
--           (INTERSECT using INNER JOIN)
SELECT
    s.StudentID,
    s.FirstName,
    s.LastName
FROM Students s

JOIN Enrollments e1 ON s.StudentID = e1.StudentID AND e1.CourseID = 101

JOIN Enrollments e2 ON s.StudentID = e2.StudentID AND e2.CourseID = 102;

-- QUERY 6 : Students enrolled in EITHER course 101 OR 102
--           (UNION)
SELECT s.StudentID, s.FirstName, s.LastName, 'Intro to SQL' AS CourseName
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
WHERE e.CourseID = 101

UNION

SELECT s.StudentID, s.FirstName, s.LastName, 'Data Structures' AS CourseName
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
WHERE e.CourseID = 102
ORDER BY StudentID;

-- QUERY 7 : Average number of credits across all courses
SELECT
    AVG(Credits) AS AverageCredits    
FROM Courses;

-- QUERY 8 : Maximum salary of instructors in Computer Science
SELECT
    MAX(Salary) AS MaxSalary        
FROM Instructors
WHERE DepartmentID = 1;             

-- QUERY 9 : Count of students enrolled in each department
SELECT
    d.DepartmentName,
    COUNT(DISTINCT e.StudentID) AS StudentCount
FROM Departments d
JOIN Courses     c ON d.DepartmentID = c.DepartmentID
JOIN Enrollments e ON c.CourseID     = e.CourseID
GROUP BY d.DepartmentID, d.DepartmentName
ORDER BY StudentCount DESC;

-- QUERY 10 : INNER JOIN – Students with their courses
SELECT
    s.StudentID,
    s.FirstName,
    s.LastName,
    c.CourseName,
    e.EnrollmentDate
FROM Students    s
INNER JOIN Enrollments e ON s.StudentID  = e.StudentID
INNER JOIN Courses     c ON e.CourseID   = c.CourseID
ORDER BY s.StudentID;

-- QUERY 11 : LEFT JOIN – All students + their courses (if any)
SELECT
    s.StudentID,
    s.FirstName,
    s.LastName,
    c.CourseName           
FROM Students    s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
LEFT JOIN Courses     c ON e.CourseID  = c.CourseID
ORDER BY s.StudentID;

-- QUERY 12 : SUBQUERY – Students in courses with > 10 students
SELECT
    StudentID,
    FirstName,
    LastName
FROM Students
WHERE StudentID IN (
  
    SELECT e.StudentID
    FROM Enrollments e
    WHERE e.CourseID IN (
     
        SELECT CourseID
        FROM Enrollments
        GROUP BY CourseID
        HAVING COUNT(StudentID) > 10
    )
);

-- QUERY 13 : Extract YEAR from EnrollmentDate
SELECT
    StudentID,
    FirstName,
    LastName,
    EnrollmentDate,
    YEAR(EnrollmentDate) AS EnrollmentYear   
FROM Students
ORDER BY EnrollmentYear;

-- QUERY 14 : Concatenate instructor First + Last name
SELECT
    InstructorID,
    CONCAT(FirstName, ' ', LastName) AS FullName,  
    Email,
    DepartmentID
FROM Instructors
ORDER BY InstructorID;

-- QUERY 15 : Running total of students enrolled in courses
--            (Window Function)
SELECT
    e.EnrollmentID,
    e.CourseID,
    c.CourseName,
    e.StudentID,
    e.EnrollmentDate,
    
    SUM(1) OVER (ORDER BY e.EnrollmentID) AS RunningTotalStudents
FROM Enrollments e
JOIN Courses     c ON e.CourseID = c.CourseID
ORDER BY e.EnrollmentID;

-- QUERY 16 : Label students as 'Senior' or 'Junior'
--            Senior  → enrolled more than 4 years ago
--            Junior  → enrolled within last 4 years
SELECT
    StudentID,
    FirstName,
    LastName,
    EnrollmentDate,
    CASE
        -- if enrollment was more than 4 years from today → Senior
        WHEN DATEDIFF(CURDATE(), EnrollmentDate) > (4 * 365)
            THEN 'Senior'
        -- otherwise → Junior
        ELSE 'Junior'
    END AS StudentLevel
FROM Students
ORDER BY StudentID;
