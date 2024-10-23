--Homework
	
--ZAD 1
USE SoftUni
SELECT TOP 5 EmployeeId, JobTitle, a.AddressId, AddressText
FROM Employees AS e
JOIN Addresses AS a ON a.AddressID = e.AddressID
ORDER BY a.AddressID ASC

--ZAD2 
SELECT TOP 5 EmployeeId, FirstName, Salary, d.Name AS DepartmentName
FROM Employees AS e
JOIN Departments AS d ON d.DepartmentID = e.DepartmentID
WHERE Salary > 15000
ORDER BY d.DepartmentID ASC

--ZAD3
SELECT TOP 3 e.EmployeeID, FirstName
FROM Employees AS e
LEFT JOIN EmployeesProjects AS ep ON ep.EmployeeID = e.EmployeeID
WHERE ep.ProjectID IS NULL
ORDER BY e.EmployeeID ASC

--ZAD 4 DATEPART
SELECT TOP 5 e.EmployeeID, FirstName, p.Name AS ProjectName
FROM Employees AS e
JOIN EmployeesProjects AS ep ON ep.EmployeeID = e.EmployeeID
JOIN Projects AS p ON p.ProjectID = ep.ProjectID
WHERE StartDate > DATEPART(YEAR,'2002/08/13') AND EndDate IS NULL
ORDER BY e.EmployeeID ASC

--ZAD 5
SELECT TOP 5 e.EmployeeID, FirstName,
CASE
	WHEN p.StartDate> DATEPART(YEAR,'2005') THEN 'NULL' 
	ELSE Name
	END
FROM Projects AS p
LEFT JOIN EmployeesProjects AS ep ON ep.ProjectID = p.ProjectID
LEFT JOIN Employees AS e ON e.EmployeeID = ep.ProjectID
WHERE e.EmployeeID = 24
--Zad 6

SELECT me.EmployeeID, me.FirstName, me.ManagerID, e.FirstName AS ManagerName
FROM Employees AS e
JOIN Employees AS me on me.ManagerID = e.EmployeeID 
WHERE me.ManagerID = 3 OR me.ManagerID = 7
ORDER BY e.EmployeeID

-- Zad 7
USE Geography

SELECT CountryCode, MountainRange, PeakName, Elevation
FROM MountainsCountries AS mc
JOIN Mountains AS m ON m.Id = mc.MountainId
JOIN Peaks AS p ON p.MountainId = m.Id
WHERE p.Elevation < 2935
ORDER BY p.Elevation DESC

--ZAD 8
SELECT CountryCode, COUNT(m.MountainRange) AS MountainRanges
FROM MountainsCountries AS mc
JOIN Mountains AS m ON m.Id = mc.MountainId
WHERE CountryCode = 'US' OR CountryCode = 'RU' OR CountryCode = 'BG'
GROUP BY CountryCode

--ZAD 9
SELECT TOP 5 CountryName, RiverName
FROM Countries AS c
LEFT JOIN CountriesRivers AS cr ON cr.CountryCode = c.CountryCode
LEFT JOIN Rivers AS r ON r.Id = cr.RiverId
WHERE ContinentCode = 'AF'
ORDER BY CountryName ASC
