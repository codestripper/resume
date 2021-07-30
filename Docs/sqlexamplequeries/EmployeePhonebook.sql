SELECT SUBSTRING(LoginID, 17, LEN(LoginID)-16) as UserID, p.FirstName, p.LastName, ea.EmailAddress, pp.PhoneNumber as WorkNumber, JobTitle, d.Name as Department, s.Name as Shift, s.StartTime, s.EndTime
  FROM [AdventureWorks].[HumanResources].[Employee] as e
  left join HumanResources.EmployeeDepartmentHistory as edh on e.BusinessEntityID = edh.BusinessEntityID
  left join HumanResources.Department as d on edh.DepartmentID = d.DepartmentID
  left join HumanResources.Shift as s on edh.ShiftID = s.ShiftID
  left join Person.EmailAddress as ea on ea.BusinessEntityID = e.BusinessEntityID
  left join Person.PersonPhone as pp on pp.BusinessEntityID = e.BusinessEntityID
  left join Person.Person as p on p.BusinessEntityID = e.BusinessEntityID
  WHERE edh.EndDate is NULL
  AND pp.PhoneNumberTypeID = 3