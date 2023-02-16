google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(alimentsLesPlusChoisis);
google.charts.setOnLoadCallback(alimsPlusCaloriques);
google.charts.setOnLoadCallback(typesAlimsPlusRepresentes);
google.charts.setOnLoadCallback(toutesVilles);
google.charts.setOnLoadCallback(nuage);




function alimentsLesPlusChoisis() {
    var data = new google.visualization.DataTable();
    var tab = document.getElementById("tabValeurAlimsChoix").textContent;
    var tabValeur = tab.split(';');
    var tab2 = document.getElementById("tabCleAlimsChoix").textContent;
    var tabCle = tab2.split(';');
    data.addColumn('string', 'Aliment');
    data.addColumn('number', 'Nombre de fois choisi');
    for (i=0; i<tabValeur.length; ++i) {
        data.addRow([tabCle[i], parseFloat(tabValeur[i], 10)]);
    }

    var options = {
        title: 'Les 15 aliments les plus choisis',
        is3D: true,
    };



    var chart = new google.visualization.PieChart(document.getElementById('graphique1'));
    chart.draw(data, options);

}


function alimsPlusCaloriques() {
      
    var data = new google.visualization.DataTable();
    var tab = document.getElementById("tabValeurAlimsCal").textContent;
    var tabCal = tab.split(';');
    var tab2 = document.getElementById("tabAlimsCalSucres").textContent;
    var tabAlim = tab2.split(';');
    data.addColumn('string', 'Aliment');
    data.addColumn('number', 'calories');
    for (i=0; i<tabCal.length; ++i) {
        data.addRow([tabAlim[i], parseFloat(tabCal[i], 10)]);
    }

      var options = {
        title: 'Les 5 aliments les plus caloriques',
        chartArea: {width: '50%'},
        hAxis: {
          title: 'Calories (kcal/100g)',
          minValue: 0
        },
        vAxis: {
          title: 'Aliments'
        }
      };

      var chart = new google.visualization.BarChart(document.getElementById('graphique2'));

      chart.draw(data, options);
    }

      
      function typesAlimsPlusRepresentes() {
        var data = new google.visualization.DataTable();
        var tab = document.getElementById("tabTypeAlim").textContent;
        var tabType = tab.split(';');
        var tab2 = document.getElementById("tabAlimsNB").textContent;
        var tabNBAlim = tab2.split(';');
        data.addColumn('string', 'type aliments');
        data.addColumn('number', 'Nombre aliments');
        for (i=0; i<tabNBAlim.length; ++i) {
            data.addRow([tabType[i], parseFloat(tabNBAlim[i], 10)]);
        }

        var options = {
          title: "Les 15 types d'aliments les plus représentés ",
          legend: { position: 'none' },
          vAxis: { scaleType: 'mirrorLog' },
          colors: ['#e7711c'],
        };

        var chart = new google.visualization.Histogram(document.getElementById('graphique3'));
        chart.draw(data, options);



      }

      function toutesVilles() {
        var data = new google.visualization.DataTable();
        var tab = document.getElementById("tabVilles").textContent;
        var tabVilles = tab.split(';');
        var tab2 = document.getElementById("tabCountVilles").textContent;
        var tabCountVilles = tab2.split(';');
        data.addColumn('string', 'Ville');
        data.addColumn('number', 'nombre de sondés');
        for (i=0; i<tabCountVilles.length; ++i) {
            data.addRow([tabVilles[i], parseFloat(tabCountVilles[i], 10)]);
        }

        var options = {     
          pieHole: 0.5,
          pieSliceTextStyle: {
            color: 'black',
          },
          legend: 'none',
          title: 'Les différentes villes des sondés',
          pieStartAngle: 100,
      };

        var chart = new google.visualization.PieChart(document.getElementById('graphique4'));

        chart.draw(data, options);
      }

      function nuage() {
        var data = new google.visualization.DataTable();
        var tabChoix = document.getElementById("tabSucreChoix").textContent;
        var tabChoix = tabChoix.split(';');
        var tabSucre = document.getElementById("tabSucre").textContent;
        var tabSucre = tabSucre.split(';');
        data.addColumn('number', 'choixAlim');
        data.addColumn('number', 'taux de Sucre');
        for (i=0; i<tabChoix.length; ++i) {
            data.addRow([parseFloat(tabChoix[i], 10.00), parseFloat(tabSucre[i], 10.00)]);
        }

        var options = {
          title: 'Taux de sucre en fonction de la popularité',
          hAxis: {title: 'Popularité', minValue: 0, maxValue: 10, format:'0.00'},
          vAxis: {title: 'Taux de sucre', minValue: 0, maxValue: 10, format:'0.00'},
          legend: 'none',
        };

        var chart = new google.visualization.ScatterChart(document.getElementById('graphique5'));

        chart.draw(data, options);
      }