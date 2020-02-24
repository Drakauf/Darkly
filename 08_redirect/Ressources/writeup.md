# Redirect Url

Dans le `footer` du site nous pouvons voir des logos de réseaux sociaux qui redirigent vers le site officiel du logo.

Mais la manière dont cette redirection est faite est une faille qui peux être exploitée pour rediriger vers un site malveillant d'un attaquant.

## Explication:

Lorsque nous regardons de près l'url qui est appellée par le footer pour rediriger vers le réseau social, nous pouvons voir qu'elle est construite comme ceci: `http://[IP]/index.php?page=redirect&site=instagram`.

Deux paramètre sont passé dans l'url, `page` et `site`:

 - `page` est le nom de la page, ici c'est `redirect` pour dire au site que nous voulons une redirection

 - `site` est un paramètre qui doit être le site distant ou nous voulons arriver en cliquant dessus, ici `instagram`

Nous pouvons donc essayer de remplacer le site distant dans l'url par un autre site, par exemple `https://github.com/Drakauf/Darkly`

La nouvelle url serais sembable à celle-ci: `http://[IP]/index.php?page=redirect&site="https://github.com/Drakauf/Darkly"`

Essayons...

Avec cette nouvelle url nous tombons sur une page avec le flag. Nous avons réussi !!

```
GOOD JOB HERE IS THE FLAG : B9E775A0291FED784A2D9680FCFAD7EDD6B8CDF87648DA647AAF4BBA288BCAB3
```

## Pourquoi c'est une faille ?

Ce que nous venons de faire est une faille, car si un attaquant intercepte la requête http et la modifie à la place de vous envoyer sur le site officiel d'instagram, il peut vous envoyer sur une copy d'instagram dans la quelle il pourrait récupérer les identifiants que vous rentrez...

## Comment s'en protéger ?

Pour se protéger de cette faille, nous pouvons écrire en dur dans le code de la page le site lié à l'image et mettre l'url d'instagram sans passer par une autre page de notre site qui elle fera la redirection.

## Documentation:

[url](https://www.vaadata.com/blog/fr/comprendre-les-vulnerabilites-web-en-5-min-episode-10-redirections-et-renvois-non-valides/)