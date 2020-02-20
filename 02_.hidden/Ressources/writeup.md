<h1 align="center">
.hidden
</h1>

<p><b>Trouver le dossier : </b></p>

Les sites ont géneralement un fichier `robots.txt`.  
Le fichier robots.txt indique aux robots des moteurs de recherche quelles pages ou quels fichiers le robot peut ou ne peut pas demander à un site. Ceci est utilisé principalement pour éviter de surcharger un site avec des demandes.  
Sur la page `<IP>/robots.txt` nous pouvons trouver les dossiers `/.hidden` et `/whatever`.  
Nous allons nous focus sur le premier dans cette solution.

<p><b> Récupérer le dossier en local :</b></p>

Nous allons récupérer le dossier en local afin d'avoir un accès plus rapide et simple au dossiers et fichiers enfants à .hidden:  
```wget -r -np -e robots=off -R "index.html*" http://<IP>/.hidden/```  
`-r` : recursive  
`-np` : permet de ne pas remonter dans les repertoires parents  
`-e` : Exécute commande comme si elle faisait partie de .wgetrc  
`-R` : spécifie la liste des suffixes ou modèles de noms de fichiers qui doivent être acceptés ou rejetés   

Un dossier au nom de l'IP est créé et contient le dossier .hidden ainsi que les dossiers et fichiers enfants de celui-ci.  

<p><b> Recuperation du flag :</b></p>

Nous avons constaté que tout les dossiers contenaient un dossiers fils ou un fichier `README`.  
Ces fichiers ont une phrases chacune nous indiquants que nous étions tombé sur le mauvais :  
  
```Demande à ton voisin de gauche```  
```Demande à ton voisin de droite  ```  
```Tu veux de l'aide ? Moi aussi !```  
```Non ce n'est toujours pas bon ...```  
  
Et d'autre...    
Nous avons donc pense que l'un des fichiers readme contenais le flag a trouver.  
Nous avons donc fait la recherche d'un fichier contenant un chiffre (ici le 8) :   
![grep -r "8" .*](../../assets/flag.hidden.png)

<p><b> Solution : </b></p>
Ne pas rendre ce genre de fichiers publique serait un bon début.</br>
Utiliser un .htaccess est préférable.
