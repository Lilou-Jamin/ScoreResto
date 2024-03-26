<?php

if ($_SERVER["SCRIPT_FILENAME"] == __FILE__) {
    $racine = "..";
}
include_once "$racine/modele/bd.critiquer.inc.php";

// Recuperation des donnees GET, POST, et SESSION
$idR = $_GET["idR"];

// Appel des fonctions permettant de recuperer les donnees utiles a l'affichage 
$mailU = getMailULoggedOn();
if ($mailU != "") {
    $crit = getCritiquerByMailU($idR, $mailU);
    if ($crit != false) {
        suppCrit($idR, $mailU);
    }
}

// Redirection vers le referer
header('Location: ' . $_SERVER['HTTP_REFERER']);
?>