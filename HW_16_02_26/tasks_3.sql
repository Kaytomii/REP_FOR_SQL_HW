USE Academy

SELECT Teachers.surname, Groups.name
FROM Teachers, Groups;

SELECT Faculties.name
FROM Faculties
JOIN Departments ON Faculties.faculties_id = Departments.faculties_id
WHERE Departments.financing > 0;

SELECT Teachers.surname, Groups.name
FROM Teachers
JOIN Groups ON Teachers.department_id = Groups.department_id;

SELECT Teachers.surname
FROM Teachers
JOIN Groups ON Teachers.department_id = Groups.department_id
WHERE Groups.name = 'P107';

SELECT Teachers.surname, Faculties.name
FROM Teachers
JOIN Departments ON Teachers.department_id = Departments.department_id
JOIN Faculties ON Departments.faculties_id = Faculties.faculties_id;

SELECT Departments.name, Groups.name
FROM Departments
JOIN Groups ON Departments.department_id = Groups.department_id;