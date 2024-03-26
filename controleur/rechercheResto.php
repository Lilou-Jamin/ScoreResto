<?php
if ( $_SERVER["SCRIPT_FILENAME"] == __FILE__ ){
    $racine="..";
}
include_once "$racine/modele/bd.resto.inc.php";
include_once "$racine/modele/bd.typecuisine.inc.php";
include_once "$racine/modele/bd.photo.inc.php";

// creation du menu burger
$menuBurger = array();
$menuBurger[] = Array("url"=>"./?action=recherche&critere=nom","label"=>"Recherche par nom");
$menuBurger[] = Array("url"=>"./?action=recherche&critere=adresse","label"=>"Recherche par adresse");
$menuBurger[] = Array("url"=>"./?action=recherche&critere=typecuisine","label"=>"Recherche par type de cuisine");
$menuBurger[] = Array("url"=>"./?action=recherche&critere=multicriteres","label"=>"Recherche par type de cuisine et/ou par adresse");

$lesTypesCuisineNonPreferes = getTypesCuisine();

// critere de recherche par defaut
$critere = "nom";
if (isset($_GET["critere"])) {
    $critere = $_GET["critere"];
}

// recuperation des donnees GET, POST, et SESSION
if (isset($_GET["critere"])){
    $critere = $_GET["critere"];
}
$nomR="";
if (isset($_POST["nomR"])){
    $nomR = $_POST["nomR"];
}
$voieAdrR="";
if (isset($_POST["voieAdrR"])){
    $voieAdrR = $_POST["voieAdrR"];
}
$cpR="";
if (isset($_POST["cpR"])){
    $cpR = $_POST["cpR"];
}
$villeR="";
if (isset($_POST["villeR"])){
    $villeR = $_POST["villeR"];
}
$tabIdTC = array();
if(isset($_POST["tabIdTC"])){
    $tabIdTC = $_POST["tabIdTC"];
}
$typeCuisine = array();
if(isset($_POST["typeCuisine"])){
    $typeCuisine = $_POST["typeCuisine"];
}


// Appel des fonctions permettant de recuperer les donnees utiles a l'affichage 
switch($critere){
    case 'nom':
        // Recherche par nom
        $listeRestos = getRestosByNomR($nomR);
        break;
    case 'adresse':
        // Recherche par adresse
        $listeRestos = getRestosByAdresse($voieAdrR, $cpR, $villeR);
        break;
    case 'typecuisine':
        // Recherche par type de cuisine
        $listeRestos = array();
        foreach($typeCuisine as $i){
            $restos = getRestosByTypeCuisine($i, $voieAdrR, $cpR, $villeR);
            foreach($restos as $r){
                array_push($listeRestos, $r);
            }            
        }
        break;
    case 'multicriteres':
        // Recherche par type de cuisine et/ou par adresse
        $listeRestos = array();
        foreach($typeCuisine as $i){
            $restos = getRestosByTypeCuisine($i, $voieAdrR, $cpR, $villeR);
            foreach($restos as $r){
                array_push($listeRestos, $r);
            }            
        }
        break;
}

// Appel du script de vue qui permet de gerer l'affichage des donnees
$titre = "Recherche d'un restaurant";
include "$racine/vue/entete.html.php";
include "$racine/vue/vueRechercheResto.php";
if (!empty($_POST)) {
    // affichage des resultats de la recherche
    include "$racine/vue/vueResultRecherche.php";
}
include "$racine/vue/pied.html.php";
?>