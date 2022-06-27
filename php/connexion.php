<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../style/css/connexion.css">
    <script src="https://kit.fontawesome.com/9d1c8387eb.js" crossorigin="anonymous"></script>
    <title>Page de connexion</title>
</head>

<body>
    <?php
        setcookie('login', '',1,'/');
    ?>

    <body>
        <nav>
            <div class="logo">
                <a href="#">Le logo</a>
            </div>
            <div class="nom">
                <h2>Mali Wash</h2>
            </div>
        </nav>

        <div class="container">
            <div class="wrapper">

                <div class="title"><span>Connexion</span></div>
                <form action="../traitement_php/traitement_connexion.php" method="post">
                    <div class="row">
                        <i class="fas fa-user"></i>
                        <input type="text" placeholder="Email ou numero" required name="pseudo">
                    </div>
                    <div class="row">
                        <i class="fas fa-lock"></i>
                        <input type="password" placeholder="Mot de passe" required name="mdp">
                    </div>

                    <div class="row button">
                        <input type="submit" value="Login" name="envoyer">
                    </div>
                    <div class="pass"><a href="#">Mot de passe Oublier</a></div>
                </form>
            </div>
        </div>

    </body>

</html>

</body>

</html>