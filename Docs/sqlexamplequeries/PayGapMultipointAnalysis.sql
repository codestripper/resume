SELECT A.JobTitle, A.AveragePayRate as MRate, B.AveragePayRate as FRate
FROM (
    SELECT JobTitle, Gender, AVG(Rate) as AveragePayRate FROM HumanResources.Employee as e
    LEFT JOIN HumanResources.EmployeePayHistory as eph on (e.BusinessEntityID = eph.BusinessEntityID)
    WHERE Gender = 'M'
    GROUP BY JobTitle, Gender
) as A
LEFT JOIN (
    SELECT JobTitle, Gender, AVG(Rate) as AveragePayRate FROM HumanResources.Employee as e
    LEFT JOIN HumanResources.EmployeePayHistory as eph on (e.BusinessEntityID = eph.BusinessEntityID)
    WHERE Gender = 'F'
    GROUP BY JobTitle, Gender
) as B on (A.JobTitle = B.JobTitle)
WHERE A.AveragePayRate is not NULL
AND B.AveragePayRate is not NULL
AND A.AveragePayRate != B.AveragePayRate
