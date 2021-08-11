<?php

$username = 'root';
$password = '';

try {
    $db = new PDO('mysql:host=localhost;dbname=bookmark_v3;charset=utf8', $username, $password);
} catch (PDOException $e) {
    die('Erreur : ' . $e->getMessage());
}

?>