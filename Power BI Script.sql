SELECT C.EnglishEducation, C.EnglishOccupation,c.Gender , c.MaritalStatus,
                C.NumberCarsOwned, C.NumberChildrenAtHome, C.YearlyIncome, (CASE WHEN c.YearlyIncome < 50000 THEN 'Yearly Income less than 50000' WHEN c.YearlyIncome >= 50000 AND 
                  c.YearlyIncome <= 100000 THEN 'Yearly Income Between 50000-100000' ELSE 'Yearly Income Greater than 100000' END) AS YearlyIncome_Group, G.City, G.EnglishCountryRegionName, G.StateProvinceName, C.CustomerAlternateKey, 
                  P.EnglishProductName, P.SafetyStockLevel, P.Color, P.DaysToManufacture, SC.EnglishProductSubcategoryName, PC.EnglishProductCategoryName, DD.CalendarYear, DD.EnglishMonthName, 'Q' + CONVERT(varchar(75), 
                  DD.FiscalQuarter) + '-' + CONVERT(varchar(75), DD.CalendarYear) AS Quarter, DD.EnglishDayNameOfWeek, I.DueDate, I.OrderDate, I.OrderQuantity, I.ProductStandardCost, I.SalesAmount, I.TaxAmt, I.UnitPrice, 
                  I.SalesAmount - I.TotalProductCost AS Profit
FROM     DimCustomer AS C INNER JOIN
                  DimGeography AS G ON G.GeographyKey = C.GeographyKey INNER JOIN
                  FactInternetSales AS I ON I.CustomerKey = C.CustomerKey INNER JOIN
                  DimProduct AS P ON P.ProductKey = I.ProductKey INNER JOIN
                  DimProductSubcategory AS SC ON SC.ProductCategoryKey = P.ProductSubcategoryKey INNER JOIN
                  DimProductCategory AS PC ON PC.ProductCategoryKey = SC.ProductCategoryKey INNER JOIN
                  DimDate AS DD ON DD.DateKey = I.DueDateKey