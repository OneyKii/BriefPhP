<!-- v3.4.7 - OneyKii 
        AIDE DE LA PART DE Ludovic, Gabriel & Thomas
        Je comprend le code mais j'aurais eu besoin de plus de temps pour le faire
        Si il n'aurait pas été là.
-->
<link rel="stylesheet" href="h/header.css">
<link rel="stylesheet" href="f/footer.css">
<link rel="stylesheet" href="edit.css">
<link rel="stylesheet" href="background.css">
<title>Modifier | BookmarkV3</title>
<?php

include 'c/connexion.php';
include 'h/header.php';

$checked = '';

/// Modifie des données si "post" name est rempli
if (isset($_POST["name"]) && $_POST["url"]) {
    $stmt = $db->prepare('UPDATE link SET link.name = :name , link.url = :url WHERE link.id = :idama');

        $stmt->bindParam(':idama', $_POST['id']);
        $stmt->bindParam(':name', $_POST['name']);
        $stmt->bindParam(':url', $_POST['url']);

    $stmt->execute();

$stmt->closeCursor();
};
    $stmt2 = $db->prepare('UPDATE link_categories SET id_cat = :cat WHERE id_link = :idama');

        $stmt2 ->bindParam(':idama', $_POST['id']);
        $stmt2 ->bindParam(':cat', $_POST['categorie']);

    $stmt2 ->execute();

$stmt2 ->closeCursor();



// Cherche les éléments dans la base de donnée (1/3)

$affichage = $db->prepare('SELECT c.id as "category id s" FROM link_categories AS s INNER JOIN categories AS c ON c.id = s.id_cat WHERE id_link = :idurl');
    $affichage->bindParam(':idurl', $_GET['id']);

    $affichage->execute();
$result3 = $affichage->fetchAll();

// Cherche les éléments dans la base de donnée (2/3)

$reponse = $db->prepare('SELECT l.name as "name link", l.url as "lien link", l.id as "id link" FROM link as l where l.id = :idurl');
    $reponse->bindParam(':idurl', $_GET['id']);

    $reponse->execute();
$result = $reponse->fetch();



// Cherche les éléments dans la base de donnée (1/3)

$reponse2 = $db->prepare('SELECT c.name as "name cat", c.id as "id cat" FROM categories as c');
    $reponse2->execute();
$result2 = $reponse2->fetchAll();
?>

    <form action="edit.php?id=<?php echo $_GET['id']?>" method="post">
        <input type="hidden" name="id" value=<?php echo $result["id link"]?>>
        <div class="form-group">
                <p>Modifier le nom</p>
            <input class="form-group" type="text" value="<?php echo $result["name link"]?>" name="name">
            
                <p>Modifier l'url</p>
            <input class="form-group" type="text" value="<?php echo $result["lien link"]?>" name="url">
        </div>
        <p>Modifier la catégorie</p>
        <p>
            
            <?php foreach($result2 as $resultat):?>
                    <?php 
                    // affiche les informations dans l'opérateur "radio"
                    foreach($result3 as $r3):
                        if($resultat['id cat'] == $r3['category id s']){
                            $checked='checked="checked"';
                        }
                        else{
                            $checked='';
                        }
                    endforeach;
                    ?>

                 <input type="radio" value="<?php echo $resultat["id cat"]?>" name="categorie" <?php echo $checked ?>><?php echo $resultat["name cat"]?>
            <?php endforeach; ?>
        </p>
        <p><input class="input-button" type="submit"></p>
    </form>

<?php
$reponse->closeCursor();
?>