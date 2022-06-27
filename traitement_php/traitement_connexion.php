<?php
    require('../include/connexion_bd.php');
    if (isset($_POST['envoyer'])) {
        $login = htmlspecialchars($_POST['pseudo']);
        $pass = htmlspecialchars($_POST['mdp']);

        $query= $bdd->prepare('SELECT * FROM user WHERE login=? AND mot_de_pass=?;');
        $query->execute(array($login, $pass));
        if ($query->fetch()) {
            setcookie('login', $login,time()+365*24*3600,'/');
            echo('Bienvenue mec');
        } else {
            echo ("erreur de login");
        }
    }
?>