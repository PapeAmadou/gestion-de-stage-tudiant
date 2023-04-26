/*NDAO Pape Amadou*/
create Database tp3;
use tp3;

CREATE TABLE `Universite`(
`id_univ` VARCHAR(50) NOT NULL,
`adresse` VARCHAR(50) NOT NULL,
PRIMARY KEY(`id_univ`));

CREATE TABLE `Entreprise`(
`id_ent` VARCHAR(50) NOT NULL,
`adresse` VARCHAR(50) NOT NULL,
PRIMARY KEY(`id_ent`));

CREATE TABLE `Formation`(
`id_form` VARCHAR(50) NOT NULL,
`durée_min` int,
`durée_max` int,
`date_soutenance` DATE,
`stage_obligatoire`BOOL,
`id_univ` VARCHAR(50) NOT NULL,
PRIMARY KEY(`id_form`),
FOREIGN KEY(`id_univ`) REFERENCES `Universite`(`id_univ`));

CREATE TABLE `Responsable_universitaire`(
`id_Respuniv` INT,
`nom` VARCHAR(50) NOT NULL,
`prenom` VARCHAR(50) NOT NULL,
`id_univ` VARCHAR(50) NOT NULL,
PRIMARY KEY (`id_Respuniv`),
FOREIGN KEY (`id_univ`) REFERENCES `Universite`(`id_univ`));

CREATE TABLE `Responsable_entreprise`(
`id_Respent` INT,
`nom` VARCHAR(50) NOT NULL,
`prenom` VARCHAR(50) NOT NULL,
`id_ent` VARCHAR(50) NOT NULL,
PRIMARY KEY(`id_Respent`),
FOREIGN KEY(`id_ent`) REFERENCES `Entreprise`(`id_ent`));

CREATE TABLE `Stage`(
`sujet` VARCHAR(50) NOT NULL,
`durée`INT,
`rémunération` INT,
`id_Respent` INT,
`id_Respuniv` INT,
PRIMARY KEY(`sujet`),
FOREIGN KEY(`id_Respent`) REFERENCES`Responsable_entreprise`(`id_Respent`), 
FOREIGN KEY(`id_Respuniv`) REFERENCES `Responsable_universitaire`(`id_Respuniv`));

CREATE TABLE `Etudiant`(
`id_etudiant` INT,
`nom` VARCHAR(50) NOT NULL,
`prenom` VARCHAR(50) NOT NULL,
`date_naissance` DATE,
`année_univ` VARCHAR(50),
`id_form` VARCHAR(50) NOT NULL,
`id_univ` VARCHAR(50) NOT NULL,
`id_ent` VARCHAR(50) NOT NULL,
`sujet` VARCHAR(50) NOT NULL,
`id_Respent` INT,
`id_Respuniv` INT,
PRIMARY KEY(`id_etudiant`),
FOREIGN KEY(`id_form`) REFERENCES `Formation`(`id_form`),
FOREIGN KEY(`id_univ`) REFERENCES `Universite`(`id_univ`),
FOREIGN KEY(`id_ent`) REFERENCES `Entreprise`(`id_ent`),
FOREIGN KEY(`sujet`) REFERENCES `Stage`(`sujet`),
FOREIGN KEY(`id_Respent`) REFERENCES `Responsable_entreprise`(`id_Respent`),
FOREIGN KEY(`id_Respuniv`) REFERENCES `Responsable_universitaire`(`id_Respuniv`));

CREATE TABLE `propose`(
`sujet` VARCHAR(50) NOT NULL,
`id_ent` VARCHAR(50) NOT NULL,
PRIMARY KEY(`sujet`,`id_ent`),
FOREIGN KEY (`sujet`) REFERENCES `Stage`(`sujet`),
FOREIGN KEY(`id_ent`) REFERENCES `Entreprise`(`id_ent`));

INSERT INTO Entreprise(id_ent,adresse)
VALUES
('ATOS_worldline','France'),
('Amazon','France'),
('Toyota' ,'France'),
('Microsoft','France'),
('Riot Games', 'France');

INSERT INTO Universite(id_univ,adresse)
VALUES
('INSA HDF','France'),
('Sorbonne','France'),
('Evry', 'France'),
('Paris_Saclay', 'France'),
('INSA Lyon','France');

INSERT INTO Responsable_entreprise(id_Respent,nom,prenom,id_ent)
VALUES
('1','Gérard', 'Manvusa','ATOS_worldline'),
('2','Louis', 'Fine','Amazon','France'),
('3','Claire', 'Obscur','Toyota' ,'France'),
('4','john','Sanchez','Microsoft','France'),
('5','Fabien','Gomez','Riot Games', 'France');

INSERT INTO Responsable_universitaire(id_Respuniv,nom,prenom,id_univ)
VALUES
('1','Thilliez','Marie','INSA HDF'),
('2','Bourdeau','Anna','Sorbonne'),
('3','Redington','Raymond','Evry'),
('4','Cooper','Arold','Paris_Saclay'),
('5','Raxler','Donald','INSA Lyon');

INSERT INTO Stage(sujet,durée,rémunération,id_Respent,id_Respuniv)
VALUES
('sujet1','4','1000','1','2'),
('sujet2','4','1000','3','1'),
('sujet3','5','1500','2','3'),
('sujet4','6','1500','4','5'),
('sujet5','6','1700','5','4');

INSERT INTO Formation(id_form,durée_min,durée_max,date_soutenance,stage_obligatoire,id_univ)
VALUES
('Master2 TNSID','3','8','2020-06-10',TRUE,'INSA LYON'),
('Informatique et Cybersécurité','4','8','2020-06-20',TRUE,'INSA HDF'),
('Licence Maths','3','5','2020-07-06',FALSE,'Paris_Saclay'),
('Master2 MC','3','5','2020-06-20',TRUE,'Evry'),
('Licence Pro','4','6','2020-06-21',FALSE,'Sorbonne');

INSERT INTO Etudiant(id_etudiant,nom,prenom,date_naissance,année_univ,id_form,id_univ,id_ent,sujet,id_Respent,id_Respuniv)
VALUES
('10','Fugo','Louise','2000-01-01','2022/2023','Master2 TNSID','INSA LYON','ATOS_worldline','sujet1','1','2'),
('11','Morata','Alvaro','1999-02-12','2022/2023','Master2 TNSID','INSA LYON','ATOS_worldline','sujet2','3','1'),
('12','Gomez','Lisa','1999-02-13','2021/2022','Licence Maths','Paris_Saclay','Toyota','sujet3','2','3'),
('13','Morales','Diego','1988-02-14','2007/2008','Informatique et Cybersécurité','INSA HDF','Microsoft','sujet4','4','5'),
('14','Terry','John','1989-08-20','2007/2008','Informatique et Cybersécurité','INSA HDF','Microsoft','sujet5','5','4'),
('15','Sanchez','Pierre','2001-07-15','2019/2020','Master2 TNSID',	'INSA LYON','ATOS_worldline','sujet2','1','1'),
('16','Morin','Anna','2000-09-19','2019/2020','Master2 TNSID',	'INSA LYON','Amazon','sujet1','1','1'),
('17','Ndiaye','Cheikh','1999-04-15','2019/2020','Licence Maths','Paris_Saclay','Toyota','sujet3','2','3'),
('18','Niang','Mouhamed','1989-10-20','2008/2009','Informatique et Cybersécurité','INSA HDF','Microsoft','sujet5','5','4'),
('19','Thimbo','Abdoulaye','1992-11-04','2007/2008','Informatique et Cybersécurité','INSA HDF','Microsoft','sujet2','5','4'),
('20','Marley','Oscar','1992-12-05','2007/2008','Informatique et Cybersécurité','INSA HDF','Microsoft','sujet3','5','4'),
('21','Galavan','Théo','2000-11-07','2020/2021','Master2 MC','Evry','Riot Games','sujet1','3','2');

INSERT INTO propose(sujet,id_ent)
VALUES
('sujet1','ATOS_worldline'),
('sujet2','Microsoft'),
('sujet3','Toyota');


/*Requete SQL*/
/*Question a*/
SELECT Etudiant.nom,Etudiant.prenom
FROM Etudiant,Entreprise
WHERE Etudiant.id_ent=Entreprise.id_ent
AND Entreprise.id_ent='ATOS_worldline'
AND Etudiant.année_univ='2020/2021';

/*Question b*/
SELECT distinct Stage.sujet,Entreprise.adresse
FROM Stage,Entreprise,Etudiant,Responsable_universitaire
WHERE Etudiant.sujet=Stage.sujet
AND Etudiant.id_Respuniv=Responsable_universitaire.id_Respuniv
AND Etudiant.id_form='Master2 TNSID'
AND Etudiant.année_univ='2019/2020'
AND Responsable_universitaire.nom='Thilliez';

/*Question c*/
SELECT nom,prenom
FROM Etudiant,Stage
WHERE Etudiant.sujet=Stage.sujet
AND Etudiant.année_univ='2022/2023';

/*Question d*/
SELECT nom,prenom,Formation.id_form
FROM Etudiant,Formation
WHERE id_etudiant NOT IN (SELECT Etudiant.id_etudiant FROM Etudiant,Stage WHERE Etudiant.sujet=Stage.sujet )
AND Etudiant.année_univ='2022/2023';

/*Question e*/
SELECT nom,prenom,date_naissance
FROM Etudiant,Stage
WHERE Etudiant.sujet=Stage.sujet
AND Stage.rémunération=(SELECT max(rémunération) FROM Stage)
AND Etudiant.année_univ='2007/2008';

/*Question f*/
SELECT AVG(rémunération)
FROM Stage,Formation,Etudiant
WHERE Etudiant.id_form=Formation.id_form AND Etudiant.sujet=Stage.sujet
group by Formation.id_form;

/*Question g*/
SELECT COUNT(id_etudiant)
FROM Etudiant,Formation
WHERE Etudiant.id_form=Formation.id_form
group by Formation.id_form;

/*Question h*/
SELECT Etudiant.nom,Etudiant.prenom
From Etudiant,Entreprise
WHERE Etudiant.id_Respent=Responsable_entreprise.id_Respent
AND Etudiant.prenom=Responsable_entreprise.prenom;

/*Question i*/
/*SELECT Entreprise.id_ent
FROM Entreprise,Etudiant
WHERE */
/*Question j*/
SELECT AVG(durée)
FROM Stage;
/*on a exprimé la durée en mois*/
/*Question k*/
SELECT id_ent
FROM Entreprise
WHERE id_ent NOT IN (SELECT Etudiant.id_ent FROM Etudiant WHERE Etudiant.id_form='Informatique et Cybersécurité');
/*Dans notre base de donnée c'est la formation 'Informatique et Cybersécurité' qui représente la formation d'ingénieur*/

/*Question l*/
SELECT count(id_etudiant)
FROM Etudiant,propose
WHERE propose.id_ent=Etudiant.id_ent AND propose.sujet=Etudiant.sujet;

/*Question n*/
SELECT Stage.sujet,nom,prenom
FROM Stage,Etudiant
WHERE Stage.sujet=Etudiant.sujet
group by Etudiant.nom;

/*Question o*/
SELECT Entreprise.id_ent
FROM Entreprise,Etudiant,Formation
WHERE Etudiant.id_ent=Entreprise.id_ent
AND Etudiant.id_form=Formation.id_form
AND (Etudiant.année_univ='2020/2021' or Etudiant.année_univ='2021/2022')
group by Formation.id_form;

/*Question p */
SELECT nom,prenom
FROM Etudiant,Stage
WHERE Etudiant.sujet=Stage.sujet
AND Stage.rémunération=(SELECT max(rémunération) FROM Stage);

/*Question q */
SELECT Entreprise.id_ent
FROM Entreprise,Etudiant,Formation
WHERE Etudiant.id_ent=Entreprise.id_ent
order by(SELECT count(Etudiant.id_etudiant) FROM Etudiant WHERE Etudiant.id_form='Informatique et Cybersécurité') desc limit 10;

/*Question 4a */
CREATE VIEW Stagiaire AS
SELECT Etudiant.nom,Etudiant.prenom
FROM Etudiant,Stage
WHERE Etudiant.sujet=Stage.sujet 
AND Etudiant.année_univ='2022/2023';












 













 

 







