<?php

include_once "bd.utilisateur.inc.php";

function login($mailU, $mdpU) {
    if (!isset($_SESSION)) {
        session_start();
    }

    $util = getUtilisateurByMailU($mailU);
    if ($util){
      $mdpBD = $util["mdpU"];
    }
    else {
        $mdpBD="";
    }
    $conn = false; // Par défaut, la connexion n'est pas faite

    if ($mdpBD != ""){
        if (trim($mdpBD) == trim(crypt($mdpU, $mdpBD))) {
            // le mot de passe est celui de l'utilisateur dans la base de donnees
            $_SESSION["mailU"] = $mailU;
            $_SESSION["mdpU"] = $mdpBD;
            $conn = true;
        }
    }
    return $conn;
}

function logout() {
    if (!isset($_SESSION)) {
        session_start();
    }
    unset($_SESSION["mailU"]);
    unset($_SESSION["mdpU"]);
}

function getMailULoggedOn(){
    if (isLoggedOn()){
        $ret = $_SESSION["mailU"];
    }
    else {
        $ret = "";
    }
    return $ret;
        
}

function isLoggedOn() {
    if (!isset($_SESSION)) {
        session_start();
    }
    $ret = false;

    if (isset($_SESSION["mailU"])) {
        $util = getUtilisateurByMailU($_SESSION["mailU"]);
        if ($util["mailU"] == $_SESSION["mailU"] && $util["mdpU"] == $_SESSION["mdpU"]
        ){
            $ret = true;
        }
    }
    return $ret;
}

if ($_SERVER["SCRIPT_FILENAME"] == __FILE__) {
    // prog principal de test
    header('Content-Type:text/plain');


    // test de connexion
    login("test@bts.sio", "sio");
    if (isLoggedOn()) {
        echo "logged";
    } else {
        echo "not logged";
    }

    // deconnexion
    logout();
}
?>