DROP PROCEDURE IF EXISTS addUtilisateur;
DROP FUNCTION IF EXISTS existeUtilisateur;
DROP PROCEDURE IF EXISTS deleteUtilisateur;

delimiter $
CREATE PROCEDURE addUtilisateur(Nom_ VARCHAR(50), Prenom_ VARCHAR(50), Naissance_ VARCHAR(10), mdp_ VARCHAR(50), email_ VARCHAR(50), Adresse_ VARCHAR(100), CodePostal_ CHAR(6), Ville_ VARCHAR(100), Telephone_ CHAR(14))
BEGIN
   INSERT INTO utilisateur (Administre, Nom, Prenom, Naissance, Adresse, CodePostal, Ville, Telephone, mdp) VALUES (NULL, Nom_, Prenom_, Naissance_, Adresse_, CodePostal_, Ville_, Telephone_, mdp_);
END $

delimiter $
CREATE PROCEDURE deleteUtilisateur(nom_ VARCHAR(50), mdp_ VARCHAR(50), email_ VARCHAR(50))
BEGIN
    if ((SELECT mdp FROM Utilisateur C WHERE (C.nom=nom_ and C.email=email_))=mdp_) THEN
    DELETE FROM Utilisateur WHERE (nom_= Utilisateur.nom and email_=Utilisateur.email);
    END IF;
END $



delimiter $$
CREATE FUNCTION existeUtilisateur(nom_ VARCHAR(50), email_ VARCHAR(50)) RETURNS BOOLEAN
READS SQL DATA
DETERMINISTIC
BEGIN
   if ((SELECT COUNT(*) FROM Utilisateur C WHERE (C.nom=nom_ and C.email=email_))<>0) THEN
    RETURN TRUE;
    END IF;
    RETURN FALSE;
END $$



