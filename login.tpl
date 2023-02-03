<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion</title>
    <link rel="stylesheet" href="css/login.css">
    <script src="js/login.js"></script>
</head>
<body>
    <header></header>
    <div class="modal">
<div id="form1">
            <h1>Se connecter</h1>
            <h3>Pas encore un compte ? <span style="text-decoration: underline; cursor: pointer; " onclick="change()">S'inscrire</span></h3>
            <form method="post" action="login.php">
                <label >E-mail</label>
                <input id="email" name="email" type="email" placeholder="Entrez votre email">
                <label >Mot de passe</label>
                <input name="password" type="password" id="password" placeholder="Saissisez votre mot de passe">
                <div style="padding: 1em;"><input type="checkbox" onclick="myFunction()"> Rendre visible le mot de passe</div>
                <button type="submit" class="btn" onsubmit="submit(e)">Connexion</button>
            </form>
    </div>

    <div id="form2">
            <h1>S'inscrire</h1>
            <h3>Déjà un compte ? <span style="text-decoration: underline;cursor: pointer;" onclick="change()">Se connecter</span> </h3>
            <form method="post" action="register.php">
                <div id="first">
                <fieldset>
                    <label>Nom</label>
                    <input name="nom" type="text" required>
                    <label>Prénom</label>
                    <input name="prenom" type="text" required>
                    <label>E-mail</label>
                    <input name="email" type="email" required>
                    <label>Mot de passe</label>
                    <input id="mdp" name="password" type="password" pattern="[A-Za-z0-9]{3,10}" required>
                    <div id="message">
                        <h3>Le mot de passe doit contenir :</h3>
                        <p id="letter" class="invalid">Une lettre <b>miniscule</b> </p>
                        <p id="capital" class="invalid">Une lettre <b>majuscule</b> </p>
                        <p id="number" class="invalid">Un <b>nombre</b></p>
                        <p id="length" class="invalid">Au moins <b>8 caractères</b></p>
                    </div> 
                    <label>Confirmation du mot de passe</label>
                    <input id="mdp2" type="password" >
                    <div style="padding: 1em;"><input type="checkbox" onclick="myClick()"> Rendre visible le mot de passe</div>
                    <div id="msgPassword" style="color: darkred; font-size: 1.1em; text-align: center; padding: 1em;">Les mot de passe doivent être pareille</div>
                </fieldset>
                <hr>
                <fieldset>
                    <label>Date de naissance</label>
                    <input name="dateNaiss" type="date" required>
                    <label>Adresse</label>
                    <input name="adresse" type="text" required>
                    <label>Ville</label>
                    <input name="ville" type="text" required>
                    <label>Code postale</label>
                    <input name="CP" type="number" required>
                    <label>Télephone</label>
                    <input name="tel" type="tel" required>
                    
                </fieldset>
            </div>
                <div id="end">
                    <div class="checkbox"><input type="checkbox" required> Vous devez lire et accepter les conditions d'utlisations de notre <a href="#">agglomération</a> </div>
                    <button class="btn" type="submit" onsubmit="submit(e)">Inscription</button>
                </div>
                
            </form>
    </div>
    <div id="msg" style="color: darkred; font-size: 1.1em; text-align: center; padding: 1em;"><?php if(isset($msg)) echo $msg; ?></div>
    </div>
</body>
</html>