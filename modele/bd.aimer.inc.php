<?php

include_once "bd.inc.php";

// Fonction qui récupère tous les restos qu'un utilisateur aime
function getAimerByIdR($mailU, $idR){
    try {
        $cnx = connexionPDO();
        $req = $cnx->prepare("select * from aimer where mailU=:mailU and idR=:idR");
        $req->bindValue(':mailU', $mailU, PDO::PARAM_STR);
        $req->bindValue(':idR', $idR, PDO::PARAM_INT);
        
        $req->execute();
        $resultat = $req->fetch(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        print "Erreur !: " . $e->getMessage();
        die();
    }
    return $resultat;
}

// Fonction qui ajoute un restaurant dans les restos préférés de l'utilisateur
function ajoutAimer($mailU, $idR) {
    $resultat = -1;
    try {
        $cnx = connexionPDO();
        $req = $cnx->prepare("insert into aimer (mailU, idR) values(:mailU,:idR)");
        $req->bindValue(':idR', $idR, PDO::PARAM_INT);
        $req->bindValue(':mailU', $mailU, PDO::PARAM_STR);
        
        $resultat = $req->execute();
    } catch (PDOException $e) {
        print "Erreur !: " . $e->getMessage();
        die();
    }
    return $resultat;
}

// Fonction qui supprime un restaurant des restos préférés de l'utilisateur
function suppAimer($mailU, $idR) {
    $resultat = -1;
    try {
        $cnx = connexionPDO();
        $req = $cnx->prepare("delete from aimer where idR=:idR and mailU=:mailU");
        $req->bindValue(':idR', $idR, PDO::PARAM_INT);
        $req->bindValue(':mailU', $mailU, PDO::PARAM_STR);
        
        $resultat = $req->execute();
    } catch (PDOException $e) {
        print "Erreur !: " . $e->getMessage();
        die();
    }
    return $resultat;
}


if ($_SERVER["SCRIPT_FILENAME"] == __FILE__) {
    // prog principal de test
    header('Content-Type:text/plain');

    echo "\n getAimerById(mailU, idR) : \n";
    print_r(getAimerById("mathieu.capliez@gmail.com", 1));

    echo "\n addAimer(\"mathieu.capliez@gmail.com\",1) : \n";
    print_r(addAimer("mathieu.capliez@gmail.com", 1));
}
?>