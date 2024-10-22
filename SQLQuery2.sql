--Homework

--Zad 6
USE SoftUni

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