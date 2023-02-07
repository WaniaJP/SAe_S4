/* Les 15 aliments les plus choisis */
SELECT AL.Nom_Fr, count(S.Alim_Code)
FROM REPONSE_SONDAGE S JOIN  ALIMENTS AL ON S.Alim_Code = AL.Alim_Code 
GROUP BY S.Alim_Code, AL.Nom_Fr
ORDER BY 2 DESC
LIMIT 15;

/* Les 5 aliments les plus caloriques */
SELECT AL.Nom_Fr, Energie_Reglement_UE_kcal100g  AS cal
FROM donnees_sante DS JOIN  ALIMENTS AL ON DS.Alim_Code = AL.Alim_Code 
ORDER BY cal DESC
LIMIT 5;