/* Elencate tutti i dipendenti (nome, cognome e identificativo unico) e la media delle loro vendite vendite. */

SELECT e.EmployeeKey, e.FirstName + ' ' + e.LastName as Name, AVG(s.SalesAmount) as AverageSales
FROM DimEmployee AS e
LEFT OUTER JOIN FactResellerSales AS s
ON e.EmployeeKey = s.EmployeeKey
GROUP BY e.EmployeeKey, e.FirstName + ' ' + e.LastName

/* Elencate tutti i dipendenti (nome, cognome e identificativo unico) e la media di prezzo del prodotto venduto e il conteggio delle loro vendite vendite. */


SELECT e.EmployeeNationalIDAlternateKey, e.FirstName + ' ' + e.MiddleName + ' ' + e.LastName AS EmployeeName, AVG(s.UnitPrice) AS AverageProductPrice, COUNT(s.SalesOrderNumber) AS TotalSalesCOrders
FROM DimEmployee AS e
LEFT OUTER JOIN FactResellerSales AS s
ON e.EmployeeKey = s.EmployeeKey
GROUP BY e.EmployeeNationalIDAlternateKey, e.FirstName,e.MiddleName,e.LastName


/* Per ogni territorio di vendita, contate il numero totale di vendite. Includete solo i territori con almeno una vendita */

SELECT t.SalesTerritoryRegion, COUNT(s.SalesAmount)
FROM DimSalesTerritory AS t
JOIN FactResellerSales AS s
ON t.SalesTerritoryKey = s.SalesTerritoryKey
GROUP BY t.SalesTerritoryRegion
HAVING COUNT(s.SalesAmount) > 1


/* Per ogni prodotto, trovate la data di vendita più recente. */

SELECT p.EnglishProductName, MAX(s.OrderDate) AS LastOrderDate
FROM DimProduct AS p
JOIN FactResellerSales AS s
ON p.ProductKey = s.ProductKey
GROUP BY P.EnglishProductName


/* Per ogni mese dell'anno più recente, calcolate la media delle vendite giornaliere. */

SELECT YEAR(OrderDate) AS Anno, MONTH(OrderDate) AS Mese, AVG(SalesAmount) AS MediaVenditeGiornaliere
FROM FactResellerSales
WHERE YEAR(OrderDate) = (SELECT MAX(YEAR(OrderDate)) FROM FactResellerSales)
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY YEAR(OrderDate), MONTH(OrderDate)


/* Per ogni mese dell'anno più recente, calcolate la somma delle vendite totali. Includete solo i mesi con vendite superiori a $100,000 */

SELECT MONTH(OrderDate) AS LastYearMonth ,SUM(SalesAmount) AS TotalSales
FROM FactResellerSales
WHERE YEAR(OrderDate) = (SELECT MAX(YEAR(OrderDate)) FROM FactResellerSales)
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
HAVING SUM(SalesAmount) > 100000
ORDER BY YEAR(OrderDate), MONTH(OrderDate)

SELECT MONTH(OrderDate) as YearMonth, SUM(SalesAmount) AS TotalSales
FROM FactResellerSales
WHERE YEAR(OrderDate) = 2020
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
HAVING SUM(SalesAmount) > 100000
ORDER BY MONTH(OrderDate)

/* Per ogni anno, trovate l'ultimo prodotto venduto. 2017-2020*/

SELECT TOP 1 SalesOrderNumber, SalesOrderLineNumber,OrderDate,EnglishProductName 
FROM FactResellerSales AS S
INNER JOIN DimProduct AS P
ON S.ProductKey = P.ProductKey
WHERE YEAR(OrderDate) = 2017
ORDER BY OrderDate DESC

SELECT TOP 1 SalesOrderNumber, SalesOrderLineNumber,OrderDate,EnglishProductName 
FROM FactResellerSales AS S
INNER JOIN DimProduct AS P
ON S.ProductKey = P.ProductKey
WHERE YEAR(OrderDate) = 2018
ORDER BY OrderDate DESC

SELECT TOP 1 SalesOrderNumber, SalesOrderLineNumber,OrderDate,EnglishProductName 
FROM FactResellerSales AS S
INNER JOIN DimProduct AS P
ON S.ProductKey = P.ProductKey
WHERE YEAR(OrderDate) = 2019
ORDER BY OrderDate DESC

SELECT TOP 1 SalesOrderNumber, SalesOrderLineNumber,OrderDate,EnglishProductName 
FROM FactResellerSales AS S
INNER JOIN DimProduct AS P
ON S.ProductKey = P.ProductKey
WHERE YEAR(OrderDate) = 2020
ORDER BY OrderDate DESC

-----per ogni mese del 2019 calcola la media delle vendite giornaliere -- 

SELECT MONTH(OrderDate) AS YearMonth, AVG(SalesAmount) AS MonthlyAverageSales
FROM FactResellerSales
WHERE YEAR(OrderDate) = 2019
GROUP BY MONTH(OrderDate)
ORDER BY MONTH(OrderDate)