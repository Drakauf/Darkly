# Faille permissions

## Le flag

Dabord on a vérifié s'il y avait un fichier `robots.txt` utiliser pour donner des instructions aux `spiders` ou robots des moteurs de recherche.
Sur le fichier `/robots.txt` il y avait deux instructions pour ne pas indexer deux dossiers.

```
User-agent: *
Disallow: /whatever
Disallow: /.hidden
```

Sur `http://10.2.8.38/whatever/` il y avait un fichier `htpasswd` avec des identifiants.

```
root:8621ffdbc5698829397d97767ac13db3
```

On a décrypté ce qui ressamblait à un mot de passe en md5 et on a obtenu `dragon`.

Après avoir testé sur la page de login sans succèss on a utilisé l'util [dirb](https://github.com/v0re/dirb) pour voir les différentes parties du site.

```shell script
-----------------
DIRB v2.22
By The Dark Raver
-----------------

START_TIME: Fri Feb 21 19:33:17 2020
URL_BASE: http://10.2.8.38/
WORDLIST_FILES: wordlists/common.txt

-----------------

GENERATED WORDS: 4612

---- Scanning URL: http://10.2.8.38/ ----
==> DIRECTORY: http://10.2.8.38/admin/
==> DIRECTORY: http://10.2.8.38/audio/
==> DIRECTORY: http://10.2.8.38/css/
==> DIRECTORY: http://10.2.8.38/errors/
+ http://10.2.8.38/favicon.ico (CODE:200|SIZE:1406)
==> DIRECTORY: http://10.2.8.38/fonts/
==> DIRECTORY: http://10.2.8.38/images/
==> DIRECTORY: http://10.2.8.38/includes/
+ http://10.2.8.38/index.php (CODE:200|SIZE:6892)
==> DIRECTORY: http://10.2.8.38/js/
+ http://10.2.8.38/robots.txt (CODE:200|SIZE:53)
==> DIRECTORY: http://10.2.8.38/whatever/
[...]
```

On peut voir qu'il y a une section `/admin`. Si on essaie de se connecter avec les idéntifiants `root` et `dragon` on voit le flag.

![flag admin](../../assets/flag_admin.png)

## Se protéger

Il est important de ne pas laiser des informations importantes dans les dossiers publiques de notre site.
On peut utiliser un fichier de configuration [htaccess](https://www.askapache.com/htaccess/htaccess-wikipedia/) pour restrindre l'accèss à certains endroits de notre site.
Les informations stockées comme les mot de passe doivent être cryptés avec un algorytme robuste.