/* Recuperate i nomi dei prodotti e i loro prezzi di listino per i prodotti nella categoria "Bikes".
TIP: utilizzate le tabelle "DimProduct" e "DimProductCategory".*/

---non vi è relazione tra le due tabelle

/* Elencate tutti i dipendenti e le relative vendite per l'anno 2019.
TIP: utilizzate le tabelle "DimEmployee" e "FactResellerSales".*/

SELECT 
e.EmployeeKey,
e.FirstName +' '+e.lastname AS Name,
SUM(s.SalesAmount) AS TotalSales
FROM DIMEMPLOYEE AS E JOIN FactResellerSales AS s ON e.EmployeeKey = s.EmployeeKey
WHERE s.OrderDate BETWEEN '2019-01-01' AND '2019-12-31'
GROUP BY e.EmployeeKey, e.FirstName +' '+e.lastname;


/* Visualizzate i nomi di tutti i territori di vendita e l'importo totale delle vendite. Includete solo i territori con importi di vendita superiori a $50,000.
TIP: utilizzate le tabelle "DimSalesTerritory" e "FactResellerSales".*/

SELECT T.SalesTerritoryRegion AS Region, SUM(S.SalesAmount) AS TotalSales
FROM DimSalesTerritory AS T JOIN FactResellerSales AS S
ON T.SalesTerritoryKey = S.SalesTerritoryKey
GROUP BY T.SalesTerritoryRegion
HAVING SUM(S.SalesAmount) > 50000



/* Recuperate i nomi dei prodotti e i loro importi totali delle vendite.
TIP: utilizzate le tabelle "DimProduct" e "FactResellerSales".*/

SELECT P.EnglishProductName AS ProductName, SUM(S.SalesAmount) AS TotalSales
FROM DimProduct AS P 
LEFT JOIN FactResellerSales AS S 
ON P.ProductKey = S.ProductKey
GROUP BY P.EnglishProductName
ORDER BY TotalSales DESC