-- Azure Data Engineering Pipeline
-- Data Quality Checks


-- 1. Check for NULL Employee IDs
SELECT *
FROM Employees
WHERE EmployeeID IS NULL;


-- 2. Check for duplicate Employee IDs
SELECT
    EmployeeID,
    COUNT(*) AS RecordCount
FROM Employees
GROUP BY EmployeeID
HAVING COUNT(*) > 1;


-- 3. Check for invalid salaries
SELECT *
FROM Employees
WHERE Salary IS NULL
   OR Salary < 0;


-- 4. Check for missing departments
SELECT
    e.EmployeeID,
    e.EmployeeName,
    e.DepartmentID
FROM Employees e
LEFT JOIN Departments d
    ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentID IS NULL;


-- 5. Check for invalid hire dates
SELECT *
FROM Employees
WHERE HireDate > CAST(GETDATE() AS DATE);


-- 6. Basic record-count validation
SELECT COUNT(*) AS TotalEmployees
FROM Employees;
