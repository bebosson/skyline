<?php

$nom = $_POST["nom"];
$qui = $_POST["qui"];
$passe = $_POST["motdepasse"];

$texte = "NOM : $nom\n";
$texte = $texte . "Qui etes vous : $qui\n";
$texte = $texte .  "Mot De Passe : \n". $passe;
$texte = stripslashes($texte);
?>
