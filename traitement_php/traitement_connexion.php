<?php
require("classe_include.php");
if (isset($_POST['envoyer'])) {
    $mail = htmlspecialchars($_POST['pseudo']);
    $pass = htmlspecialchars($_POST['mdp']);

    $cheik = $bdd->prepare('SELECT * FROM user WHERE login=?');
    $cheik->execute(array($mail));
    if ($exist = $cheik->fetch()) {
        if ($pass == $exist['mot_de_pass']) {
            echo ("bienvenue Mr");
        } else {
            echo ("erreur de mot de passe");
        }
    } else {
        echo ("erreur de login");
    }
}
