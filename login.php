<?php
$msg="";
if(count($_POST) > 0){
    $email = isset($_POST['email'])? $_POST['email']  : "";
    $password = isset($_POST['password'])? $_POST['password']  : "";

    $profil = array();

    if($email != "" && $password != ""){
        if  (!verif_ident($email,$password)) {
            $msg ="Mot de passe incorrect OU utilisateur inconnu";
            require ("login.tpl");
        }
        else { 
            $_SESSION['profil'] = $profil;
            echo "Connexion reuissie !";
        /*  $url = "sondage.php";
            header("Location:" . $url) ; */
        }
    }
}
else{
    require ("login.tpl");
}


function verif_ident($email,$password) {
    require('php/connectBD.php'); //$pdo est défini dans ce fichier
    $sql="SELECT * FROM `utilisateur`  where email=:email and MDP=:mdp";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':email', $email);
        $commande->bindParam(':mdp', $password);
        $bool = $commande->execute();
        if ($bool) {
            $resultat = $commande->fetchAll(PDO::FETCH_ASSOC); //tableau d'enregistrements
        }
    }
    catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die(); // On arrête tout.
    }
    
    if (empty($resultat)) return false;
    else {
        $profil = $resultat[0] ;
        return true;
    }
}

?>