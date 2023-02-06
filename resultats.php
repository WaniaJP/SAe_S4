<!doctype html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <title>Résultats</title>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
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

$alimsChoix = $sondage -> prepare("SELECT AL.Nom_Fr, count(S.Alim_Code)
FROM REPONSE_SONDAGE S JOIN  ALIMENTS AL ON S.Alim_Code = AL.Alim_Code 
GROUP BY S.Alim_Code, AL.Nom_Fr
ORDER BY 2 DESC
LIMIT 15;
");
$alimsChoix->execute();
$alimsChoix = $alimsChoix ->fetchAll();
$alimsChoixValeur = creerTabValeur($alimsChoix);
$alimsChoixCle = creerTabCle($alimsChoix);
function creerTabValeur($tab) {
    $i = 0;
    foreach ($tab as $row) {
        if ($i == 0) {
            $tab = $row[1];
        } else {
            $tab = $tab . "." . $row[1];
        }
        $i += 1;
    }
    return $tab;
}
function creerTabCle($tab) {
    $i = 0;
    foreach ($tab as $row) {
        if ($i==0) {
            $tab = $row[0];
        }
        else {
            $tab = $tab .".". $row[0];
        }
        $i+=1;
    }
    return $tab;
}


?>
<script type="text/javascript">
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(alimentsLesPlusChoisis);

function alimentsLesPlusChoisis() {
    var data = new google.visualization.DataTable();
    var tab = <?php echo json_encode($alimsChoixValeur); ?>;
    var tabValeur = tab.split('.');
    var tab2 = <?php echo json_encode($alimsChoixCle) ?>;
    var tabCle = tab2.split('.');
    data.addColumn('string', 'Aliment');
    data.addColumn('number', 'Nombre de fois choisi');
    for (i=0; i<tabValeur.length; ++i) {
        data.addRow([tabCle[i], parseInt(tabValeur[i], 10)]);
    }

    var options = {
        title: 'Les 15 aliments les plus choisis'
    };



    var chart = new google.visualization.PieChart(document.getElementById('graphique1'));
    chart.draw(data, options);

}

</script>
</html>