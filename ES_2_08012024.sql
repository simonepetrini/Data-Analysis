USE AdventureWorksDW2020;

-- ESERCIZIO: esplora la tabella FactResellerSales
SELECT *
FROM FactResellerSales

-- 1) esponi l'elenco degli ordini (SalesOrderNumber) e delle transazioni (SalesOrderLineNumber)
-- 2) conta il numero di transazioni per ciascun ordine
-- 3) arricchisci il risultato precendete della quantit‡ totale totale venduta (OrderQuantity) per ordine e della somma dell'importo (SalesAmount)

SELECT		
SalesOrderNumber AS NumeroOrdine, 
COUNT (*) as NumeroTransazioni, 
SUM(OrderQuantity) AS Quantit‡Totale, 
SUM(SalesAmount) AS ImportoTotale
FROM FactResellerSales
GROUP BY SalesOrderNumber;


-- ESERCIZIO: esistono codici prodotti (ProductKey) che hanno il medesimo nome prodotto (EnglishProductName)?

SELECT EnglishProductName, COUNT(EnglishProductName) AS PK_Associati
FROM DimProduct
GROUP BY EnglishProductName
HAVING COUNT(EnglishProductName) > 1
ORDER BY PK_Associati ASC

-- ESERCIZIO: analisi prodotti. Calcola il fatturato totale, la quantit‡ totale, il numero di transazioni e la media del prezzo di vendita per ciascun prodotto.
-- tip: Il result set deve contenere il nome prodotto e le aggregazioni richieste. Utilizza gli operatori COUNT, SUM, AV

SELECT 
P.EnglishProductName AS Prodotto, 
SUM(S.SalesAmount) AS FatturatoTotale, 
SUM(S.OrderQuantity) AS Quantit‡Totale, 
Count(S.SalesOrderLineNumber) AS NumeroTransazioni, 
AVG(S.UnitPrice) AS PrezzoMedio
FROM FactResellerSales AS S	
INNER JOIN DimProduct AS P	
ON S.ProductKey = P.ProductKey
GROUP BY S.ProductKey, P.EnglishProductName
ORDER BY Prodotto

-- ESERCIZIO: esistono prodotti che non sono mai stati venduti?

SELECT P.EnglishProductName,SUM(S.SalesAmount) AS VenditeTotali
FROM DimProduct AS P
LEFT OUTER JOIN FactResellerSales AS S
ON S.ProductKey = P.ProductKey
GROUP BY P.ProductKey,P.EnglishProductName
HAVING SUM(S.SalesAmount) IS NULL

