# Redirect Url

Dans le `footer` du site nous pouvons voir des logos de réseaux sociaux qui une fois cliquer dessus ils redirigent vers le site officiel du logo.

Mais la manière de la quelle cette redirection est une faille qui peux être exploiter pour rediriger vers un site malveillant d'un attaquant.

## Explication:

Lorsque nous regardons d'un peux plus près l'url qui est appellé par le footer pour rediriger vers le réseau social, nous pouvons voir qu'elle est construite comme ceci: `http://[IP]/index.php?page=redirect&site=instagram`.

Deux paramètre sont passé dans l'url, `page` et `site`:

 - `page` est le nom de la page ici c'est `redirect` pour dire au site que nous voulons une redirection

 - `site` est un paramètre qui doit être le site distant ou nous voulons arriver en cliquant dessus, ici `instagram`

Nous pouvons donc essayer de remplacer le site distant dans l'url par un autre site, par exemple `https://github.com/Drakauf/Darkly`

La nouvelle url serais sembable à celle-ci: `http://[IP]/index.php?page=redirect&site="https://github.com/Drakauf/Darkly"`

Essayons...

Avec cette nouvelle url nous tombons sur une page avec le flag. Nous avons réussi !!

```
GOOD JOB HERE IS THE FLAG : B9E775A0291FED784A2D9680FCFAD7EDD6B8CDF87648DA647AAF4BBA288BCAB3
```

## Pourquoi c'est une faille ?

Ce que nous venons de faire est une faille, car si un attaquant intercepte la requête sql et la modifie à la place de vous envoyer sur le site officiel d'instagram, il peut vous envoyer sur une copy d'instagram dans la quelle il pourrait récupérer vos identifiants que vous rentrez...

## Comment s'en protéger ?

Pour ce protéger de cette nous pouvons, écrire en dur dans le code de la page le site lier à l'image et mettre l'url d'instagram sans passer par une autre page de notre site qui elle feras la redirection.

## Documentation:

[url]()