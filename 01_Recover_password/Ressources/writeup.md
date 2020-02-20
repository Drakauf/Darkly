# Faille envoie mail

Sur `http://[IP]/?page=recover` on voit un page de récupération de mot de passe un peu bizarre car il y a juste un button.
Si on l'inspecte on voit qu'il y a un petit formulaire avec un input hidden qui contient une adresse mail en dur.

Pour avoir le flag il faut juste changer l'adresse mail et faire clic sur submit.

Cette faille permet d'envoyer des mails provenant du site à n'importe qui.

On peut utiliser le script `mailSpam.sh` avec l'adresse ip cible, un mail et le nombre de messages à envoyer pour exploiter la faille.

Pour se proteger de cette faille il ne faut surtout pas faire confiance aux données envoyées par l'utilisateur.
Ce mail pourrait être directement sur le serveur ou on pourrait toujour vérifier l'information avant d'envoyer le mail.
En plus, normalement, on demande a l'utilisateur son mail pour pouvoir le reconnaître et lui envoyer les instructions.