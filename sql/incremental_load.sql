-- Azure Data Engineering Pipeline
-- Incremental Load Logic

-- Get the last successful load date
DECLARE @LastLoadDate DATETIME2 = '2026-01-01 00:00:00';


-- Extract only new or modified records
SELECT
    EmployeeID,
    EmployeeName,
    DepartmentID,
    Salary,
    HireDate,
    LastModifiedDate
FROM Employees
WHERE LastModifiedDate > @LastLoadDate;


-- Example: identify records modified since the previous load

DECLARE @Watermark DATETIME2 = '2026-01-01 00:00:00';

SELECT *
FROM Employees
WHERE LastModifiedDate > @Watermark
ORDER BY LastModifiedDate;
