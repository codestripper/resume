SELECT sod.ProductID, p.Name, pp.ThumbNailPhoto, AVG(sod.UnitPrice) as AverageCost, COUNT(*) as TotalSold, SUM(sod.LineTotal) as TotalSales
  FROM [AdventureWorks].[Sales].[SalesOrderDetail] as sod
  LEFT JOIN Production.Product as p on sod.ProductID = p.ProductID
  LEFT JOIN Production.ProductProductPhoto as ppp on p.ProductID = ppp.ProductID
  LEFT JOIN Production.ProductPhoto as pp on ppp.ProductPhotoID = pp.ProductPhotoID
  GROUP BY sod.ProductID, pp.ThumbNailPhoto, p.Name
  ORDER BY TotalSold desc