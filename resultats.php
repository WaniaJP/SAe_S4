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
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, 
        dictum est a, mattis tellus. Sed dignissim, metus nec fringilla</p>
    </div>
    <div id="blocks">
    <div class="block" id="block1">
        <div class="graphique" id="graphique1"></div>
        <p class="description">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et 
            velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora 
            torquent per conubia nostra, per inceptos himenaeos.</p>
    </div>
    <div class="block" id="block2">
    <div class="graphique" id="graphique2"></div>
    <p class="description">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et 
            velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora 
            torquent per conubia nostra, per inceptos himenaeos.</p>
    </div>
    <div class="block" id="block3">
    <div class="graphique" id="graphique3"></div>
    <p class="description">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et 
            velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora 
            torquent per conubia nostra, per inceptos himenaeos.</p>
    </div>
    <div class="block" id="block4">
    <div class="graphique" id="graphique4"></div>
    <p class="description">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et 
            velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora 
            torquent per conubia nostra, per inceptos himenaeos.</p>
    </div>
    </div>
</body>
<?php
/* alimsPlusChoisis */
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
    

/* alimsPlusCaloriques */
$alimsCalSucres = $sondage -> prepare("SELECT AL.Nom_Fr, Energie_Reglement_UE_kcal100g  AS cal
FROM donnees_sante DS JOIN  ALIMENTS AL ON DS.Alim_Code = AL.Alim_Code 
ORDER BY cal DESC
LIMIT 5;
");
$alimsCalSucres->execute();
$alimsCalSucres = $alimsCalSucres ->fetchAll();
$alimsCalSucresNom = creerTab($alimsCalSucres, 0);
$alimsCalSucresValeurCal = creerTab($alimsCalSucres, 1);

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
    /* alimsPlusChoisis */
    <p id=tabValeurAlimsChoix><?php echo $alimsChoixNbChoix; ?></p>
    <p id=tabCleAlimsChoix><?php echo $alimsChoixAlim; ?></p>

    /* alimsPlusCaloriques */
    <p id=tabValeurAlimsCal><?php echo $alimsCalSucresValeurCal; ?></p>
    <p id=tabAlimsCalSucres><?php echo $alimsCalSucresNom; ?></p>
    
</div>

</html>
