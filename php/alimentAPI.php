<?php
$groupe = $_GET['groupe'];
$sgroupe = $_GET['sgroupe'];
$ssgroupe = $_GET['ssgroupe'];
echo json_encode(getAliments());

function getAllAliments(){
    require('connectBD.php'); //$pdo est défini dans ce fichier
    $sql="SELECT * FROM `aliments`";

    try {
        $commande = $pdo->prepare($sql);
        $bool = $commande->execute();
        if ($bool) {
            $resultat = $commande->fetchAll(PDO::FETCH_ASSOC); //tableau d'enregistrements
            if(count($resultat) > 0){
            return $resultat;
            }
            else return false;
        }
    }
    catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die(); // On arrête tout.
    }

}

function getAliments(){
    require('connectBD.php'); //$pdo est défini dans ce fichier
    $sql = getSQL($_GET['groupe'], $_GET['sgroupe'], $_GET['ssgroupe']);

    try {
        $commande = $pdo->prepare($sql);
        $bool = $commande->execute();
        if ($bool) {
            $resultat = $commande->fetchAll(PDO::FETCH_ASSOC); //tableau d'enregistrements
            if(count($resultat) > 0){
            return $resultat;
            }
            else return false;
        }
    }
    catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die(); // On arrête tout.
    }
}

function getSQL($groupe, $sgroupe, $ssgroupe){
    $sql="SELECT * FROM `aliments`";

    $oui = false;
    if($groupe != null){
        $oui=true;
        $sql.= " WHERE ";
        $sqlG = "( ";
        for($i = 0; $i < count($groupe); $i++){
            if($i != 0)
                $sqlG.=" OR ";
            $sqlG.= "Grp_Code = ".$groupe[$i];
        }
        $sqlG.= " )";
        $sql.= $sqlG;
    }

    if($sgroupe != null){
        
        if(!$oui){
            $sql.= " WHERE ";
            $oui=true;
        }
        else{
            $sql.=" AND ";
        }
        $sqlG = "( ";
        for($i = 0; $i < count($sgroupe); $i++){
            if($i != 0)
                $sqlG.=" OR ";
            $sqlG.= "SS_Grp_Code = ".$sgroupe[$i];
        }
        $sqlG.= " )";
        $sql.= $sqlG;
    }

    if($ssgroupe != null){
        if(!$oui){
            $sql.= " WHERE ";
        }
        else{
            $sql.=" AND ";
        }
        
        $sqlG = "( ";

        for($i = 0; $i < count($ssgroupe); $i++){
            if($i != 0)
                $sqlG.=" OR ";
            $sqlG.= "SSSS_Grp_Code = ".$ssgroupe[$i];
        }
        $sqlG.= " )";
        $sql.= $sqlG;
    }

    $sql.=";";
    return $sql;
}

?>