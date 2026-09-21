-- Azure Data Engineering Pipeline
-- SQL Transformations

-- 1. Employee details with department
SELECT
    e.EmployeeID,
    e.EmployeeName,
    d.DepartmentName,
    e.Salary
FROM Employees e
INNER JOIN Departments d
    ON e.DepartmentID = d.DepartmentID;


-- 2. Employee count by department
SELECT
    d.DepartmentName,
    COUNT(e.EmployeeID) AS EmployeeCount
FROM Departments d
LEFT JOIN Employees e
    ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName;


-- 3. Average salary by department
SELECT
    d.DepartmentName,
    AVG(e.Salary) AS AverageSalary
FROM Departments d
INNER JOIN Employees e
    ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName;


-- 4. Employees earning above their department average
WITH DepartmentSalary AS
(
    SELECT
        DepartmentID,
        AVG(Salary) AS AverageSalary
    FROM Employees
    GROUP BY DepartmentID
)
SELECT
    e.EmployeeID,
    e.EmployeeName,
    e.Salary,
    ds.AverageSalary
FROM Employees e
INNER JOIN DepartmentSalary ds
    ON e.DepartmentID = ds.DepartmentID
WHERE e.Salary > ds.AverageSalary;


-- 5. Rank employees by salary within each department
SELECT
    EmployeeID,
    EmployeeName,
    DepartmentID,
    Salary,
    RANK() OVER
    (
        PARTITION BY DepartmentID
        ORDER BY Salary DESC
    ) AS SalaryRank
FROM Employees;


-- 6. Highest-paid employee
SELECT TOP 1
    EmployeeID,
    EmployeeName,
    Salary
FROM Employees
ORDER BY Salary DESC;
