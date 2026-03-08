SELECT COUNT(*)
FROM Teachers
JOIN Departments ON Teachers.department_id = Departments.department_id
WHERE Departments.name = 'Software Development';

SELECT COUNT(*)
FROM Lectures
JOIN Teachers ON Lectures.TeacherId = Teachers.teachers_id
WHERE Teachers.name = 'Dave' AND Teachers.surname = 'McQueen';

SELECT COUNT(*)
FROM Lectures
WHERE LectureRoom = 'D201';

SELECT LectureRoom, COUNT(*) AS LectureCount
FROM Lectures
GROUP BY LectureRoom;

SELECT COUNT(DISTINCT GroupsLectures.GroupId) AS StudentGroupsCount
FROM Lectures
JOIN Teachers ON Lectures.TeacherId = Teachers.teachers_id
JOIN GroupsLectures ON Lectures.Id = GroupsLectures.LectureId
WHERE Teachers.name = 'Jack' AND Teachers.surname = 'Underhill';

SELECT AVG(salary) AS AvgSalary
FROM Teachers
JOIN Departments ON Teachers.department_id = Departments.department_id
WHERE Departments.name = 'Computer Science';

SELECT 
    MIN(LectureCount) AS MinStudents,
    MAX(LectureCount) AS MaxStudents
FROM (
    SELECT GroupId, COUNT(*) AS LectureCount
    FROM GroupsLectures
    GROUP BY GroupId
) AS X;

SELECT AVG(financing) AS AvgFinancing
FROM Departments;

SELECT 
    Teachers.name + ' ' + Teachers.surname AS FullName,
    COUNT(DISTINCT Lectures.SubjectId) AS SubjectsCount
FROM Teachers
LEFT JOIN Lectures ON Teachers.teachers_id = Lectures.TeacherId
GROUP BY Teachers.name, Teachers.surname;

SELECT DayOfWeek, COUNT(*) AS LectureCount
FROM Lectures
GROUP BY DayOfWeek
ORDER BY DayOfWeek;