-- Creazione DB
CREATE DATABASE DBVideoGamesStores

-- Creazione delle tabelle
CREATE TABLE Store (
IDStore INT,
CodStore INT,
Indirizzo varchar(255),
NumeroTelefono varchar(15)
CONSTRAINT PK_Store PRIMARY KEY (IDStore)
);

CREATE TABLE Dipendenti (
IDDipendente INT,
CF varchar(16) UNIQUE,
Nome varchar (50),
TitoloStudio varchar(50),
InfoContatto varchar(250),
CONSTRAINT PK_Dipendenti PRIMARY KEY (IDDipendente)
);

CREATE TABLE Storico (
IDStorico INT,
IDDipendente INT,
IDStore INT,
DataInizio DATE,
DataFine DATE,
Posizione varchar(50),
CONSTRAINT PK_Storico PRIMARY KEY (IDStorico),
CONSTRAINT FK_StoricoDipendenti FOREIGN KEY (IDDipendente) REFERENCES Dipendenti(IDDipendente),
CONSTRAINT FK_StoricoStore FOREIGN KEY (IDStore) REFERENCES Store(IDStore)
);

CREATE TABLE VideoGame (
IDGioco INT,
Titolo varchar (100),
Sviluppatore varchar (100),
DataRilascio date,
CostoAttuale decimal(10,2),
Genere varchar(50),
RemakeID INT
constraint PK_VideoGame Primary key (IDGioco)
);

CREATE TABLE Posizioni (
IDPosizione INT,
IDGioco INT,
IDStore INT,
Settore varchar(50),
PosizioneSettore INT,
CopieDisponibili INT,
constraint PK_Posizioni primary key (IDPosizione, IDGioco),
CONSTRAINT FK_PosizioniGioco FOREIGN KEY (IDGioco) REFERENCES VideoGame(IDGioco),
CONSTRAINT FK_PosizioniStore FOREIGN KEY (IDStore) REFERENCES Store(IDStore)
);

---inserimenti di prova

INSERT INTO Store (IDStore,CodStore,Indirizzo,NumeroTelefono) VALUES
(1,0001,'Via Appia Nuova, 123, 00183 Roma, Italia','+390612345678'),
(2,0002,'Corso Buenos Aires, 789, 20124 Milano, Italia', '+390234567890'),
(3,0003,'Via Toledo, 321, 80134 Napoli, Italia','+390812345678'),
(4,0004,'Via dei Calzaiuoli, 456, 50123 Firenze, Italia', '+390556789012'),
(5,0005,'Via Maqueda, 123, 90133 Palermo, Italia', '+390913456789 ');

INSERT INTO Dipendenti (IDDipendente,CF,Nome,TitoloStudio,InfoContatto) VALUES
(1,'RSSMRA85M01H501X','Marco Rossi','Dottorato in Medicina','marcorossi85@gmail.com'),
(2,'BNCLEN91M45G273Y','Elena Bianchi','Laurea Magistrale in Economia','elebianchi@mail.it'),
(3,'RSSLCU88L02A662Z','Luca Russo','Laurea Triennale in Scienze Politiche','luca.russo@hotmail.it'),
(4,'SPSSRA93D46I987C','Sara Esposito','Master in Scienze della Educazione','esposara93@gmail.com'),
(5,'MRNFCO87R11Z345K','Francesco Marino','Diploma di Ragioneria','francesco87marino@yahoo.com'),
(6,'CNTGLI89C53H789W','Giulia Conti','Diploma di Liceo Classico','lacontessa89@msn.com'),
(7,'MNCNDR75M03L220Q','Andrea Mancini','Perito Agrario','ilmancio75@gmail.com'),
(8,'DLCCHR82E15F124U','Chiara De Luca','Perito Aerospaziale','chiara_deluca@yahoo.it'),
(9,'GRCALS94P20B567T','Alessio Greco','Laurea in Ingegneria Gestionale','alessio.greco.94@gmail.com'),
(10,'FRRMNT88R41D890E','Martina Ferrara','Diploma di Liceo Scientifico','marty_ferrara@mail.com');

INSERT INTO Storico (IDStorico,IDDipendente,IDStore,DataInizio,DataFine,Posizione) VALUES
(1, 1, 1, '2022-01-01', NULL, 'Direttore'),
(2, 2, 2, '2022-07-21', NULL, 'Direttore'),
(3, 3, 3, '2021-08-11', NULL, 'Direttore'),
(4, 4, 4, '2022-12-01', NULL, 'Direttore'),
(5, 5, 5, '2022-10-21', NULL, 'Direttore'),
(6, 6, 1, '2023-02-21', NULL, 'Commesso'),
(7, 7, 2, '2024-01-02', NULL, 'Commesso'),
(8, 8, 3, '2022-09-27', NULL, 'Commesso'),
(9, 9, 4, '2023-08-16', NULL, 'Commesso'),
(10, 10, 5, '2024-01-07', NULL, 'Commesso');

INSERT INTO VideoGame (IDGioco,Titolo,Sviluppatore,DataRilascio,CostoAttuale,Genere,RemakeID) VALUES
(1,'Super Adventure Quest','Pixel Studios','2022-05-15',49.99,'Avventura',NULL),
(2,'Cyber Nexus','TechWare Inc.','2021-09-28',59.99,'Sci-Fi FPS',NULL),
(3,'Fantasy Realm Online','Mystic Games','2023-02-10',39.99,'MMORPG',NULL),
(4,'Street Racer Evolution','Speedster Studios','2020-07-12',44.99,'Racing',NULL),
(5,'Apex Legends: Legacy','Respawn Entertainment','2021-05-04',00.00,'Battle Royale',NULL),
(6,'Classic RPG Revival','RetroSoft',' 2023-01-30',29.99,'RPG',NULL),
(7,'Super Adventure Quest II: Remastered','Pixel Studios','2024-03-15',59.99,'Avventura (Remake)',1),
(8,'Cyber Nexus Redux','TechWare Inc.','2022-12-05',49.99,'Sci-Fi FPS (Remake)',2),
(9,'Epic Strategy Conquest','Grand Tactics Games','2023-08-20',39.99,'Strategia',NULL),
(10,'Mystical Adventure: The Dark Legacy','Mystic Games','2021-11-18',54.99,'Avventura RPG',NULL);

INSERT INTO Posizioni (IDPosizione,IDGioco,IDStore,Settore,PosizioneSettore,CopieDisponibili) VALUES
(1,1,1,'SezioneAvventura',1,11),
(2,2,2,'SezioneSci-FI',2,4),
(3,3,3,'SezioneRPG',3,7),
(4,4,4,'SezioneSport',1,10),
(5,5,5,'SezioneBR',2,5),
(6,6,1,'SezioneRPG',3,8),
(7,7,2,'SezioneAvventura',1,13),
(8,8,3,'SezioneSci-FI',2,2),
(9,9,4,'SezioneRPG',3,9),
(10,10,5,'SezioneRPG',3,3);
