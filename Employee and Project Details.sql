
Create database Employee_database

Create Table EmployeeDT
(
Emp_ID Int,
FirstName Varchar(300),
LastName Varchar(300),
Salary money,
DOJ Datetime,
Department varchar(120),
Gender char(20)
)

Insert into EmployeeDT values
(1, 'Vikas', 'Ahlawat', 600000, '20130212T11:16:00', 'IT', 'Male')

Insert into EmployeeDT values
(2, 'Nikitha', 'Jain', 530000, '20130214 11:16', 'HR', 'Female'),
(3, 'Ashish', 'Kumar', 1000000, '20131202 11:16', 'IT', 'Male'),
(4, 'Nikhil', 'Sharma', 480000, '20130215 11:16', 'HR', 'Male'),
(5, 'Anish', 'Kadian', 500000, '20130216 11:16', 'Payroll', 'Male')

Select * from EmployeeDT

Select FirstName from EmployeeDT

Select Upper(FirstName) as First_Name from EmployeeDT

Select Concat(firstname, ' ', lastname) as FullName From EmployeeDT

Select * from EmployeeDT
Where FirstName = 'Vikas'

Select * from EmployeeDT
Where FirstName like 'a%'

Select * from EmployeeDT
Where FirstName like 'a_p%'

Select * from EmployeeDT
Where FirstName not like 'a_p%'

Select * from EmployeeDT
Where Gender like '__le%'

Select * from EmployeeDT
Where FirstName like 'A____'

Select * from EmployeeDT
Where FirstName like '%'

SELECT DISTINCT Department
FROM EmployeeDT;

Select MAx(salary) as H_S from EmployeeDT

Select Min(salary) as L_S from EmployeeDT

SELECT FORMAT(DOJ, 'dd MMM yyyy') AS FormattedJoiningDate
FROM EmployeeDT;

SELECT FORMAT(DOJ, 'yyyy/ MM/ dd') AS FormattedJoiningDate
FROM EmployeeDT;

SELECT TIME(DOJ) AS JoiningTime
FROM EmployeeDT

Select year(DOJ) as Years from EmployeeDT

Select month(DOJ) as months from EmployeeDT

SELECT GETDATE() AS CurrentDate;

SELECT FirstName, GETDATE() AS currentdate, Doj,
    DATEDIFF(MONTH, Doj, GETDATE()) AS months_since_joining
FROM EmployeeDT;


SELECT FirstName, GETutcDATE() AS currentdate, Doj,
    DATEDIFF(MONTH, Doj, GETutcDATE()) AS months_since_joining
FROM EmployeeDT;

select DATEADD(hour, 8, getutcdate()) as china_date


Select * from EmployeeDT
where DOJ between '20130101' and '20130131'


Select top 1 * from EmployeeDT

Select * from EmployeeDT
Where FirstName in('vikas', 'Ashish', 'Nikhil')

Select * from EmployeeDT
Where FirstName not in('vikas', 'Ashish', 'Nikhil')

SELECT RTRIM(FirstName) AS RT_FN
FROM EmployeeDT;

SELECT LTRIM(FirstName) AS LT_FN
FROM EmployeeDT;

SELECT FirstName, 
       CASE 
           WHEN gender = 'Male' THEN 'M'
           WHEN gender = 'Female' THEN 'F'
           ELSE 'Unknown'
       END AS gender
FROM EmployeeDT;


SELECT CONCAT('Hello ', FirstName) AS Greeting
FROM EmployeeDT;

Select * from EmployeeDT
Where salary > 600000

Select * from EmployeeDT
Where salary < 700000

Select * from EmployeeDT
Where salary between 500000 and 600000

create table ProjectDT
(
ProjectDetailID int,
EmployeeDetailID int,
ProjectName varchar(125)
)

Insert into ProjectDT Values
(1, 1, 'Task Track'),
(2, 2, 'CLP'),
(3, 3, 'Survey Management'),
(4, 4, 'HR Management'),
(5, 5, 'Task Track'),
(6, 6, 'GRS'),
(7, 7, 'DDS'),
(8, 8, 'HR Management'),
(9, 9, 'GL Management')

Select * from ProjectDT

Select Department, sum(salary) as Total_Salary from EmployeeDT
group by Department

Select Department, sum(salary) as Total_Salary from EmployeeDT
group by Department
order by Total_Salary Asc; 

Select Department, count(department),sum(salary) as Total_Salary from EmployeeDT
group by Department

Select Department, avg(salary) as Average_Salary from EmployeeDT
Group by Department
order by Average_Salary Asc;

Select Department, max(salary) as Average_Salary from EmployeeDT
Group by Department
order by Average_Salary Asc;


Select Department, min(salary) as Average_Salary from EmployeeDT
Group by Department
order by Average_Salary Asc;

Select * from EmployeeDT
join ProjectDT on ProjectDT.EmployeeDetailID = EmployeeDT.Emp_ID

Select * from EmployeeDT
Select * from ProjectDT


Select ProjectDT.ProjectName, CONCAT(FirstName, ' ', LastName) as FullName, coalesce(EmployeeDT.FullName, 'Not Assigned')
as ProjectName from ProjectDT 
left join EmployeeDT on EmployeeDT.Emp_ID = ProjectDT.EmployeeDetailID


Select ProjectDT.ProjectName,  coalesce(EmployeeDT.FirstName, 'Not Assigned')
from ProjectDT 
left join EmployeeDT on EmployeeDT.Emp_ID = ProjectDT.EmployeeDetailID

select E.Emp_ID, CONCAT(FirstName, ' ', LastName) as FullName, coalesce(P.ProjectName, 'Not Assigned')
from EmployeeDT E
left join ProjectDT P on E.Emp_ID = P.EmployeeDetailID




Select ProjectDT.ProjectName, CONCAT(FirstName, ' ', LastName) as FullName from EmployeeDT
join ProjectDT on ProjectDT.EmployeeDetailID = EmployeeDT.Emp_ID

SELECT ProjectDT.ProjectDetailID, EmployeeDT.FirstName
FROM ProjectDT
LEFT JOIN EmployeeDT ON ProjectDT.EmployeeDetailID = EmployeeDT.Emp_ID
ORDER BY ProjectDT.ProjectDetailID, EmployeeDT.FirstName;



SELECT ProjectDT.ProjectName, EmployeeDT.FirstName
FROM ProjectDT
LEFT JOIN EmployeeDT ON ProjectDT.EmployeeDetailID = EmployeeDT.Emp_ID

SELECT count(ProjectDT.ProjectName), EmployeeDT.FirstName FROM ProjectDT
LEFT JOIN EmployeeDT ON ProjectDT.EmployeeDetailID = EmployeeDT.Emp_ID
Group by EmployeeDT.FirstName


SELECT count(ProjectDT.ProjectName) as No_of_Projects, EmployeeDT.FirstName FROM ProjectDT
LEFT JOIN EmployeeDT ON ProjectDT.EmployeeDetailID = EmployeeDT.Emp_ID
Group by EmployeeDT.FirstName
Having COUNT(ProjectDT.ProjectName) > 1

Select * from EmployeeDT
cross join ProjectDT

Select * from ProjectDT
cross join EmployeeDT

Select * from EmployeeDT
full outer join 
ProjectDT
 
