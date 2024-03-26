<?php

if ($_SERVER["SCRIPT_FILENAME"] == __FILE__) {
    $racine = "..";
}
include_once "$racine/modele/bd.critiquer.inc.php";

// Recuperation des donnees GET, POST, et SESSION
$idR = $_GET["idR"];

// Appel des fonctions permettant de recuperer les donnees utiles a l'affichage 
// Traitement si necessaire des donnees recuperees
$mailU = getMailULoggedOn();
if ($mailU != "") {
    if(isset($_POST['noteCrit'])){
        $note = $_POST['noteCrit'];
        $commentaire = "";
        if(isset($_POST["comCrit"])){
            $commentaire = $_POST['comCrit'];}

        $crit = getCritiquerByMailU($mailU, $idR);
        if ($crit == false) {
            ajoutCrit($mailU, $idR, $note, $commentaire);}
    }
}

// Redirection vers le referer
header('Location: ' . $_SERVER['HTTP_REFERER']);
?>