# Changer le header de la requête HTTP

## Prémuble

Quand nous demandons une page via le protocole HTTP ou HTTPS nous transméttons des données dans l'en-tête de la requête (invisibles pour les moldus).

Ce sont des données en touts genre comme le nom du navigateur, les cookies de la session, ou bien encore la pages d'où nous venions...

## Explication

Quand nous explorons un peu le code du site web, nous pouvons voir que dans le `footer` du site il y a un lien un peu étrange, celui du copyright `© BornToSec` qui nous redirige vers cette url `http://192.168.56.103/index.php?page=e43ad1fdc54babe674da7c7b8f0127bde61de3fbe01def7d00f151c2fcca6d1c`.

Sur cette page, si nous continons l'exploration du code source de la page, nous trouvons des commentaires html très long:

```
<!--
Voila un peu de lecture :

MAN (42) EPITECH

NAME
EPITECH ou {EPITECH.}

SYNOPSIS
École d'informatique en 5 ans après bac. [...] la page de discussion). </poll>
-->
<!--
Fun right ?
source: desencyclopedie.
Good bye  !!!!
-->
<!--
You must cumming from : "https://www.nsa.gov/" to go to the next step
-->
<!--
Voici un article pas mal :

France – La menace d’une chanson [...] fait ? »

source:legarofi
-->
<!--
				Let's use this browser : "ft_bornToSec". It will help you a lot.
-->
```

Nous pouvons voir qu'il nous donnes des indices pour récuperer le flag que contient la page, il faudrait venir du site de la [nsa](https://www.nsa.gov/) en utilisant le navigateur `ft_bornToSec`.

Pour réussir ce challenge nous devons donc modifier le header HTTP de la requête, pour cela il existe une commande magique `curl`.

Avec cette commande, et ces paramètre nous pourrons récupérer la page avec le flag: `curl --user-agent "ft_bornToSec" --referer https://www.nsa.gov/ http://192.168.56.103/index.php\?page\=e43ad1fdc54babe674da7c7b8f0127bde61de3fbe01def7d00f151c2fcca6d1c`

Petit explication de la commande:

`--user-agent "ft_bornToSec"` est un paramètre qui prendras le prochain argument comme user-agent, c'est à dire le nom du navigateur que nous voulons utiliser

`--referer https://www.nsa.gov/` ce paramètre si, demanderas en arguments une url celle que nous voulons et qui serviras pour dire de quel site nous venons.

Le reste est la page que nous demendons.

Voici le résultat de la commande:

```html
<!DOCTYPE HTML>
<html>
	<head>
		<title>BornToSec - Web Section</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		[...]
	</head>
	<body class="landing">
		<!-- Header -->
		<header id="header" >
								<a href=http://192.168.56.103><img src=http://192.168.56.103/images/42.jpeg height=82px width=82px/></a>
								<nav id="nav">
					<ul>
						<li><a href="index.php">Home</a></li>
						<li><a href="?page=survey">Survey</a></li>
						<li><a href="?page=member">Members</a></li>
					</ul>
				</nav>
			</header>

		<!-- Main -->
			<section id="main" class="wrapper">
				<div class="container" style="margin-top:75px">
<center><h2 style="margin-top:50px;"> The flag is : f2a29020ef3132e01dd61df97fd33ec8d7fcd1388cc9601e7db691d17d4d6188</h2><br/><img src="images/win.png" alt="" width=200px height=200px></center> <audio id="best_music_ever" src="audio/music.mp3"preload="true" loop="loop" autoplay="autoplay">
</audio>
<script language="javascript">function coucou(){document.getElementById('best_music_ever').play();}</script>

Les Diomédéidés [...] planeurs.
<p style="font-size:0.8em; font-style:italic; color:#666; text-transform: none;"><a href="https://fr.wikipedia.org/wiki/Albatros">Source: Wikipedia</a></p>
<br />
<center><a href="https://www.youtube.com/watch?v=Bznxx12Ptl0"><img src="images/albatroz.jpg" onload="coucou()"/></a></center>
<!--
[...]
-->
				</div>
			</section>
		<!-- Footer -->
			<footer id="footer">
				<div class="container">
					<ul class="icons">
						<li><a href="index.php?page=redirect&site=facebook" class="icon fa-facebook"></a></li>
						<li><a href="index.php?page=redirect&site=twitter" class="icon fa-twitter"></a></li>
						<li><a href="index.php?page=redirect&site=instagram" class="icon fa-instagram"></a></li>
					</ul>
					<ul class="copyright">
						<a href="?page=e43ad1fdc54babe674da7c7b8f0127bde61de3fbe01def7d00f151c2fcca6d1c"><li>&copy; BornToSec</li></a>
					</ul>
				</div>
			</footer>
	</body>
</html>
```

Dans la page que nous venons de récuperer nous pouvons y trouver le flag: `f2a29020ef3132e01dd61df97fd33ec8d7fcd1388cc9601e7db691d17d4d6188`.

## Pourquoi ceci est une faille ?

Çe writeup peut-être une faille car la chaîne `user-agent` est traiter par les serveurs web, pour délivrer une page web plus adapter à l'appareil utiliser par l'utilisateur.

Des vulnérabilitées ont été découvertes sur les serveurs web, qui permet d'envoyer un shellshock via l'user-agent qui donne un accèss à `bash`.

## Solution

Une solution pour éviter cette faille est de mettre en place un script qui met à jour régulièrement les packages du serveur automatiquement, pour que les correctifs du serveurs web soit appliqué.

## Documentation

https://betanews.com/2017/03/22/user-agent-based-attacks-are-a-low-key-risk-that-shouldnt-be-overlooked/
