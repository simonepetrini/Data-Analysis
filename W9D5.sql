--creazione database
CREATE DATABASE W9D5;

--creazione tabelle
CREATE TABLE PRODOTTI
(
IDProdotto INT,
NomeProdotto varchar(100),
Prezzo decimal (10,2),
constraint PK_PRODOTTI primary key (IDProdotto)
);

CREATE TABLE ORDINI
(
IDOrdine INT,
IDProdotto INT,
Quantità INT,
constraint PK_ORDINI primary key (IDOrdine),
constraint FK_ORDINI foreign key (IDProdotto) references PRODOTTI(IDProdotto)
);

CREATE TABLE CLIENTI
(
IDCliente INT,
NomeCliente varchar(50),
EmailCliente varchar(100),
constraint PK_CLIENTI primary key (IDCliente)
);

CREATE TABLE DETTAGLIO_ORDINI
(
IDOrdine INT FOREIGN KEY REFERENCES ORDINI(IDOrdine),
IDProdotto INT FOREIGN KEY REFERENCES PRODOTTI(IDProdotto),
IDCliente INT FOREIGN KEY REFERENCES CLIENTI(IDCliente),
PrezzoTotale DECIMAL (10,2)
CONSTRAINT PK_DETTAGLIO_ORDINI PRIMARY KEY (IDOrdine,IDProdotto,IDCliente)
);

ALTER TABLE ORDINI 
ADD IDCliente INT
CONSTRAINT FK_DETTORDINI_CLIENTI FOREIGN KEY (IDCliente) REFERENCES CLIENTI(IDCliente)
 
UPDATE ORDINI SET IDCliente=1 WHERE IDCliente IS NULL

INSERT INTO DETTAGLIO_ORDINI (IDOrdine,IDProdotto,IDCliente,PrezzoTotale)
SELECT O.IDOrdine,O.IDProdotto, O.IDCliente, P.Prezzo*O.Quantità AS PrezzoTotale
FROM ORDINI As O
left join PRODOTTI AS P on O.IDProdotto=P.IDProdotto

select * from DETTAGLIO_ORDINI

--compilazione campi
INSERT INTO PRODOTTI (IDProdotto,NomeProdotto,Prezzo)
VALUES 
(1,'Tablet',300.00),
(2,'Mouse',20.00),
(3,'Tastiera',25.00),
(4,'Monitor',180.00),
(5,'HHD',90.00),
(6,'SSD',200.00),
(7,'RAM',100.00),
(8,'Router',80.00),
(9,'Webcam',45.00),
(10,'GPU',1250.00),
(11,'Trackpad',500.00),
(12,'Techmagazine',5.00),
(13,'Martech',50.00);

INSERT INTO ORDINI (IDOrdine,IDProdotto,Quantità)
VALUES
(1,2,10),
(2,6,2),
(3,5,3),
(4,1,1),
(5,9,1),
(6,4,2),
(7,11,6),
(8,10,2),
(9,3,3),
(10,3,1),
(11,2,1);

INSERT INTO CLIENTI (IDCliente,NomeCliente,EmailCliente)
VALUES
(1,'Antonio',null),
(2,'Battista','battista@mailmail.it'),
(3,'Maria','maria@posta.it'),
(4,'Franca','franca@lettere.it'),
(5,'Ettore',null),
(6,'Arianna','arianna@posta.it'),
(7,'Piero','piero@lavoro.it');


/*Seleziona tutti i prodotti con un prezzo superiore a 50 euro dalla tabella Prodotti*/
SELECT NomeProdotto,Prezzo
FROM PRODOTTI
WHERE Prezzo > 50.00;
/*Seleziona tutte le email dei clienti il cui nome inizia con la lettera 'A' dalla tabella Clienti*/
SELECT NomeCliente,EmailCliente
FROM CLIENTI
WHERE NomeCliente LIKE 'A%'
/*Seleziona tutti gli ordini con una quantità maggiore di 10 o con un importo totale inferiore a 100 euro dalla tabella Ordini*/
SELECT O.IDOrdine AS NumeroOrdine, O.Quantità AS Quantità, D.PrezzoTotale AS ImportoTotale
FROM ORDINI AS O
JOIN DETTAGLIO_ORDINI AS D
ON O.IDOrdine = D.IDOrdine
WHERE O.Quantità > 10 OR D.PrezzoTotale < 100
/*Seleziona tutti i prezzi dei prodotti il cui nome contiene la parola 'tech' indipendentemente dalla posizione nella tabella Prodotti*/
SELECT NomeProdotto,Prezzo
FROM PRODOTTI
WHERE NomeProdotto LIKE '%tech%'
/*Seleziona tutti i clienti che non hanno un indirizzo email nella tabella Clienti.*/
SELECT NomeCliente,EmailCliente
FROM CLIENTI
WHERE EmailCliente IS NULL
/*Seleziona tutti i prodotti il cui nome inizia con 'M' e termina con 'e' indipendentemente dalla lunghezza della parola nella tabella Prodotti*/
SELECT NomeProdotto,Prezzo
FROM PRODOTTI
WHERE NomeProdotto LIKE 'M%' AND NomeProdotto LIKE '%E'
