SELECT s.Name, d.Name, COUNT(*) as EmployeeCount FROM HumanResources.Employee as e
LEFT JOIN HumanResources.EmployeeDepartmentHistory as edh on (e.BusinessEntityID = edh.BusinessEntityID)
LEFT JOIN HumanResources.Shift as s on (s.ShiftID = edh.ShiftID)
LEFT JOIN HumanResources.Department as d on (edh.DepartmentID = d.DepartmentID)
WHERE EndDate is NULL
GROUP BY s.Name, d.Name

SELECT s.Name, COUNT(*) as EmployeeCount FROM HumanResources.Employee as e
LEFT JOIN HumanResources.EmployeeDepartmentHistory as edh on (e.BusinessEntityID = edh.BusinessEntityID)
LEFT JOIN HumanResources.Shift as s on (s.ShiftID = edh.ShiftID)
WHERE EndDate is NULL
GROUP BY s.Name