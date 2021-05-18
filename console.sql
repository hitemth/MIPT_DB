DROP SCHEMA IF EXISTS project CASCADE;
CREATE SCHEMA project;
DROP TABLE IF EXISTS project.match;
CREATE TABLE project.match (
    MatchID INT PRIMARY KEY UNIQUE,
    TeamHomeName VARCHAR(100),
    TeamAwayName VARCHAR(100),
    KitHomeID INT,
    KitAwayID INT,
    StadiumID INT,
    RefereeName VARCHAR(100),
    Date DATE,
    HomeScore INT,
    AwayScore INT
);

DROP TABLE IF EXISTS project.stadium;
CREATE TABLE project.stadium (
    StadiumID INT PRIMARY KEY UNIQUE,
    Capacity INT check(capacity>18000),
    Category CHAR check(category<'E')
);

DROP TABLE IF EXISTS project.stadiumName;
CREATE TABLE project.stadiumName (
    StadiumID INT,
    StadiumName VARCHAR(100) PRIMARY KEY,
    TeamID INT
);

DROP TABLE IF EXISTS project.team;
CREATE TABLE project.team (
    TeamName VARCHAR(100) PRIMARY KEY,
    KitHomeID INT UNIQUE,
    KitAwayID INT UNIQUE,
    StadiumID INT,
    League INT check (league<5)
);

DROP TABLE IF EXISTS project.kits;
CREATE TABLE project.kits (
    KitID INT PRIMARY KEY UNIQUE,
    ShirtColor VARCHAR(100),
    ShortsColor VARCHAR(100),
    Brand VARCHAR(100)
);

DROP TABLE IF EXISTS project.kitPrices;
CREATE TABLE project.kitPrices (
    Brand VARCHAR(100) PRIMARY KEY,
    Price REAL CHECK (price>0)
);

DROP TABLE IF EXISTS project.referee;
CREATE TABLE project.referee (
    RefereeName VARCHAR(100) PRIMARY KEY,
    RefereeCategory CHAR CHECK (RefereeCategory < 'E')
);

DROP TABLE IF EXISTS project.categories;
CREATE TABLE project.categories (
    RefereeCategory CHAR PRIMARY KEY,
    IsMain BOOLEAN NOT NULL
);

INSERT INTO project.match (MatchID,TeamHomeName,TeamAwayName,KitHomeID,KitAwayID,StadiumID,RefereeName,Date,HomeScore,AwayScore) VALUES (1,'Brighton','West Ham',1,4,1,'Martin Atkinsson','2020-12-30', 3,1);
INSERT INTO project.match (MatchID,TeamHomeName,TeamAwayName,KitHomeID,KitAwayID,StadiumID,RefereeName,Date,HomeScore,AwayScore) VALUES (2,'Tottenham','Man United',6,7,2,'Mike Dean','2020-12-30', 1,1);
INSERT INTO project.match (MatchID,TeamHomeName,TeamAwayName,KitHomeID,KitAwayID,StadiumID,RefereeName,Date,HomeScore,AwayScore) VALUES (3,'Brighton','Tottenham',1,6,1,'Mike Dean','2020-12-20', 0,3);
INSERT INTO project.match (MatchID,TeamHomeName,TeamAwayName,KitHomeID,KitAwayID,StadiumID,RefereeName,Date,HomeScore,AwayScore) VALUES (4,'West Ham','Man United',3,8,2,'Michael Oliver','2020-12-20', 0,0);
INSERT INTO project.match (MatchID,TeamHomeName,TeamAwayName,KitHomeID,KitAwayID,StadiumID,RefereeName,Date,HomeScore,AwayScore) VALUES (5,'Man United','Tottenham',7,6,3,'Paul Tierney','2020-12-10', 6,2);

INSERT INTO project.stadium (StadiumID,Capacity,Category) VALUES (1, 20000, 'D');
INSERT INTO project.stadium (StadiumID,Capacity,Category) VALUES (2, 50000, 'B');
INSERT INTO project.stadium (StadiumID,Capacity,Category) VALUES (3, 70000, 'A');
INSERT INTO project.stadium (StadiumID,Capacity,Category) VALUES (4, 25000, 'D');
INSERT INTO project.stadium (StadiumID,Capacity,Category) VALUES (5, 35000, 'C');

INSERT INTO project.stadiumName(StadiumID, StadiumName,TeamID) VALUES (1, 'Amex', 1);
INSERT INTO project.stadiumName(StadiumID, StadiumName,TeamID) VALUES (2, 'London', 2);
INSERT INTO project.stadiumName(StadiumID, StadiumName,TeamID) VALUES (2, 'Olympic stadium', 3);
INSERT INTO project.stadiumName(StadiumID, StadiumName,TeamID) VALUES (3, 'Old Trafford', 4);
INSERT INTO project.stadiumName(StadiumID, StadiumName,TeamID) VALUES (4, 'Villa park', 5);

INSERT INTO project.kitPrices (Brand, Price) VALUES ('Adidas', 7000);
INSERT INTO project.kitPrices (Brand, Price) VALUES ('Nike', 8000);
INSERT INTO project.kitPrices (Brand, Price) VALUES ('Kappa', 6000);
INSERT INTO project.kitPrices (Brand, Price) VALUES ('Umbro', 5000);
INSERT INTO project.kitPrices (Brand, Price) VALUES ('New Balance', 7000);

INSERT INTO project.referee(RefereeName, RefereeCategory) VALUES ('Martin Atkinsson', 'A');
INSERT INTO project.referee(RefereeName, RefereeCategory) VALUES ('Michael Oliver', 'C');
INSERT INTO project.referee(RefereeName, RefereeCategory) VALUES ('Mike Dean', 'A');
INSERT INTO project.referee(RefereeName, RefereeCategory) VALUES ('Paul Tierney', 'B');
INSERT INTO project.referee(RefereeName, RefereeCategory) VALUES ('Lee Mason', 'D');

INSERT INTO project.categories(RefereeCategory, IsMain) VALUES ('A', true);
INSERT INTO project.categories(RefereeCategory, IsMain) VALUES ('B', true);
INSERT INTO project.categories(RefereeCategory, IsMain) VALUES ('C', false);
INSERT INTO project.categories(RefereeCategory, IsMain) VALUES ('D', false);
INSERT INTO project.categories(RefereeCategory, IsMain) VALUES ('E', false);

COPY project.team FROM 'D://teams.csv' DELIMITER ';' CSV;
COPY project.kits FROM 'D://kits.csv' DELIMITER ';' CSV;

SELECT * FROM project.match WHERE homescore > 0;
UPDATE project.stadium SET capacity = 28000 WHERE StadiumID = 4;
UPDATE project.stadiumName SET StadiumName = 'Tottenham'  WHERE TeamID = 3;
SELECT * FROM project.team WHERE league = 1;
DELETE FROM project.kitPrices WHERE brand = 'Kappa';
SELECT * FROM project.kits WHERE brand='Adidas' and shirtcolor='Red';
UPDATE project.referee SET RefereeCategory = 'B' WHERE RefereeName='Mike Dean';
SELECT * FROM project.categories WHERE ismain = true;

/*ожидаем увидеть команды, которые забили более 2 голов, играя дома*/
SELECT TeamHomeName,sum(homescore) FROM project.match GROUP BY TeamHomeName HAVING sum(homescore)>2;
/*ожидаем увидеть список стадионов в порядке возрастания вместимости*/
SELECT * FROM project.stadium ORDER BY capacity;
/*ожидаем увидеть список брендов, выпускающих форму, с указанием того, сколько различных форм они выпустили*/
SELECT brand, count(KitId) FROM project.kits GROUP BY brand HAVING count(KitId)>0;
/*ожидаем увидеть список брендов в порядке возрастания стоимости формы*/
SELECT * FROM project.kitprices ORDER BY price;
/*ожидаем увидеть список стадионов, на которых гостевые команды в сумме забили больше одного гола*/
SELECT StadiumID,sum(awayscore) FROM project.match GROUP BY StadiumID HAVING sum(awayscore)>1;

CREATE INDEX TeamID ON project.team USING HASH (TeamName);
CREATE INDEX BrandID ON project.kitprices USING HASH (brand);
CREATE INDEX RefereeID ON project.referee USING HASH (RefereeName);
CREATE INDEX CategoryID ON project.categories USING HASH (refereecategory);
CREATE INDEX StadiumNameID ON project.stadiumName USING HASH (stadiumname);
/*в остальных таблицах уже есть столбцы ID, которые могут быть использованы как индекс*/
