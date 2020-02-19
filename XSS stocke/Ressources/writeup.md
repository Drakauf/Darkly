# Faille XSS stocké

Sur le formulaire pour les feedbacks il y a une faille d'injection de code.
L'exemple du site Darkly est un peu exagéré parce que juste le mot `scritpt` ou `alert` fait sauter le flag.

Les failles XSS ou Cross-Site Scripting sont très communes sur Internet.
Cette faille peut être de trois types :

* Faille XSS stockée (stored XSS) : quand le code injecté est stocké sur le serveur.
C'est le cas de la page de feedback et le code JavaScript sera exécuté sur tous les navigateurs.

* Faille XSS reflétée (reflected XSS) : quand le contenu n'est pas stocké sur le serveur, mais celui-ci est récupéré de l'URL (par exemple) et exécuté sur le navigateur.

* Faille XSS basée sur le DOM (DOM based XSS) : quand le code JavaScript n'est pas envoyé au serveur, mais il est exécuté sur le navigateur.

Pour éviter ces attaques, il faut toujours faire attention à toutes les données qui proviennent de l'utilisateur.
Dans ce cas, il faut "sanitizer" les informations de l'utilisateur avec des fonctions comme `htmlspecialchars` en PHP.