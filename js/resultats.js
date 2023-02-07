google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(alimentsLesPlusChoisis);

function alimentsLesPlusChoisis() {
    var data = new google.visualization.DataTable();
    var tab = document.getElementById("tabValeurAlimsChoix").textContent;
    var tabValeur = tab.split('.');
    var tab2 = document.getElementById("tabCleAlimsChoix").textContent;
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

