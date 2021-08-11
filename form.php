<!-- v3.4.7 - OneyKii 
        AIDE DE LA PART DE Ludovic, Gabriel & Thomas
        Je comprend le code mais j'aurais eu besoin de plus de temps pour le faire
        Si il n'aurait pas été là.
-->
<link rel="stylesheet" href="h/header.css">
<link rel="stylesheet" href="form.css">
<title>Requête envoyée | BookmarkV3</title>
<?php

include 'c/connexion.php';
include 'h/header.php';

    $inputname = $_POST['inputname'];
    $inputurl = $_POST['inputurl'];
    $inputcategorie = $_POST['radios'];

        // insére de la donnée dans la base de donnée (dans la table "link")
        $stm = $db->prepare('INSERT INTO link (name, url) VALUES (:inputname, :inputurl)');

        $stm->bindValue(':inputname', $inputname, PDO::PARAM_STR);
        $stm->bindValue(':inputurl', $inputurl, PDO::PARAM_STR);

        $stm->execute();

        // insére de la donnée dans la base de donnée (dans la table "link_categories")
        $last_id = $db->lastInsertId();
        $stm2 = $db->prepare('INSERT INTO link_categories (id_link, id_cat) VALUES ( :idl, :inputcat)');
        $stm2->bindParam(':idl', $last_id);
        $stm2->bindParam(':inputcat', $_POST['radios']);
        $stm2->execute();

?>

<h1>Requête envoyée avec succès</h1>
<div class="global">
    <button class="btn-home">
        <a href="index.php">Retourner à l'accueil</a>
    </button>

    <button class="btn-home">
        <a href="create.php">Créer un nouveau bookmark</a>
    </button>
</div>

<?php

include 'f/footer.php';

?>