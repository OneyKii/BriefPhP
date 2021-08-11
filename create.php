<!-- v3.4.7 - OneyKii 
        AIDE DE LA PART DE Ludovic, Gabriel & Thomas
        Je comprend le code mais j'aurais eu besoin de plus de temps pour le faire
        Si il n'aurait pas été là.
-->
<link rel="stylesheet" href="background.css">
<link rel="stylesheet" href="create.css">
<link rel="stylesheet" href="h/header.css">
    <link rel="stylesheet" href="f/footer.css">
    <title>Créer | BookmarkV3</title>
<?php

include 'c/connexion.php';
include 'h/header.php';

$reponse2 = $db->prepare('SELECT c.name as "name", c.id as "id" FROM categories as c');
$reponse2->execute();

    $result2 = $reponse2->fetchAll();


if (isset ($_POST['nom']) && $_POST['url']){
    $stmt = $db->prepare('INSERT INTO links (name, url) VALUES(:name, :url)');

        $stmt->bindParam(':name', $_POST['name'], PDO::PARAM_STR);
        $stmt->bindParam(':url', $_POST['url'], PDO::PARAM_STR);

    $stmt->execute();


    $last_id = $db->lastInsertId();
    $stmt = $db->prepare('INSERT INTO link_categories ( id_link, id_cat ) VALUES( :idl, :idcc )');

        $stmt->bindParam(':idl', $last_id);
        $stmt->bindParam(':idcc', $_POST['radios']);

    $stmt->execute();

$stmt->closeCursor();
};
?>

<body>
    <a href="./index.php">Retour</a>
    <form action="form.php" method="post">
        <p class="input-p-name">Nom du bookmark</p> <input class="form-control" type="text" name="inputname">
        <p  class="input-p-name">URL du bookmark</p> <input class="form-control" type="text" name="inputurl">
        <p>

            <?php foreach($result2 as $resultat):?>
                <input type="radio" value="<?php echo $resultat["id"]?>" name="radios"><?php echo $resultat["name"]?>
            <?php endforeach; ?>

        </p>
        <input class="btn-input-submit" type="submit" name="submit">
    </form>
</body>

<?php include 'f/footer.php'; ?>