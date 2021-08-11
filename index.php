<!-- v3.4.7 - OneyKii 
        AIDE DE LA PART DE Ludovic, Gabriel & Thomas
        Je comprend le code mais j'aurais eu besoin de plus de temps pour le faire
        Si il n'aurait pas été là.
-->
    <link rel="stylesheet" href="main.css">
    <link rel="stylesheet" href="h/header.css">
    <link rel="stylesheet" href="f/footer.css">
    <link rel="stylesheet" href="background.css">
    <title>Home | BookmarkV3</title>
<body>

<?php

include 'c/connexion.php';
include 'h/header.php';

// supprime un ID donc supprimer un bookmark
if(isset($_GET['id'])) {
    $delete = $db->prepare("DELETE FROM link WHERE id = :current_id");
    $delete->bindParam(":current_id", $_GET['id']);
    $delete->execute();
    $delete->closeCursor();     
}


// récupère le nom et l'url dans la table "link", et jointure dans 2 tables.
$reponse = $db->prepare('SELECT l.name as "name link", l.url as "url link", l.id as "id link", c.name as "categorie name" FROM link as l 
                        left join link_categories as lc ON l.id = lc.id_link
                        left join categories as c ON c.id = lc.id_cat;');
    $reponse -> execute();
    $result = $reponse->fetchAll();

?>


<div class="table-global">
    <table>
        <tr>
            <td>ID</td>
            <td>NOM</td>
            <td>URL</td>
            <td>CATÉGORIE</td>
            <td>ACTION</td>
        </tr>

    <?php 
    // boucle pour afficher le tableau
    foreach($result as $tableau):?>


        <!--affichage des information dans un tableau-->
        <tr>
            <td><?php echo $tableau['id link'] ?></td>
            <td><?php echo $tableau['name link'] ?></td>
            <td><?php echo $tableau['url link'] ?></td>
            <td><?php echo $tableau['categorie name']?></td>
            <td><a href="./edit.php?id=<?php echo $tableau['id link'] ?>">Edit</a> / <a href="./index.php?id=<?php echo $tableau['id link'] ?>">Delete</a></td>
        </tr>

    <?php endforeach ?>



    </table>
</div>

<?php

// Fin de la requète
$reponse-> closeCursor();


include 'f/footer.php';

?>

</body>
