var alimentActuelle;
var alimentInput;

var groupe;
var sgroupe;
var ssgroupe;

var AlimentSelectionner;

$(document).ready(init);

const nbAlimentASelectionner = 10;

class Aliment{
    constructor(id, nom){
        this.id = id;
        this.nom = nom;
    }
}

const AlimentImpossible = new Aliment(-1, -1);

function init(){
    AlimentSelectionner = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,];
    
    alimentActuelle = 0;
    alimentInput = $(".input-aliment");
    alimentInput[alimentActuelle].classList.add("active");
    $("#button-next").on("click", nextAliment);

    getGroupe();
    retrieveData();
}


function nextAliment(){
    ajouterAliment();
    alimentInput[alimentActuelle].classList.remove("active");

    alimentActuelle +=1;
    alimentActuelle %=nbAlimentASelectionner;

    alimentInput[alimentActuelle].classList.add("active");
    retrieveData();

}

function ajouterAliment(){
    if($("#liste").val() != ""){
        alimentInput[alimentActuelle].value = $("#liste").val();
        var alim = $("option[value='"+$("#liste").val()+"']").attr("name");
        AlimentSelectionner[alimentActuelle] = alim;
        $("#liste").val("");
    }
}



function getGroupe(){
    $.ajax({
        async: false,
        url: "http://localhost/MyPAGE/php/groupeAPI.php",
        dataType : "JSON",
        success: function(result){
        var s = "";
        for(i = 0; i < result.length; ++i ){
            s+= createACheckBox(result[i].Grp_Code, result[i].Nom_FR, "check-groupe"); 
        }

        $(".groupe ul").append(s);
        }
        
    })

    $.ajax({
        async: false,
        url: "http://localhost/MyPAGE/php/ss_groupeAPI.php",
        dataType : "JSON",
        success: function(result){

        var s = "";
        for(i = 0; i < result.length; ++i ){
            s+= createACheckBox(result[i].SS_Grp_Code, result[i].Nom_FR, "check-ss-groupe"); 
        }

        $(".ss-groupe ul").append(s);
        }
        
    })

    $.ajax({
        async: false,
        url: "http://localhost/MyPAGE/php/ss_ss_groupeAPI.php",
        dataType : "JSON", 
        success: function(result){
            var s = "";
            for(i = 0; i < result.length; ++i ){
                s+= createACheckBox(result[i].SSSS_Grp_Code, result[i].Nom_FR, "check-ss-ss-groupe"); 
            }
    
            $(".ss-ss-groupe ul").append(s);

            $(".button-checkbox").on("click", retrieveData);

        }
        
    })
}

function retrieveData(){

    var groupe = [];
    var tmp = $(".check-groupe:checked");
    for(i = 0; i < tmp.length; ++i ){
        var elem = tmp[i];
        groupe.push(elem.name)
    }

    var sgroupe = [];
    var tmp = $(".check-ss-groupe:checked");
    for(i = 0; i < tmp.length; ++i ){
        var elem = tmp[i];
        sgroupe.push(elem.name)
    }

    var ssgroupe = [];
    var tmp = $(".check-ss-ss-groupe:checked");
    for(i = 0; i < tmp.length; ++i ){
        var elem = tmp[i];
        ssgroupe.push(elem.name)
    }

    var parametre = {};
    parametre.groupe = groupe;
    parametre.sgroupe = sgroupe;
    parametre.ssgroupe = ssgroupe
    $.ajax({
        method:'GET',
        url: "http://localhost/MyPAGE/php/alimentAPI.php",
        data: {groupe : groupe, sgroupe : sgroupe, ssgroupe: ssgroupe},
        dataType : "JSON", 
        success: function(result){
            dataAdd(result);
        }
        
    })
}

function dataAdd(liste){
    $("#ice-cream-flavors").empty();
    for(i = 0; i < liste.length; ++i){
        if(valideOptionAliment(liste[i].Alim_Code))
            $("#ice-cream-flavors").append(createAnOption(liste[i].Alim_Code, liste[i].Nom_FR));
    }
}

function createAnOption(num, name){
    return '<option value="'+name+'" name="'+num+'"></option>';
}
function createACheckBox(num, name, className){
    return '<li><div> <input type="checkbox" class="button-checkbox '+ className +'" name="'+ num +'"> <label for="'+ num +'">'+name+'</label> </div></li>';
}

function filtrageGroupe() {
    var input, filter, ul, li, a, i, txtValue2;

    input = $("#input-recherche-groupe");
    filter = input.val().toUpperCase();
    ul = $("#liste-groupe");
    li = ul.children("li");

    for (i = 0; i < li.length; i++) {
        a = li[i].getElementsByTagName("div")[0];
        txtValue2 = a.textContent || a.innerText;
        if (txtValue2.toUpperCase().indexOf(filter) > -1) {
            li[i].style.display = "";
        } else {
            li[i].style.display = "none";
        }
    }
}

function filtrageSGroupe() {
    var input, filter, ul, li, a, i, txtValue2;

    input = $("#input-recherche-sgroupe");
    filter = input.val().toUpperCase();
    ul = $("#liste-sgroupe");
    li = ul.children("li");

    for (i = 0; i < li.length; i++) {
        a = li[i].getElementsByTagName("div")[0];
        txtValue2 = a.textContent || a.innerText;
        if (txtValue2.toUpperCase().indexOf(filter) > -1) {
            li[i].style.display = "";
        } else {
            li[i].style.display = "none";
        }
    }
}

function filtrageSSGroupe() {
    var input, filter, ul, li, a, i, txtValue2;

    input = $("#input-recherche-ssgroupe");
    filter = input.val().toUpperCase();
    ul = $("#liste-ssgroupe");
    li = ul.children("li");

    for (i = 0; i < li.length; i++) {
        a = li[i].getElementsByTagName("div")[0];
        txtValue2 = a.textContent || a.innerText;
        if (txtValue2.toUpperCase().indexOf(filter) > -1) {
            li[i].style.display = "";
        } else {
            li[i].style.display = "none";
        }
    }
}

function sendDonnees(){
    $.ajax({
        method:'POST',
        url: "http://localhost/MyPAGE/php/alimentAPI.php",
        data: {aliments : AlimentSelectionner},
        dataType : "JSON", 
        success: function(result){
            console.log("yes");
        }
        
    })
}

function valideOptionAliment(id){
    for(var i = 0; i < AlimentSelectionner.length; i++){
        if(AlimentSelectionner[i] == id)
            return false;
    }
    return true;
}