<h1>Mon profil</h1>

<b>Mon adresse électronique :</b> <?= $util["mailU"] ?> <br />
<b>Mon pseudo :</b> <?= $util["pseudoU"] ?> <br />

<hr>

<h2>&nbspMes restaurants préférés</h2>
    <?php for($i=0;$i<count($mesRestosAimes);$i++){ ?>
        <a href="./?action=detail&idR=<?= $mesRestosAimes[$i]["idR"] ?>"><?= $mesRestosAimes[$i]["nomR"] ?></a><br />
    <?php } ?>
<hr>

<h2>&nbspMes saveurs préférées</h2>
    <ul id="tagFood">		
        <?php for($i=0;$i<count($mesTypesCuisineAimes);$i++){ ?>
            <li class="tag"><span class="tag">#</span><?= $mesTypesCuisineAimes[$i]["libelleTC"] ?></li>
        <?php } ?>
    </ul>
<hr><br>
<a href="./?action=deconnexion"><img src="images/deconnexion.png" class="disconnect"/>&nbspSe déconnecter</a>


