<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/9d1c8387eb.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../style/css/profil.css">

    <title>Profil</title>
</head>

<body>
    <?php
    require("../include/connexion_bd.php");
    if(!isset($_COOKIE['login'])){
        header('Location:connexion.php?etat=1');
        //montre une pop up pour le dire de se connecter
    }
    //Selection de l'utilisateur
    $query=$bdd->prepare("SELECT * FROM user WHERE login=?");

    $query->execute(array($_COOKIE['login']));
    $current_user=$query->fetch();

    $pressing = $bdd->prepare("SELECT * FROM pressing,user WHERE pressing.id_user=user.idUser AND user.idUser=?;");
    $pressing->execute(array($current_user['idUser']));
    $ligne = $pressing->fetch();
    ?>

    <section id="content">



        <main>
            <div class="head-title">
                <div class="left">
                    <h1><?php echo ($ligne['nomPressing']);  ?> </h1>
                    <p>login : <?php echo ($ligne['login']);  ?> </p> <br>
                    <p>Mot de passe : <?php echo ($ligne['mot_de_pass']);  ?> </p>
                    <button><a href="../php/modifier.php">Modifier</a></button>
                </div>

            </div>
            <ul class="box-info">
                <?php
                $query = $bdd->prepare("SELECT * FROM depot,pressing WHERE depot.id_pressing = pressing.idPressing AND pressing.id_user=?" );
                $query->execute(array($current_user['idUser']));
                $dateexp = $bdd->query("SELECT  * FROM pressing WHERE");
                
                $row = 0;
                while ($commande = $query->fetch()) {
                    $row++;
                }
                ?>
                <li>
                    <i class="fa-solid fa-cash-register"></i>
                    <span class="text">
                        <h3><?php echo ($row); ?></h3>
                        <p>Nombre total de depots</p>
                    </span>
                </li>

                <?php
                $query = $bdd->prepare("SELECT * FROM depot,pressing WHERE depot.id_pressing = pressing.idPressing AND pressing.id_user=?" );
                $query->execute(array($current_user['idUser']));
                $gaintotal = 0;
                while ($gain = $query->fetch()) {
                    $gaintotal += $gain['prixTotal'];
                }

                ?>

                <li>
                    <i class="fa-solid fa-dollar-sign"></i>
                    <span class="text">
                        <h3><?php echo ($gaintotal) ?></h3>
                        <p>gain total</p>
                    </span>
                </li>

                <?php
                $query = $bdd->prepare("SELECT date_fin_abonnement FROM pressing WHERE pressing.id_user=?" );
                $query->execute(array($current_user['idUser']));
                $query=$query->fetch();
                ?>

                <li>
                    <i class="fa-regular fa-calendar"></i>
                    <span class="text">
                        <h3><?php echo($query['date_fin_abonnement']) ?></h3>
                        <p>Date fin abonnement</p>
                    </span>
                </li>
            </ul>
            <?php

            ?>


            <div class="table-data">
                <div class="order">
                    <div class="head">
                        <h3>Recent Client</h3>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>client</th>
                                <th>Date</th>
                                <th>Statut</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>

                                    <p>John Doe</p>
                                </td>
                                <td>01-10-2021</td>
                                <td><span class="status completed">payer</span></td>
                            </tr>
                            <tr>
                                <td>

                                    <p>John Doe</p>
                                </td>
                                <td>01-10-2021</td>
                                <td><span class="status nonpayer">Non payer</span></td>
                            </tr>
                            <tr>
                                <td>

                                    <p>John Doe</p>
                                </td>
                                <td>01-10-2021</td>
                                <td><span class="status nonpayer">Non payer</span></td>
                            </tr>
                            <tr>
                                <td>
                                    <p>John Doe</p>
                                </td>
                                <td>01-10-2021</td>
                                <td><span class="status nonpayer">Non payer</span></td>
                            </tr>
                            <tr>
                                <td>

                                    <p>John Doe</p>
                                </td>
                                <td>01-10-2021</td>
                                <td><span class="status completed">Payer</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

            </div>
        </main>

    </section>




</body>

</html>