<?php
if ($_SERVER["SCRIPT_FILENAME"] == __FILE__) {
    $racine = "..";
}
include_once "$racine/modele/bd.aimer.inc.php";

// recuperation des donnees GET, POST, et SESSION
$idR = $_GET["idR"];

// appel des fonctions permettant de recuperer les donnees utiles a l'affichage 
$mailU = getMailULoggedOn();
if ($mailU != "") {
    $aimer = getAimerByIdR($mailU, $idR);

    if ($aimer == false) {
        ajoutAimer($mailU, $idR);
    } else {
        suppAimer($mailU, $idR);
    }
}

// redirection vers le referer
header('Location: ' . $_SERVER['HTTP_REFERER']);
?>