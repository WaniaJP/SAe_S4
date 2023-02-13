<!doctype html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <title>Résultats</title>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript" src="./js/resultats.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
    <link rel="stylesheet" href="./css/styleResultat.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <?php
        try {
            $sondage = new PDO(
                'mysql:host=localhost;dbname=sondage;charset=utf8',
                'root',
                'root'
            );
        } catch (Exception $e) {
            die('Erreur : ' . $e->getMessage());
        }

    ?>
    <div id="intro">
    <h1>Résultats du sondage</h1>
    <p>Pour afficher les résultats du sondage, sélectionner les graphiques à afficher puis cliquer sur afficher. Certaines intéractions
        sont possibles avec les différents graphiques, par exemple en les survolant
        avec la souris. Ils ont été réalisés avec google chart.
    </p>
    </div>
    <form action='' method="get">
    <fieldset id="checkbox">
        <legend>Choisir les graphiques qui s'affichent</legend>
        <div>
        <input type="checkbox" id="choix" name="graphique1" value="choix">
        <label>Les aliments les plus choisis</label>
        </div>
        <div>
        <input type="checkbox" id="calories" name="graphique2" value="calories">
        <label>Les aliments les plus caloriques</label>
        </div>
        <div>
        <input type="checkbox" id="types" name="graphique3" value="types">
        <label>Les aliments les plus représentés</label>
        </div>
        <div>
        <input type="checkbox" id="villes" name="graphique4" value="villes">
        <label>Les différentes villes des sondés</label>
        </div>
        <div>
        <input type="checkbox" id="villes" name="graphique5" value="villes">
        <label>Les aliments les plus choisis en rapport avec leur taux de sucre</label>
        </div>
        <button type="submit">Afficher</button>
    </fieldset>
    </form>
    <div id="blocks">
    <?php 
    if (isset($_GET["graphique1"])) {
    ?>
    <div class="block" id="block1">
        <div class="graphique" id="graphique1"></div>
        <p class="description">Ce graphique en secteurs présente les 15 aliments les plus choisis
            par les sondés.</p>
    </div>
    <?php
    }
    if (isset($_GET["graphique2"])) {
    ?>
    <div class="block" id="block2">
    <div class="graphique" id="graphique2"></div>
    <p class="description">Ce graphique en barres présente les 5 aliments les plus caloriques.

    </p>
    </div>
    <?php
    }
    if (isset($_GET["graphique3"])) {
    ?>
    <div class="block" id="block3">
    <div class="graphique" id="graphique3"></div>
    <p class="description">Ce graphique en barre présente les types d'aliments les plus représentés,
        par exemple les légumes, les viandes etc. Survoler avec la souris le graphique pour faire apparaître
        le nom des types d'aliments.
    </p>
    </div>
    <?php
    }
        if (isset($_GET["graphique4"])) {
    ?>
    <div class="block" id="block4">
    <div class="graphique" id="graphique4"></div>
    <p class="description">Ce graphique en anneau met en relief les différentes villes d'origine des sondés.</p>
    </div>
    <?php }
        if (isset($_GET["graphique5"])) {
    ?>
    <div class="block" id="block5">
    <div class="graphique" id="graphique5"></div>
    <p class="description">Ce nuage de points expose les aliments les plus choisis en fonction de leur taux de sucre.</p>
    </div>
    <?php }
    ?>
    </div>
</body>
<?php
/* Les aliments les plus choisis */
$alimsChoix = $sondage -> prepare("SELECT AL.Nom_Fr, count(S.Alim_Code)
FROM REPONSE_SONDAGE S JOIN  ALIMENTS AL ON S.Alim_Code = AL.Alim_Code 
GROUP BY S.Alim_Code, AL.Nom_Fr
ORDER BY 2 DESC
LIMIT 15;
");
$alimsChoix->execute();
$alimsChoix = $alimsChoix ->fetchAll();
$alimsChoixNbChoix = creerTab($alimsChoix, 1);
$alimsChoixAlim = creerTab($alimsChoix, 0);


/* Les aliments les plus représentées  */
$alimsPlusChoisis = $sondage -> prepare("SELECT ss_groupe_aliments.Nom_FR, COUNT(aliments.Grp_Code)
FROM ss_groupe_aliments LEFT JOIN aliments ON aliments.SS_Grp_Code = ss_groupe_aliments.SS_Grp_Code
GROUP BY ss_groupe_aliments.Nom_FR
ORDER BY COUNT(aliments.Grp_Code) DESC
LIMIT 15;
");
$alimsPlusChoisis->execute();
$alimsPlusChoisis = $alimsPlusChoisis ->fetchAll();
$alimsNB = creerTab($alimsPlusChoisis, 1);
$typeAlim = creerTab($alimsPlusChoisis, 0);

/* Les aliments les plus caloriques */
$alimsCalSucres = $sondage -> prepare("SELECT AL.Nom_Fr, Energie_Reglement_UE_kcal100g  AS cal
FROM donnees_sante DS JOIN  ALIMENTS AL ON DS.Alim_Code = AL.Alim_Code 
ORDER BY cal DESC
LIMIT 5;
");
$alimsCalSucres->execute();
$alimsCalSucres = $alimsCalSucres ->fetchAll();
$alimsCalSucresNom = creerTab($alimsCalSucres, 0);
$alimsCalSucresValeurCal = creerTab($alimsCalSucres, 1);

/* Les différentes villes des sondés */
$villes = $sondage -> prepare("SELECT COUNT(utilisateur.ville), utilisateur.Ville
FROM utilisateur
GROUP BY utilisateur.Ville;
");
$villes->execute();
$villes = $villes-> fetchAll();
$toutesVilles = creerTab($villes, 1);
$countVilles = creerTab($villes, 0);

/* Le taux de sucre des aliments les plus choisis*/
$alimsSucres = $sondage -> prepare("SELECT AL.Nom_Fr, Sucres_g100g FROM donnees_sante DS INNER JOIN ALIMENTS AL ON DS.Alim_Code 
= AL.Alim_Code INNER JOIN (SELECT AL.Nom_Fr, count(S.Alim_Code) FROM REPONSE_SONDAGE S 
JOIN ALIMENTS AL ON S.Alim_Code = AL.Alim_Code GROUP BY AL.Nom_Fr ORDER BY 2 DESC) AS choix ON choix.Nom_Fr = AL.Nom_Fr;
");
$alimsSucres->execute();
$alimsSucres = $alimsSucres-> fetchAll();
$alimsSucresTab = creerTab($alimsSucres, 1);

function creerTab($tab, $col) {
    $i = 0;
    foreach ($tab as $row) {
        if ($i == 0) {
            $tab = $row[$col];
        } else {
            $tab = $tab . ";" . $row[$col];
        }
        $i += 1;
    }
    return $tab;
}
?>
<div id="tabsPourGraphiques">
    /* Les aliments les plus choisis */
    <p id=tabValeurAlimsChoix><?php echo $alimsChoixNbChoix; ?></p>
    <p id=tabCleAlimsChoix><?php echo $alimsChoixAlim; ?></p>

    /* Les aliments les plus caloriques */
    <p id=tabValeurAlimsCal><?php echo $alimsCalSucresValeurCal; ?></p>
    <p id=tabAlimsCalSucres><?php echo $alimsCalSucresNom; ?></p>
    
    /* Les aliments les plus représentées  */
    <p id=tabAlimsNB><?php echo $alimsNB; ?></p>
    <p id=tabTypeAlim><?php echo $typeAlim; ?></p>

    /* Les différentes villes des sondés */
    <p id=tabVilles><?php echo $toutesVilles; ?></p>
    <p id="tabCountVilles"><?php echo $countVilles; ?></p>

    /* Le taux de sucre des aliments les plus choisis */
    <p id=tabSucre><?php echo $alimsSucresTab; ?></p>
    

</div>

</html>
