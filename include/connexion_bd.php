<?php
    try{
        $bd_url="localhost";
        $bd_name="mali_wash";
        $bd_login="root";
        $bd_pass="";
        $bdd=new PDO('mysql:host='.$bd_url.';dbname='.$bd_name,$bd_login,$bd_pass);
    }
    catch(Exception $e){
        die('Erreur:' .$e->getMessage());
    }

    //FAUx SELECT * FROM vetement_depose,contact, type_vetement, depot, client WHERE vetement_depose.id_depot=depot.id AND depot.id_client=client.id AND depot.id_pressing=1 AND client.id_contact=contact.id AND contact.telephone='66035300'
    // VRAI SELECT * FROM client,contact,depot,vetement_depose,type_vetement WHERE client.id_contact=contact.id AND contact.telephone='66035300' AND depot.id_client=client.id AND depot.id_pressing=1 AND depot.id=vetement_depose.id_depot AND type_vetement.id=vetement_depose.id_type_vetement
 
    //BON SELECT client.id, client.prenom, contact.telephone, depot.date_depot,depot.date_retrait, vetement_depose.quantite, type_vetement.nom, type_vetement.prix, depot.paye FROM client,contact,depot,vetement_depose,type_vetement WHERE client.id_contact=contact.id AND contact.telephone='66035300' AND depot.id_client=client.id AND depot.id_pressing=1 AND depot.id=vetement_depose.id_depot AND type_vetement.id=vetement_depose.id_type_vetement

    // SELECT client.id, client.prenom, contact.telephone, depot.date_depot,depot.date_retrait,depot.prix FROM client,contact,depot,vetement_depose,type_vetement WHERE client.id_contact=contact.id AND contact.telephone='66035300' AND depot.id_client=client.id AND depot.id_pressing=1 AND depot.id=vetement_depose.id_depot AND type_vetement.id=vetement_depose.id_type_vetement
?>

