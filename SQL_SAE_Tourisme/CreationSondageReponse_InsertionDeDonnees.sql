CREATE DATABASE IF NOT EXISTS  sondage;
USE sondage;

SET FOREIGN_KEY_CHECKS=0;

DROP TABLE  IF EXISTS UTILISATEUR;
DROP TABLE  IF EXISTS REPONSE_SONDAGE;



CREATE TABLE UTILISATEUR (
	Administre INTEGER,
    Nom VARCHAR(50),
    Prenom VARCHAR(50),
    Naissance VARCHAR(10),
    Adresse VARCHAR(100),
    CodePostal CHAR(6),
    Ville VARCHAR(100),
    Telephone CHAR(14)
);

CREATE TABLE REPONSE_SONDAGE (
	Administre INTEGER,
	Alim_Code INTEGER
);

ALTER TABLE UTILISATEUR ADD CONSTRAINT PK_UTILISATEUR PRIMARY KEY(Administre);
ALTER TABLE REPONSE_SONDAGE ADD CONSTRAINT PK_REPONSE_SONDAGE PRIMARY KEY(Administre, Alim_Code);

ALTER TABLE REPONSE_SONDAGE ADD CONSTRAINT FK_REPONSE_SONDAGE_ALIMENTS FOREIGN KEY(Alim_Code) REFERENCES ALIMENTS(Alim_Code) ON DELETE CASCADE;
ALTER TABLE REPONSE_SONDAGE ADD CONSTRAINT FK_REPONSE_SONDAGE_UTILISATEUR FOREIGN KEY(Administre) REFERENCES UTILISATEUR(Administre) ON DELETE CASCADE;

INSERT INTO UTILISATEUR (Administre, Nom, Prenom, Naissance, Adresse, CodePostal, Ville, Telephone)
	SELECT DISTINCT Administre, Nom, Prenom, Naissance, Adresse, Code_Postal, Ville, Tel FROM SONDAGEBRUT;
	
INSERT INTO REPONSE_SONDAGE (Administre, Alim_Code)
	SELECT DISTINCT Administre, Aliment1 FROM SONDAGEBRUT;
	
INSERT INTO REPONSE_SONDAGE (Administre, Alim_Code)
	SELECT DISTINCT Administre, Aliment2 FROM SONDAGEBRUT;
	
INSERT INTO REPONSE_SONDAGE (Administre, Alim_Code)
	SELECT DISTINCT Administre, Aliment3 FROM SONDAGEBRUT;

INSERT INTO REPONSE_SONDAGE (Administre, Alim_Code)
	SELECT DISTINCT Administre, Aliment4 FROM SONDAGEBRUT;
	
INSERT INTO REPONSE_SONDAGE (Administre, Alim_Code)
	SELECT DISTINCT Administre, Aliment5 FROM SONDAGEBRUT;

INSERT INTO REPONSE_SONDAGE (Administre, Alim_Code)
	SELECT DISTINCT Administre, Aliment6 FROM SONDAGEBRUT;

INSERT INTO REPONSE_SONDAGE (Administre, Alim_Code)
	SELECT DISTINCT Administre, Aliment7 FROM SONDAGEBRUT;
	
INSERT INTO REPONSE_SONDAGE (Administre, Alim_Code)
	SELECT DISTINCT Administre, Aliment8 FROM SONDAGEBRUT;
	
INSERT INTO REPONSE_SONDAGE (Administre, Alim_Code)
	SELECT DISTINCT Administre, Aliment9 FROM SONDAGEBRUT;
	
INSERT INTO REPONSE_SONDAGE (Administre, Alim_Code)
	SELECT DISTINCT Administre, Aliment10 FROM SONDAGEBRUT;