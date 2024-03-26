
<h1>Recherche d'un restaurant</h1>
<form action="./?action=recherche&critere=<?= $critere ?>" method="POST">

    <?php
    switch ($critere) {
        case "nom":
            ?>
            Recherche par nom : <br />
                <input type="text" name="nomR" placeholder="Nom" value="<?= $nomR ?>" />
            <?php
            break;

        case "adresse":
            ?>
            Recherche par adresse : <br />
                <input type="text" name="villeR" placeholder="Ville" value="<?= $villeR ?>"/><br />
                <input type="text" name="cpR" placeholder="Code postal" value="<?= $cpR ?>"/><br />
                <input type="text" name="voieAdrR" placeholder="Rue" value="<?= $voieAdrR ?>"/>
            <?php
            break;

        case "typecuisine":
            ?>
            Recherche par type de cuisine : <br>
            <?php for($i=0; $i<count($lesTypesCuisineNonPreferes);$i++){ ?>
                <input type="checkbox" name="typeCuisine[]" value=<?=$lesTypesCuisineNonPreferes[$i]["idTC"]?>><li class="tag"><span class="tag">#</span><?= $lesTypesCuisineNonPreferes[$i]["libelleTC"] ?></li><br>
            <?php } ?>
            <?php
            break;

        case "multicriteres":
            ?>
            Recherche par type de cuisine et adresse : <br>
            <?php for($i=0; $i<count($lesTypesCuisineNonPreferes);$i++){ ?>
                <input type="checkbox" name="typeCuisine[]" value=<?=$lesTypesCuisineNonPreferes[$i]["idTC"]?>><li class="tag"><span class="tag">#</span><?= $lesTypesCuisineNonPreferes[$i]["libelleTC"] ?></li><br>
            <?php } ?>
            
            Recherche par adresse : <br />
                <input type="text" name="villeR" placeholder="Ville" value="<?= $villeR ?>"/><br />
                <input type="text" name="cpR" placeholder="Code postal" value="<?= $cpR ?>"/><br />
                <input type="text" name="voieAdrR" placeholder="Rue" value="<?= $voieAdrR ?>"/>
            <?php
            break;
    }
    ?>
    <br />  
    <input type="submit" value="Rechercher"/>

</form>
