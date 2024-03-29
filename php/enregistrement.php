<!DOCTYPE html>
<?php
    require('../include/connexion_bd.php');
?>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../style/css/enregistrement.css">
    <script src="../api/jquery-3.6.0.min.js"></script>
    <title>Enregistrement</title>
</head>
<body>
    <div class="main">
        <!-- Le header du gerant -->
        <header>
            <form class="search_zone" action="">
                <input type="text" placeholder="entrez le numero">
                <button type="submit"><i class="fa fa-search"></i></button>
            </form>
            <nav>
                <div class="menu_dote"><i class="fas fa-bars"></i></div>
                <div class="icone_zone">
                    <a href="index.html" title="acceuil"><i class="fas fa-home"></i> </a>
                    <a href="pages/smartphone.html"  title="appareils"><i class="fas fa-tv"></i></a>
                </div>
            </nav>
        </header>

        <!-- le contenue -->
        <form action="../php/test.php" metho="get">
            <div class="client_form">
                <div class="client_zone">
                    <label for="nom">Nom:</label>
                    <input type="text">
                </div>
                <div class="client_zone">
                    <label for="nom">Prenom:</label>
                    <input type="text">
                </div>
                <div class="client_zone">
                    <label for="nom">Numero:</label>
                    <input type="text">
                </div>
            </div>

            <div class="vetement_form">
                <div class="head">
                    <span>Type</span>
                    <span>P/U</span>
                    <span>Quantite</span>
                </div>
                <?php 
                    require('../include/connexion_bd.php');
                    $query=$bdd->prepare('SELECT * FROM type_vetement WHERE id_pressing=?');
                    $query->execute(array(1));
                    while($reponse=$query->fetch()){
                ?>
                        <div class="vetement_zone" id="vetement_zone1">
                            <span><?php echo($reponse['nomTypeVetement']); ?></span>
                            <span><?php echo($reponse['prixTypeVetement']); ?></span>
                            <input type="hidden" class="nbr_hid" value="<?php echo($reponse['prixTypeVetement']); ?>">
                            <input type="number" onchange="calculTotal()" id="nombre1" class="nombre" value="0" name="testnombre1" required>
                        </div>
                <?php
                    }
                ?>
            </div>

            <div class="duo_flex montant_form">
                <div class="montant_zone">
                    <h3>Avance:</h3>
                    <div>
                        <input onchange="calculTotal()" type="number" id='avance' name="avance" id="" value="0">
                    </div>
                </div>
                <div class="date_zone">
                    <h3>Date de retrait</h3>
                    <div>
                        <input type="date" name="" id="">
                    </div>
                </div>
            </div>

            <div class="revision_zone">
                <h3>Montant total: <span id="montant_total">0 </span>FCFA</h3>
                <hr>
                <h3>Montant payé: <span id="montant_paye">0 </span>FCFA</h3>
                <hr>
                <h3>Reste à payé: <span id="reste">4000 </span>FCFA</h3>
                <hr>
                <p><button type="submit">Valider</button></p>
            </div>
        </form>
        <footer>
            <span>Mali WASH</span>
            <span>+22366035300</span>
        </footer>
        
        
    </div>
    <script src="../style/js/header_gerant.js"></script>
    <script src="../style/js/enregistrement.js"></script>
</body>
</html>