<<<<<<< HEAD
DROP TABLE IF EXISTS Client;

CREATE TABLE Client(
   idClient INT AUTO_INCREMENT,
   nom VARCHAR(50) NOT NULL,
   email VARCHAR(50) NOT NULL,
   mdp VARCHAR(50) NOT NULL,
   CONSTRAINT PK_Client PRIMARY KEY(idClient),
   CONSTRAINT U_PseudoEmail UNIQUE(nom, email)
);

DROP PROCEDURE IF EXISTS addClient;
DROP FUNCTION IF EXISTS existeUtilisateur;
DROP PROCEDURE IF EXISTS deleteClient;

delimiter $
CREATE PROCEDURE addClient(nom_ VARCHAR(50), mdp_ VARCHAR(50), email_ VARCHAR(50))
BEGIN
   INSERT INTO Client (idClient, nom, mdp) VALUES (NULL, nom_, mdp_, email_);
END $

delimiter $
CREATE PROCEDURE deleteClient(nom_ VARCHAR(50), mdp_ VARCHAR(50), email_ VARCHAR(50))
BEGIN
    if ((SELECT mdp FROM Client C WHERE (C.nom=nom_ and C.email=email_))=mdp_) THEN
    DELETE FROM Client WHERE (nom_= Client.nom and email_=Client.email);
    END IF;
END $



delimiter $$
CREATE FUNCTION existeUtilisateur(nom_ VARCHAR(50), email_ VARCHAR(50)) RETURNS BOOLEAN
BEGIN
   if ((SELECT COUNT(*) FROM Client C WHERE (C.nom=nom_ and C.email=email_))<>0) THEN
    RETURN TRUE;
    END IF;
    RETURN FALSE;
END $$



=======
DROP TABLE IF EXISTS Client;

CREATE TABLE Client(
   idClient INT AUTO_INCREMENT,
   nom VARCHAR(50) NOT NULL,
   email VARCHAR(50) NOT NULL,
   mdp VARCHAR(50) NOT NULL,
   CONSTRAINT PK_Client PRIMARY KEY(idClient),
   CONSTRAINT U_PseudoEmail UNIQUE(nom, email)
);

DROP PROCEDURE IF EXISTS addClient;
DROP FUNCTION IF EXISTS existeUtilisateur;
DROP PROCEDURE IF EXISTS deleteClient;

delimiter $
CREATE PROCEDURE addClient(nom_ VARCHAR(50), mdp_ VARCHAR(50), email_ VARCHAR(50))
BEGIN
   INSERT INTO Client (idClient, nom, mdp) VALUES (NULL, nom_, mdp_, email_);
END $

delimiter $
CREATE PROCEDURE deleteClient(nom_ VARCHAR(50), mdp_ VARCHAR(50), email_ VARCHAR(50))
BEGIN
    if ((SELECT mdp FROM Client C WHERE (C.nom=nom_ and C.email=email_))=mdp_) THEN
    DELETE FROM Client WHERE (nom_= Client.nom and email_=Client.email);
    END IF;
END $



delimiter $$
CREATE FUNCTION existeUtilisateur(nom_ VARCHAR(50), email_ VARCHAR(50)) RETURNS BOOLEAN
BEGIN
   if ((SELECT COUNT(*) FROM Client C WHERE (C.nom=nom_ and C.email=email_))<>0) THEN
    RETURN TRUE;
    END IF;
    RETURN FALSE;
END $$



>>>>>>> c85260d3a9928a4a9a0afa6552115170af8f3eeb
