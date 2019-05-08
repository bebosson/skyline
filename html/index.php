<!DOCTYPE html>
<html>

<head>
     <meta charset="utf-8" />
     <title>Hip-Hop: Golden years</title>

     <style type="text/css">
     <!--
         * { margin: 0; padding: 0; }

         img#frise { display: block; width: 100%; height: 30px; }

         div#titre { background-color: black; text-align: center; height: 60px; position: relative; }
         #titre img { position: absolute; top: 5px; left: 25%; height: 50px; width: 40px; }
         #titre h1, #titre h2 { margin: 0 auto; width: 200px; color: black; }
         #titre h1 { background-color: gold; }
         #titre h2 { position: relative; top: -10px; left: 50px; }

         h2#titre_fixe { position: fixed; top: 200px; left: 10px;
                         width: 90px; padding: 20px;
                         background-color: gold; text-align: left; }

         div#galerie { position: relative; top: 90px; left: 120px; }
         #galerie img { float: left; width: 200px; height: 230px; margin: 20px; border: 0px solid; position: relative }
     -->
	#connexion{ 
		color: #cccc00 ;position : fixed; 
	}
     </style>

</head>

<body>

     <!-- Frise (image avec des nuages) pour vérifier que l'arbre se positionne bien en absolu dans son bloc <div> parent, et non dans <body>           -->

     <!-- Sur IE6, un espacement vertical apparaît entre la frise (nuage) et le bloc titre => solution pour cette ancienne version de navigateur :
             - soit supprimer espaces et sauts de ligne entre la fin de la balise image et la balise <div> qui la suit
	     - soit encadrer l'image de la frise par un bloc <div>...</div>, sans espace ni saut de ligne entre la balise image et </div>         -->
<body background="jpg/microphone-wallpapers-30485-4857133.jpg">
     <div id="titre">
         <h1>HIP HOP</h1>
     </div>

     <h2 id="titre_fixe">BEST<br />ALBUMS<br />EVER</h2>

     <div id="galerie">
         <a href="https://en.wikipedia.org/wiki/Black_on_Both_Sides"><img src="jpg/MosDefBlackonBothSides.jpg" alt="Chêne" title="Chêne rouvre" border="0" /></a>
         <a href="https://en.wikipedia.org/wiki/To_Pimp_a_Butterfly"><img src="png/Kendrick_Lamar_-_To_Pimp_a_Butterfly.png" alt="Pin" title="Pin sylvestre" /></a>
         <a href="https://en.wikipedia.org/wiki/Midnight_Marauders"><img src="jpg/ATCQMidnightMarauders.jpg" alt="Cognassier" title="Cognassier" /></a>
         <a href="https://en.wikipedia.org/wiki/Illmatic"><img src="jpg/220px-IllmaticNas.jpg" alt="Palmier" title="Palmier à bétel" /></a>
         <a href="https://en.wikipedia.org/wiki/Moment_of_Truth_(Gang_Starr_album)"><img src="jpg/Gangstarrmomentoftruth.jpg" alt="Pommier" title="Pommier" /></a>
	 <a href="https://en.wikipedia.org/wiki/All_Eyez_on_Me"><img src="jpg/Alleyezonme.jpg" alt="Saule" title="Saule blanc" /></a>
	 <a href="https://en.wikipedia.org/wiki/1999_(Joey_Badass_album)"><img src="jpg/1999_Joey_Badass.jpg" alt="Saule" title="Saule blanc" /></a>
	 <a href="https://en.wikipedia.org/wiki/KOD_(album)"><img src="jpg/220px-JColeKOD.jpg" alt="Saule" title="Saule blanc" /></a>
	 <a href="https://en.wikipedia.org/wiki/A_Long_Hot_Summer"><img src="jpg/Alonghotsummer.jpg" alt="Saule" title="Saule blanc" /></a>
     </div>
     <div id="connexion">
	<label>Nom ou Pseudo</label>
	<input type = "text" name ="nom" />
	<label> Mot de passe </label>
	<input type ="password" name ="motdepasse" />
	<input type ="submit" value="Envoyer" />
     </div>
</body>

</html>


