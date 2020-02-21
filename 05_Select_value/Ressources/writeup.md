# Faille select value

Sur la page `http://[IP]/?page=survey` il y a une table pour voter avec un select et plusieurs options.
Un utilisateur peut modifier la valeur d'une option et envoyer des données qui n'étaient prévues de base.
Comme on dit toujours, `on ne doit jamais faire confiance aux données envoyées par l'utilisateur`.
Si on ne fait pas des vérifications de ces données sur le serveur, on aura une faille.

Pour éviter cette faille, il faut contrôler coté serveur si les valeurs reçues correspondent bien aux valeurs possibles.