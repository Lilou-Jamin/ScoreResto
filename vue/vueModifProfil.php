<h1>Mon profil</h1>

<b>Mon adresse électronique :</b> <?= $util["mailU"] ?> <br />
<b>Mon pseudo :</b> <?= $util["pseudoU"] ?> <br />

<hr>
<form action="./?action=updProfil" method="POST" class="form_pseudo">
        <h2>&nbspModifier mon pseudo</h2>
        <input type="text" name="pseudoU" placeholder="Entrez un nouveau pseudo"></li><br>
        <input type="submit" value="Enregistrer"> 
    <span id="alerte"><?= $msgpseudo ?></span>
    <hr>
</form>


<form action="./?action=updProfil" method="POST" class="form_mdp">
        <h2>&nbspModifier mon mot de passe</h2>
        <input type="password" name="mdpU" placeholder="Entrez un nouveau mot de passe"></li><br>
        <input type="password" name="mdpUconfirm"placeholder="Confirmez le nouveau mot de passe"></li><br>
        <input type="submit" value="Enregistrer"> 
    <span id="alerte"><?= $msgmdp ?></span>
    <hr>
</form>

<form action="./?action=updProfil" method="POST" class="form_restopref">
    <h2>&nbspMes restaurants favoris</h2>
    <ul id="tagFood">		
        <?php for($i=0;$i<count($mesRestosAimes);$i++){ ?>
            <input type="checkbox" name="resto[]" value=<?=$mesRestosAimes[$i]["idR"]?>><a href="./?action=detail&idR=<?= $mesRestosAimes[$i]["idR"]?>"><?= $mesRestosAimes[$i]["nomR"]?> </a><br>
        <?php } ?>
    <input type="submit" value="Supprimer"> 
    </ul>
    <hr>
</form>

<form action="./?action=updProfil" method="POST" class="form_cuisinedel">
    <h2>&nbspMes saveurs préférées</h2>
    <ul id="tagFood">		
        <?php for($i=0;$i<count($mesTypesCuisineAimes);$i++){ ?>
            <input type="checkbox" name="delTypeCuisine[]" value=<?=$mesTypesCuisineAimes[$i]["idTC"]?>><li class="tag"><span class="tag">#</span><?= $mesTypesCuisineAimes[$i]["libelleTC"] ?></li><br>
        <?php } ?>
    <input type="submit" value="Supprimer"> 
    </ul>
    <hr>
</form>

<form action="./?action=updProfil" method="POST" class="form_cuisineaimer">
    <h2>&nbspTous les types de cuisine</h2>
    <ul id="tagFood">		
        <?php for($i=0; $i<count($lesTypesCuisineNonPreferes);$i++){?>
                <input type="checkbox" name="typeCuisine[]" value=<?=$lesTypesCuisineNonPreferes[$i]["idTC"]?>><li class="tag"><span class="tag">#</span><?= $lesTypesCuisineNonPreferes[$i]["libelleTC"] ?></li><br>
        <?php } ?>
    <input type="submit" value="Ajouter"> 
    </ul>
</form>


