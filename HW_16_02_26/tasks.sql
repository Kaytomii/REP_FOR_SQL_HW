CREATE DATABASE Academy
USE Academy

CREATE TABLE Faculties
(
	faculties_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	name nvarchar(100) NOT NULL CHECK(name <> ' ') UNIQUE
);

CREATE TABLE Departments
(
	department_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	financing MONEY NOT NULL CHECK(financing >= 0) DEFAULT(0),
	name nvarchar(100) NOT NULL CHECK(name <> ' ') UNIQUE,
	faculties_id INT FOREIGN KEY REFERENCES Faculties(faculties_id)
);

CREATE TABLE Groups
(
	groups_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	name nvarchar(100) NOT NULL UNIQUE CHECK(name <> ' '),
	rating INT CHECK(rating >= 0 and rating <= 5 ) NOT NULL,
	year INT CHECK(year >= 1 and year <= 5) NOT NULL,
	department_id INT FOREIGN KEY REFERENCES Departments(department_id)
);

CREATE TABLE Teachers
(
	teachers_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	employment_date DATE NOT NULL CHECK(employment_date >= '1990-01-01'),
	name nvarchar(max) NOT NULL CHECK(name <> ' '),
	premium MONEY NOT NULL CHECK(premium >= 0) DEFAULT(0),
	salary MONEY NOT NULL CHECK(salary > 0),
	surname nvarchar(max) NOT NULL CHECK(surname <> ' '),
	department_id INT FOREIGN KEY REFERENCES Departments(department_id)
);

CREATE TABLE Subjects
(
    Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL UNIQUE CHECK(Name <> ' ')
);


CREATE TABLE Lectures
(
    Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    DayOfWeek INT NOT NULL CHECK(DayOfWeek BETWEEN 1 AND 7),
    LectureRoom NVARCHAR(MAX) NOT NULL CHECK(LectureRoom <> ' '),
    SubjectId INT NOT NULL,
    TeacherId INT NOT NULL,

    FOREIGN KEY (SubjectId) REFERENCES Subjects(Id),
    FOREIGN KEY (TeacherId) REFERENCES Teachers(teachers_id)
);

CREATE TABLE GroupsLectures
(
    Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    GroupId INT NOT NULL,
    LectureId INT NOT NULL,

    FOREIGN KEY (GroupId) REFERENCES Groups(groups_id),
    FOREIGN KEY (LectureId) REFERENCES Lectures(Id)
);

CREATE TABLE GroupsCurators
(
    Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    CuratorId INT NOT NULL,
    GroupId INT NOT NULL,

    FOREIGN KEY (CuratorId) REFERENCES Teachers(teachers_id),
    FOREIGN KEY (GroupId) REFERENCES Groups(groups_id)
);

CREATE TABLE Students
(
    Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL CHECK(Name <> ' '),
    Surname NVARCHAR(100) NOT NULL CHECK(Surname <> ' ')
);

INSERT INTO Faculties (name)
VALUES
    ('Faculty of Engineering'),
    ('Faculty of Natural Sciences'),
    ('Faculty of Humanities');

INSERT INTO Departments (name, financing, faculties_id)
VALUES
    ('Computer Science', 150000, 1),
    ('Mathematics', 80000, 2),
    ('Physics', 120000, 2),
    ('History', 60000, 3);

INSERT INTO Groups (name, rating, year, department_id)
VALUES
    ('PI-101', 5, 1, 1),
    ('PI-202', 3, 2, 1),
    ('MATH-11', 4, 1, 2),
    ('PHYS-21', 2, 2, 3);

INSERT INTO Teachers (employment_date, name, surname, salary, premium, department_id)
VALUES
    ('1995-03-12', 'Ivan', 'Petrov', 50000, 5000, 1),
    ('2001-09-01', 'Anna', 'Sidorova', 60000, 7000, 2),
    ('2010-02-15', 'Sergey', 'Kuznetsov', 45000, 3000, 3),
    ('2018-05-20', 'Olga', 'Smirnova', 55000, 4000, 4);

SELECT * FROM Groups;
SELECT * FROM Departments;
SELECT * FROM Faculties;
SELECT * FROM Teachers;

DROP TABLE Groups;
DROP TABLE Departments;
DROP TABLE Faculties;
DROP TABLE Teachers;
