<h1>Connexion</h1>
<form action="./?action=connexion" method="POST">

    <input type="text" name="mailU" placeholder="Email de connexion" /><br />
    <input type="password" name="mdpU" placeholder="Mot de passe"  /><br />
    <input type="submit" />
</form>

<span id="alerte"><?= $msgconn ?></span>
<br />
<a href="./?action=inscription"><img src="images/inscription.png" class="disconnect"/>&nbspInscription</a>

<hr><br>
Utilisateur de test : <br />
Login : test@bts.sio<br />
Mot de passe : sio

