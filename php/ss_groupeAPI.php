<?php
echo json_encode(getAllSSGroupes());

function getAllSSGroupes(){
    require('connectBD.php'); //$pdo est défini dans ce fichier
    $sql="SELECT * FROM `ss_groupe_aliments`";

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

?>