google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(alimentsLesPlusChoisis);
google.charts.setOnLoadCallback(drawAxisTickColors);

function alimentsLesPlusChoisis() {
    var data = new google.visualization.DataTable();
    var tab = document.getElementById("tabValeurAlimsChoix").textContent;
    var tabValeur = tab.split(';');
    var tab2 = document.getElementById("tabCleAlimsChoix").textContent;
    var tabCle = tab2.split(';');
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


function drawAxisTickColors() {
      
    var data = new google.visualization.DataTable();
    var tab = document.getElementById("tabValeurAlimsCal").textContent;
    var tabCal = tab.split(';');
    var tab2 = document.getElementById("tabAlimsCalSucres").textContent;
    var tabAlim = tab2.split(';');
    data.addColumn('string', 'Aliment');
    data.addColumn('number', 'calories')
    for (i=0; i<tabCal.length; ++i) {
        data.addRow([tabAlim[i], parseInt(tabCal[i], 10)]);
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