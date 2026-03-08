USE Academy

SELECT faculties_id, name, financing, department_id
FROM Departments;

SELECT name AS [Group Name], rating AS [Group Rating]
FROM Groups;

SELECT 
    surname,
    salary * 100 / premium AS SalaryToPremiumPercent,
    salary * 100 / (salary + premium) AS SalaryToTotalPercent
FROM Teachers;

SELECT 
    'The dean of faculty ' + name + ' is [dean].' AS Info
FROM Faculties;

SELECT surname
FROM Teachers
WHERE name = 'Professor' AND salary > 1050;

SELECT name
FROM Departments
WHERE financing < 11000 OR financing > 25000;

SELECT name
FROM Faculties
WHERE name <> 'Computer Science';

SELECT surname, name
FROM Teachers
WHERE name <> 'Professor';

SELECT surname, salary
FROM Teachers
WHERE name = 'Assistant';

SELECT surname, name AS Position, salary, premium
FROM Teachers
WHERE name = 'Assistant'
  AND premium >= 160
  AND premium <= 550;