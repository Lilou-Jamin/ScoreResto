<?php
if ( $_SERVER["SCRIPT_FILENAME"] == __FILE__ ){
    $racine="..";
}

include_once "$racine/modele/authentification.inc.php";
include_once "$racine/modele/bd.utilisateur.inc.php";
include_once "$racine/modele/bd.typecuisine.inc.php";
include_once "$racine/modele/bd.resto.inc.php";
include_once "$racine/modele/bd.aimer.inc.php";

$menuBurger = array();
$menuBurger[] = Array("url"=>"./?action=profil","label"=>"Consulter mon profil");
$menuBurger[] = Array("url"=>"./?action=updProfil","label"=>"Modifier mon profil");

if(isLoggedOn()){
    $mailU = getMailULoggedOn();
    $util = getUtilisateurByMailU($mailU);
    $mesRestosAimes = getRestosAimesByMailU($mailU);
    $mesTypesCuisineAimes = getTypesCuisinePreferesByMailU($mailU);

    // Ajout d'une variable pour les types de cuisine non préférés
    $lesTypesCuisineNonPreferes = getTypesCuisineNonPreferesByMailU($mailU);

    // On initialise nos messages de succès à vide
    $msgpseudo = "";
    $msgmdp = "";

    $titre = "Modifier mon profil";

    // Modification du pseudo
    if(isset($_POST["pseudoU"])){
        $newPseudoU = $_POST["pseudoU"];
        if ($newPseudoU !=""){
            modifPseudoU($mailU, $newPseudoU); // Appel de la fonction spécifique à l'action
            $msgpseudo = "Vous avez changé votre pseudo avec succès"; // Affichage d'un message de succès de la fonction
        }
    }

    // Modification du mot de passe
    if(isset($_POST["mdpU"]) && isset($_POST["mdpUconfirm"])){
        $newMdpU = $_POST["mdpU"];
        $mdpUconfirm = $_POST["mdpUconfirm"];

        if ($newMdpU !="" && $mdpUconfirm !=""){
            if($newMdpU == $mdpUconfirm){
                modifMdpU($mailU, $newMdpU);
                $msgmdp = "Vous avez changé votre mdp avec succès";
            }
        }
    }

    // Suppression d'un restaurant préféré
    if(isset($_POST["resto"])){
        if(!empty($_POST["resto"])){
            foreach($_POST["resto"] as $value){
                suppAimer($mailU, $value);
            }
            header('Location: ' . $_SERVER['HTTP_REFERER']);
        }
    }

    // Suppression d'un type de cuisine préféré
    if(isset($_POST["delTypeCuisine"])){
        if(!empty($_POST["delTypeCuisine"])){
            foreach($_POST["delTypeCuisine"] as $value){
                suppTypeCuisine($mailU, $value);
            }
            header('Location: ' . $_SERVER['HTTP_REFERER']);
        }
    }

    // Ajout d'un type de cuisine préféré
    if(isset($_POST["typeCuisine"])){
        if(!empty($_POST["typeCuisine"])){
            foreach($_POST["typeCuisine"] as $value){
                ajoutTypeCuisine($mailU, $value);
            }
            header('Location: ' . $_SERVER['HTTP_REFERER']);
        }
    }

    include "$racine/vue/entete.html.php";
    include "$racine/vue/vueModifProfil.php";
    include "$racine/vue/pied.html.php";
}    
else{
    echo("Vous n'êtes pas connecté");
}






