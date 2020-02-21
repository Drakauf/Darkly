<h1 align="center">
db_default
</h1>

<p><b> La base de donnee : </b></p>

Sur la page Member, nous pouvons voir un champs qui permet de recuperer le nom et prenom d'un membre en entrant son id.
En testant un peu (`1 or true`) on peux se rendre compte que la requete est mal faite (surement une requete pas prepare).
Nous allons donc recuperer les informations de la base de donnee avec `information_schema`.
Etant donne que nous avons une requete de base qui recupere 2 informations depuis la base de donnee, nous somme limite a ce meme nombre pour nos requetes, dans le cas contraire nous avons une erreur, exemple :
```
1 UNION SELECT * FROM information_schema.tables
```
==> 
```
The used SELECT statements have a different number of columns
```

Nous allons d'abord recuperer les nom des tables ainsi que les types : 
```
1 UNION SELECT table_name, table_type FROM information_schema.tables
```
Nous pouvons constater qu'il y a 5 tables de type "BASE" : `db_default`, `users`, `guestbook`, `list_images`, `vote_dbs`.

<p><b> La base db_default :</b></p>

Nous soupconnons la base `db_default` d'etre la premiere base cree avec un/des utilisateur(s) pour gerer le site. Un/des utilisateur(s) ayant les droits d'administrateur.
Recuperons d'abord le nom de la base de donnee a laquelle appartient la table `db_default`:
![base_db_default](../../assets/base_db_default.png)
La table `db_default` appartient donc a la base `Member_Brute_Force`.
Nous allons ensuite recupere les noms de colones de la table `db_default` afin de pouvoir faire nos requetes suivantes :
![columns_db_default](../../assets/columns_db_default.png)
La table a donc 3 colones, `id`, `username` et `password`.
<p><b> Recuperation du flag :</b></p>

![names_db_default](../../assets/names_db_default.png)
Nous pouvons voir qu'il y a un user root et un user admin ayant la meme valeur en password.
`3bf1114a986ba87ed28fc1b5884fc2f8` est le cryptage MD5 de `shadow`.
Il nous reste donc a nous connecter avec le username admin ou root et le mot de passe `shadow` pour obtenir le flag.
