<!-- v3.4.7 - OneyKii 
        AIDE DE LA PART DE Ludovic, Gabriel & Thomas
        Je comprend le code mais j'aurais eu besoin de plus de temps pour le faire
        Si il n'aurait pas été là.
-->
<link rel="stylesheet" href="header.css">
<link rel="stylesheet" href="footer.css">
<link rel="stylesheet" href="delete.css">
<link rel="stylesheet" href="background.css">
<?php

include 'c/connexion.php';
include 'header.php';

// supprime les informations dans la bdd à partir de l'ID
$stm = $db->prepare("DELETE FROM link WHERE id=:id");
$stm->bindParam(':id', $_POST['id']);
$stm->execute();

// affiche les informations de la bdd
$reponse = $db->query('SELECT name, url, id FROM link');

while ($donnees = $reponse->fetch()) {

?>


<form class="form-global" action="" method="post">

        <label for="name">Nom : </label> <input class="input-name" type="text" name="name" value="<?php echo $donnees["name"] ?>"/>
        <label for="url">Lien : </label> <input class="input-url" type="text" name="url" value="<?php echo $donnees["url"] ?>"/>

    <input type="hidden" name="id" value="<?php echo $donnees["id"] ?>"/>
    <input class="input-button" type="submit" value="delete"/>

</form>


<?php
}
include 'footer.php';
?>