<!doctype html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <title>Accueil</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
    <link rel="stylesheet" href="./css/index.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <nav class="navbar">
        <a class="logo" herf="#">Logo</a>
        <div class="nav-lists">
           <ul>
                <li class="active"><a href="index.php">Accueil</a></li>
                <li><a href="login.php">Sondage</a></li>
            </ul>  
        </div>
        <img src="assets/navigation-bar.png" class="navbar-close">
    </nav>
    
   
        <div class="container">
            <div class="child">
                <h1>Presentation du site</h1>
                <p>
                    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                </p>
            </div>
            <div class="second-container">
                <div class="child second">
                    <h1> Presentation du sondage </h1> 
                    <p>Cela consiste à élaborer un algorithme permettant de calculer pour chaque administré son score 
                        santé en fonction de ses réponses au sondage c’est-à-dire des 10 aliments choisis. Ce score sera 
                        une proposition à faire basée par exemple sur la moyenne des calories des aliments choisis, le taux 
                        d’aliments salés, sucrés, ou tout autre suggestion.
                        </p>              
                </div>
                <div class="child second">
                    <h1> demo du sondage </h1> 
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>              
                        <button class="btn" onclick="window.location.href = 'login.php'" >Démarrer le sondage !</button>
                </div>
            </div>

            
        </div>
    
    <script>
        const menuHamburger = document.querySelector(".navbar-close")
        const navLinks = document.querySelector(".nav-lists")
        menuHamburger.addEventListener('click',()=>{
            navLinks.classList.toggle('mobile-menu')
        })
    </script>
</body>

