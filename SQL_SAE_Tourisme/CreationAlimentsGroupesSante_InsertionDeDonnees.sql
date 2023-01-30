CREATE DATABASE IF NOT EXISTS  sondage;
USE sondage;

DROP TABLE  IF EXISTS ALIMENTS;
DROP TABLE  IF EXISTS GROUPE_ALIMENTS  ;
DROP TABLE  IF EXISTS SS_GROUPE_ALIMENTS  ;
DROP TABLE  IF EXISTS SSSS_GROUPE_ALIMENTS  ;
DROP TABLE  IF EXISTS DONNEES_SANTE   ;

CREATE TABLE ALIMENTS (
	Alim_Code INTEGER,
	Nom_FR VARCHAR(300),
	Nom_Scientifique VARCHAR(300),
	Grp_Code INTEGER,
	SS_Grp_Code INTEGER,
	SSSS_Grp_Code INTEGER
);


CREATE TABLE GROUPE_ALIMENTS (
	Grp_Code INTEGER,
	Nom_FR VARCHAR(300)
);

CREATE TABLE SS_GROUPE_ALIMENTS (
	SS_Grp_Code INTEGER,
	Nom_FR VARCHAR(300)
);

CREATE TABLE SSSS_GROUPE_ALIMENTS (
	SSSS_Grp_Code INTEGER,
	Nom_FR VARCHAR(300)
);

CREATE TABLE DONNEES_SANTE (
	Alim_Code INTEGER,
	Energie_Reglement_UE_kJ100g DECIMAL(6, 2),
    Energie_Reglement_UE_kcal100g DECIMAL(6, 3),
    Energie_NxfacteurJones_kJ100g DECIMAL(6, 2),
    Energie_NxfacteurJones_kca100g DECIMAL(6, 3),
    Eau_g100g DECIMAL(6, 3),
    Proteines_NxfacteurJones_g100g DECIMAL(6, 4),
    Proteines_Nx625_g100g DECIMAL(6, 4),
    Glucides_g100g DECIMAL(7, 5),
    Lipides_g100g DECIMAL(7, 4),
    Sucres_g100g DECIMAL(6, 4),
    Fructose_g100g DECIMAL(6, 4),
    Galactose_g100g DECIMAL(5, 4),
    Glucose_g100g DECIMAL(6, 4),
    Lactose_g100g DECIMAL(6, 4),
    Maltose_g100g DECIMAL(6, 4),
    Saccharose_g100g DECIMAL(7, 5),
    Amidon_g100g DECIMAL(7, 5),
    Fibres_alimentaires_g100g DECIMAL(7, 5),
    Polyols_totaux_g100g DECIMAL(7, 5),
    Cendres_g100g DECIMAL(8, 6),
    Alcool_g100g DECIMAL(6, 4),
    Acides_organiques_g100g DECIMAL(7, 6),
    AG_satures_g100g DECIMAL(7, 5),
    AG_monoinsatures_g100g DECIMAL(7, 5),
    AG_polyinsatures_g100g DECIMAL(7, 5),
    AG_butyrique_g100g DECIMAL(7, 6),
    AG_capro_que_g100g DECIMAL(6, 5),
    AG_caprylique_g100g DECIMAL(6, 5),
    AG_caprique_g100g DECIMAL(7, 6),
    AG_laurique_g100g DECIMAL(7, 5),
    AG_myristique_g100g DECIMAL(7, 5),
    AG_palmitique_g100g DECIMAL(7, 5),
    AG_stearique_g100g DECIMAL(7, 5),
    AG_oleique_g100g DECIMAL(7, 5),
    AG_linoleique_g100g DECIMAL(7, 5),
    AG_alphanulllinolenique_g100g DECIMAL(7, 5),
    AG_arachidonique_g100g DECIMAL(7, 6),
    AG_EPA_g100g DECIMAL(8, 6),
    AG_DHA_g100g DECIMAL(8, 6),
    Cholesterol_mg100g DECIMAL(8, 4),
    Sel_chlorure_de_sodium_g100g DECIMAL(8, 6),
    Calcium_mg100g DECIMAL(7, 3),
    Chlorure_mg100g DECIMAL(7, 2),
    Cuivre_mg100g DECIMAL(7, 5),
    Fer_mg100g DECIMAL(8, 5),
    Iode_microg100g DECIMAL(9, 3),
    Magnesium_mg100g DECIMAL(7, 3),
    Manganese_mg100g DECIMAL(8, 5),
    Phosphore_mg100g DECIMAL(8, 4),
    Potassium_mg100g DECIMAL(8, 3),
    Selenium_microg100g DECIMAL(6, 3),
    Sodium_mg100g DECIMAL(7, 2),
    Zinc_mg100g DECIMAL(6, 4),
    Retinol_microg100g DECIMAL(8, 3),
    BetaCarotene_microg100g DECIMAL(11, 5),
    Vitamine_D_microg100g DECIMAL(8, 5),
    Vitamine_E_mg100g DECIMAL(7, 4),
    Vitamine_K1_microg100g DECIMAL(7, 3),
    Vitamine_K2_microg100g DECIMAL(5, 2),
    Vitamine_C_mg100g DECIMAL(8, 4),
    Vitamine_B1_Thia_mg100g DECIMAL(7, 5),
    Vitamine_B2_Ribo_mg100g DECIMAL(5, 4),
    Vitamine_B3_PP_Nia_mg100g DECIMAL(7, 4),
    Vitamine_B5_AcidePan_mg100g DECIMAL(7, 4)
);

ALTER TABLE ALIMENTS ADD CONSTRAINT PK_ALIMENTS PRIMARY KEY(Alim_code);
ALTER TABLE GROUPE_ALIMENTS ADD CONSTRAINT PK_GROUPE_ALIMENTS PRIMARY KEY(Grp_code);
ALTER TABLE SS_GROUPE_ALIMENTS ADD CONSTRAINT PK_SS_GROUPE_ALIMENTS PRIMARY KEY(SS_Grp_code);
ALTER TABLE SSSS_GROUPE_ALIMENTS ADD CONSTRAINT PK_SSSS_GROUPE_ALIMENTS PRIMARY KEY(SSSS_Grp_code);
ALTER TABLE DONNEES_SANTE ADD CONSTRAINT PK_DONNEES_SANTE PRIMARY KEY(Alim_Code);

ALTER TABLE ALIMENTS ADD CONSTRAINT FK_ALIMENTS_GROUPE FOREIGN KEY(Grp_Code) REFERENCES GROUPE_ALIMENTS(Grp_Code) ON DELETE CASCADE;
ALTER TABLE ALIMENTS ADD CONSTRAINT FK_ALIMENTS_SS_GROUPE FOREIGN KEY(SS_Grp_Code) REFERENCES SS_GROUPE_ALIMENTS(SS_Grp_Code) ON DELETE CASCADE;
ALTER TABLE ALIMENTS ADD CONSTRAINT FK_ALIMENTS_SSSS_GROUPE FOREIGN KEY(SSSS_Grp_Code) REFERENCES SSSS_GROUPE_ALIMENTS(SSSS_Grp_Code) ON DELETE CASCADE;

ALTER TABLE DONNEES_SANTE ADD CONSTRAINT FK_DONNEES_SANTE_ALIMENTS FOREIGN KEY(Alim_Code) REFERENCES ALIMENTS(Alim_Code) ON DELETE CASCADE;

INSERT INTO GROUPE_ALIMENTS (Grp_Code, Nom_Fr) SELECT DISTINCT alim_grp_code, alim_grp_nom_fr FROM ALIMENTSBRUT;
INSERT INTO SS_GROUPE_ALIMENTS (SS_Grp_Code, Nom_Fr) SELECT DISTINCT alim_ssgrp_code, alim_ssgrp_nom_fr FROM ALIMENTSBRUT;
INSERT INTO SSSS_GROUPE_ALIMENTS (SSSS_Grp_Code, Nom_Fr) SELECT DISTINCT alim_ssssgrp_code, alim_ssssgrp_nom_fr FROM ALIMENTSBRUT;

INSERT INTO ALIMENTS (Alim_Code, Nom_FR, Nom_Scientifique, Grp_Code, SS_Grp_Code, SSSS_Grp_Code) 
	SELECT DISTINCT alim_code, alim_nom_fr, alim_nom_sci, alim_grp_code, alim_ssgrp_code, alim_ssssgrp_code FROM ALIMENTSBRUT;
	
INSERT INTO DONNEES_SANTE 
	SELECT DISTINCT alim_code, 
	Energie_Reglement_UE_kJ100g, 
	Energie_Reglement_UE_kcal100g, 
	Energie_NxfacteurJones_kJ100g, 
	Energie_NxfacteurJones_kca100g, 
	Eau_g100g, 
	Proteines_NxfacteurJones_g100g, 
	Proteines_Nx625_g100g, 
	Glucides_g100g, 
	Lipides_g100g, 
	Sucres_g100g, 
	Fructose_g100g, 
	Galactose_g100g, 
	Glucose_g100g, 
	Lactose_g100g, 
	Maltose_g100g, 
	Saccharose_g100g, 
	Amidon_g100g, 
	Fibres_alimentaires_g100g, 
	Polyols_totaux_g100g, 
	Cendres_g100g, 
	Alcool_g100g, 
	Acides_organiques_g100g, 
	AG_satures_g100g, 
	AG_monoinsatures_g100g, 
	AG_polyinsatures_g100g, 
	AG_butyrique_g100g, 
	AG_capro_que_g100g, 
	AG_caprylique_g100g, 
	AG_caprique_g100g, 
	AG_laurique_g100g, 
	AG_myristique_g100g, 
	AG_palmitique_g100g, 
	AG_stearique_g100g, 
	AG_oleique_g100g, 
	AG_linoleique_g100g, 
	AG_alphanulllinolenique_g100g, 
	AG_arachidonique_g100g, 
	AG_EPA_g100g, 
	AG_DHA_g100g, 
	Cholesterol_mg100g, 
	Sel_chlorure_de_sodium_g100g, 
	Calcium_mg100g, 
	Chlorure_mg100g, 
	Cuivre_mg100g, 
	Fer_mg100g, 
	Iode_microg100g, 
	Magnesium_mg100g, 
	Manganese_mg100g, 
	Phosphore_mg100g, 
	Potassium_mg100g, 
	Selenium_microg100g, 
	Sodium_mg100g, 
	Zinc_mg100g, 
	Retinol_microg100g, 
	BetaCarotene_microg100g, 
	Vitamine_D_microg100g, 
	Vitamine_E_mg100g, 
	Vitamine_K1_microg100g, 
	Vitamine_K2_microg100g, 
	Vitamine_C_mg100g, 
	Vitamine_B1_Thia_mg100g, 
	Vitamine_B2_Ribo_mg100g, 
	Vitamine_B3_PP_Nia_mg100g, 
	Vitamine_B5_AcidePan_mg100g
	FROM ALIMENTSBRUT;