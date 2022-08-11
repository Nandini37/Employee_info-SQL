use tricks;

SELECT * FROM tricks.employee_info;

SELECT * FROM tricks.employee_position;


-- Write a query to fetch the EmpFname from the EmployeeInfo table in the upper case and use the ALIAS name as EmpName.

SELECT UPPER(EmpFname) AS EmpName
FROM employee_info;

-- Write a query to fetch the number of employees working in the department ‘HR’.

SELECT Department,COUNT(EmpID)
FROM employee_info
WHERE Department = 'HR';


-- Write a query to get the current date.

SELECT current_date();


-- Write a query to retrieve the first four characters of  EmpLname from the EmployeeInfo table.

SELECT LEFT(EmpLname,4)
FROM employee_info;


-- Write a query to fetch only the place name(string before brackets) from the Address column of EmployeeInfo table.

-- SELECT MID(Address, 0, LOCATE('(',Address)) FROM employee_info;

-- SELECT SUBSTRING(Address, 1, LOCATE('(', Address)) FROM employee_info;

select 
LEFT(Address, LOCATE('(', Address) - 1)
from employee_info; 

-- Write a query to create a new table that consists of data and structure copied from the other table.



CREATE TABLE NewTable AS SELECT * FROM employee_info;

-- Write q query to find all the employees whose salary is between 50000 to 100000.

SELECT * FROM employee_info
LEFT JOIN employee_position
ON employee_info.EmpID = employee_position.EmpID
WHERE Salary BETWEEN 50000 AND 100000;

-- OR

SELECT * FROM employee_position WHERE Salary BETWEEN '50000' AND '100000';

-- Write a query to find the names of employees that begin with ‘S’

SELECT * FROM employee_info
WHERE EmpFname LIKE 'S%';

-- Write a query to fetch top N records.

SELECT * FROM employee_position ORDER BY Salary DESC LIMIT 1;

-- Write a query to retrieve the EmpFname and EmpLname in a single column as “FullName”. 
-- The first name and the last name must be separated with space.

SELECT CONCAT(EmpFname, ' ', EmpLname) AS 'FullName' FROM employee_info;


-- Write a query find number of employees whose DOB is between 02/05/1970 to 31/12/1975 and are grouped according to gender

SELECT COUNT(*), Gender FROM employee_info 
WHERE DOB BETWEEN '02/05/1970' AND '31/12/1975'
GROUP BY Gender;

-- Write a query to fetch all the records from the EmployeeInfo table
-- ordered by EmpLname in descending order and Department in the ascending order.

SELECT * FROM employee_info  ORDER BY EmpFname desc, Department asc;

-- Write a query to fetch details of all employees excluding the employees with first names, 
-- “Sanjay” and “Sonia” from the EmployeeInfo table.

SELECT * FROM employee_info 
WHERE EmpFname NOT IN ('Sanjay','Sonia');

-- Write a query to fetch 50% records from the EmployeeInfo table.

SELECT * 
FROM employee_info WHERE
EmpID <= (SELECT COUNT(EmpID)/2 from employee_info);

-- Write a query to fetch all employees who also hold the managerial position.

SELECT E.EmpFname, E.EmpLname, P.EmpPosition 
FROM employee_info E INNER JOIN employee_position P ON
E.EmpID = P.EmpID AND P.EmpPosition IN ('Manager');

-- Write a query to fetch the department-wise count of employees sorted by department’s count in ascending order.

SELECT DEPARTMENT, COUNT(EmpID)
FROM employee_info
GROUP BY Department
ORDER BY COUNT(EmpID) asc;

-- Write a query to calculate the even and odd records from a table.

-- ODD

SELECT *
FROM (
    SELECT *, Row_Number() OVER(ORDER BY EmpID) AS RowNumber  -- Row_Number() starts with 1
            FROM employee_info
) t
 WHERE t.RowNumber % 2 = 1 ; -- Odd
 
 -- EVEN
 
SELECT *
FROM (
    SELECT *, Row_Number() OVER(ORDER BY EmpID) AS RowNumber  -- Row_Number() starts with 1
            FROM employee_info
) t
WHERE t.RowNumber % 2 = 0 ; -- Even


-- Write a SQL query to retrieve employee details from EmployeeInfo table 
-- who have a date of joining in the EmployeePosition table.

SELECT * FROM employee_info E 
WHERE EXISTS 
(SELECT * FROM employee_position P WHERE E.EmpId = P.EmpId);





