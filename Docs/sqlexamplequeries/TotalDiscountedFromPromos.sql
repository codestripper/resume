SELECT sod.SpecialOfferID, 
        so.[Description],
        so.DiscountPct, 
        so.[Type], 
        COUNT(*) as TotalOrders, 
        SUM(((sod.UnitPriceDiscount * UnitPrice) * OrderQty)) as TotalAmountDiscounted,
        AVG(((sod.UnitPriceDiscount * UnitPrice) * OrderQty)) as AverageLostPerOrder
  FROM [AdventureWorks].[Sales].[SalesOrderDetail] as sod
  LEFT JOIN Sales.SpecialOffer as so on so.SpecialOfferID = sod.SpecialOfferID
  WHERE sod.SpecialOfferID != '1'
  GROUP BY sod.SpecialOfferID, so.[Description], so.DiscountPct, so.[Type]
  ORDER BY TotalAmountDiscounted desc