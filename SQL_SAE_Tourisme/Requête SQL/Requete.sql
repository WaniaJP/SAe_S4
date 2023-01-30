SELECT A.Nom_Fr, S.Administre, S.Nom, S.Prenom 
FROM REPONSE_SONDAGE R, ALIMENTS A, UTILISATEUR S
WHERE R.Administre = S.Administre AND R.Alim_Code = A.Alim_Code AND A.Nom_Fr LIKE '%bio%';

SELECT A.Nom_Fr, S.Administre, S.Nom, S.Prenom 
FROM REPONSE_SONDAGE R, ALIMENTS A, UTILISATEUR S
WHERE R.Administre = S.Administre AND R.Alim_Code = A.Alim_Code AND A.Nom_Fr LIKE '%vegan%';

SELECT SS.Nom_Fr, S.Administre, S.Nom, S.Prenom 
FROM REPONSE_SONDAGE R, ALIMENTS A, UTILISATEUR S, SSSS_GROUPE_ALIMENTS SS
WHERE A.SSSS_Grp_Code = SS_Grp_Code AND R.Administre = S.Administre AND R.Alim_Code = A.Alim_Code AND A.Nom_Fr LIKE '%casher%';

SELECT SS.Nom_Fr, S.Administre, S.Nom, S.Prenom 
FROM REPONSE_SONDAGE R, ALIMENTS A, UTILISATEUR S, SSSS_GROUPE_ALIMENTS SS
WHERE A.SSSS_Grp_Code = SS_Grp_Code AND R.Administre = S.Administre AND R.Alim_Code = A.Alim_Code AND A.Nom_Fr LIKE '%halal%';

SELECT A.Grp_Code, G.Nom_FR, count(A.Grp_Code)
FROM ALIMENTS A, GROUPE_ALIMENTS G
WHERE A.Grp_Code = G.Grp_Code
GROUP BY A.Grp_Code, G.Nom_FR
ORDER BY 3 DESC;


-- PROCEDURE TEST

CREATE OR REPLACE FUNCTION BILAN_SANTE_INDI(IdP integer) RETURN NUMBER IS
  Vtaux Number;
  BEGIN
  SELECT sum(D.Energie_Reglement_UE_kcal100g) INTO Vtaux FROM DONNEES_SANTE D, REPONSE_SONDAGE R, ALIMENTS  A
              WHERE R.Administre = IdP AND D.Alim_Code = A.Alim_Code AND R.Alim_Code = D.Alim_Code;
  RETURN Vtaux;
END;
/

CREATE OR REPLACE PROCEDURE BILAN_SANTE IS
    Valeur Number;
BEGIN 
FOR tuple IN (SELECT Administre, Nom, Prenom FROM SONDAGE) LOOP
  SELECT BILAN_SANTE_INDI(tuple.Administre) INTO Valeur FROM DUAL;
  DBMS_OUTPUT.PUT_LINE(tuple.Nom || ' ' || tuple.Prenom || ' ' || Valeur);
END LOOP;
END;
/

EXEC BILAN_SANTE;

------------- FIN PROCEDURE TEST

-- PROCEDURE TEST SUCRE

CREATE OR REPLACE FUNCTION BILAN_SANTE_INDI(IdP integer) RETURN NUMBER IS
  Vtaux Number;
  BEGIN
  SELECT (count(D.Alim_Code)/10)*100 INTO Vtaux FROM DONNEES_SANTE D, REPONSE_SONDAGE R, ALIMENTS  A
              WHERE R.Administre = IdP AND D.Alim_Code = A.Alim_Code AND R.Alim_Code = D.Alim_Code
              AND (D.Glucides_g100g IS NOT NULL OR D.Sucres_g100g IS NOT NULL OR D.Fructose_g100g IS NOT NULL OR D.Galactose_g100g IS NOT NULL OR D.Glucose_g100g IS NOT NULL OR D.Lactose_g100g IS NOT NULL OR D.Maltose_g100g IS NOT NULL OR D.Saccharose_g100g IS NOT NULL);
  RETURN Vtaux;
END;
/

CREATE OR REPLACE PROCEDURE BILAN_SANTE IS
    Valeur Number;
BEGIN 
  FOR tuple IN (SELECT Administre, Nom, Prenom FROM SONDAGE) LOOP
    SELECT BILAN_SANTE_INDI(tuple.Administre) INTO Valeur FROM DUAL;
    DBMS_OUTPUT.PUT_LINE(tuple.Nom || ' ' || tuple.Prenom || ' ' || Valeur);
END LOOP;
END;
/

EXEC BILAN_SANTE;

------------- FIN PROCEDURE TEST

-- PROCEDURE TEST FIBRES

CREATE OR REPLACE FUNCTION BILAN_SANTE_INDI(IdP integer) RETURN NUMBER IS
  Vtaux Number;
  BEGIN
  SELECT (count(D.Alim_Code)/10)*100 INTO Vtaux FROM DONNEES_SANTE D, REPONSE_SONDAGE R, ALIMENTS  A
              WHERE R.Administre = IdP AND D.Alim_Code = A.Alim_Code AND R.Alim_Code = D.Alim_Code
              AND Fibres_alimentaires_g100g IS NOT NULL;  
  RETURN Vtaux;
END;
/

CREATE OR REPLACE PROCEDURE BILAN_SANTE IS
    Valeur Number;
BEGIN 
  FOR tuple IN (SELECT Administre, Nom, Prenom FROM SONDAGE) LOOP
    SELECT BILAN_SANTE_INDI(tuple.Administre) INTO Valeur FROM DUAL;
    DBMS_OUTPUT.PUT_LINE(tuple.Nom || ' ' || tuple.Prenom || ' ' || Valeur);
END LOOP;
END;
/

EXEC BILAN_SANTE;

------------- FIN PROCEDURE TEST
