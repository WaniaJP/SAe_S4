<?php

$nom = isset($_POST["nom"]) ? $_POST["nom"] : "";
$prenom = isset($_POST["prenom"]) ? $_POST["nom"] : "";
$password = isset($_POST["password"]) ? $_POST["nom"] : "";
$email = isset($_POST["email"]) ? $_POST["email"] : "";
$CP = isset($_POST["CP"]) ? $_POST["CP"] : "";
$dateNaiss = isset($_POST["dateNaiss"]) ? $_POST["dateNaiss"] : "";
$adresse = isset($_POST["adresse"]) ? $_POST["adresse"] : "";
$ville = isset($_POST["ville"]) ? $_POST["ville"] : "";
$tel = isset($_POST["tel"]) ? $_POST["tel"] : "";

$profil = array();

if ($nom != "" && $prenom != "" && $email != "" && $password != "" && $dateNaiss != "" && $CP != "" && $adresse != "" && $ville != "" && $tel != "") {
    if(!exists($email)){
        insert($nom, $prenom,$email, $password, $dateNaiss, $CP, $adresse, $ville, $tel);
        echo "Utilisateur bien ajouté";
    }
    else{
        $msg = "L'adresse email ". utf8_encode($email) ." existe déjà. Connectez-vous ";
        require ("login.tpl");
    }
}
else{
    require("login.tpl");
}

function exists($email){
    require('php/connectBD.php'); //$pdo est défini dans ce fichier
    $sql="SELECT * FROM `utilisateur`  where email=:email ";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':email', $email);
        $bool = $commande->execute();
        if ($bool) {
            $resultat = $commande->fetchAll(PDO::FETCH_ASSOC); //tableau d'enregistrements
            if(count($resultat) > 0) return true;
            else return false;
        }
    }
    catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die(); // On arrête tout.
    }
}

function insert($nom, $prenom,$email, $password, $dateNaiss, $CP, $adresse, $ville, $tel){
    require('php/connectBD.php'); //$pdo est défini dans ce fichier
    $sql="INSERT  INTO `utilisateur`  SELECT MAX(Administre) + 1 ,?,?,?,?,?,?,?,?,? FROM `utilisateur` ";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(1, $nom);
        $commande->bindParam(2, $prenom);
        $commande->bindParam(3, $email);
        $commande->bindParam(4, $dateNaiss);
        $commande->bindParam(5, $adresse);
        $commande->bindParam(6, $CP);
        $commande->bindParam(7, $ville);
        $commande->bindParam(8, $tel);
        $commande->bindParam(9, $password);

        $bool = $commande->execute(); //insertion
    }
    catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die(); // On arrête tout.
    }
}


?>