# Modèles de présentations pour l'Université de Lille

Des fichiers présents ici s'adressent aux personnes qui veulent des modèles de
présentation *propres* (c'est-à-dire avec exigence sur la qualité du résultat)
utilisant l'identité de l'[Université de Lille](http://www.univ-lille.fr).

Ça s'adresse aussi aux personnes qui ne connaissent pas très bien le système
de composition de texte [LaTeX](https://www.latex-project.org) ou qui débutent
dans son utilisation ou dans l'utilisation de son paquet
[beamer](https://github.com/josephwright/beamer) prévu pour préparer des
présentations.

L'objet est de faciliter la production de support de présentation
(*Powerpoint* en novlangue) avec un rendu simple mais spécifique.

Pour ceux qui connaissent [LaTeX](http://www.latex-project.org) et sa classe
[beamer](https://github.com/josephwright/beamer), les fichiers importants sont
le thème [`beamerthemeulille.sty`](etc/beamerthemeulille.sty) (`ulille`) et le
logo vectoriel de l'Université de Lille
[`logo-univ-lille.pdf`](img/logo-univ-lille.pdf).

Pour les *débutants* pour bien utiliser ces modèles il est recommandé de lire
d'abord [exemple-ulille-cours.pdf](exemple-ulille-cours.pdf) puis de le relire
une seconde fois en comparant avec le contenu du fichier source
[exemple-ulille-cours.tex](exemple-ulille-cours.tex).

La même chose peut-être faite avec
[exemple-ulille-presentation.pdf](exemple-ulille-presentation.pdf) et
[exemple-ulille-presentation.tex](exemple-ulille-presentation.tex).

Pour ceux qui ont des besoins encore plus rapide et léger
(présentations très simples), le script [md2beamer](bin/md2beamer)
permet de transformer un fichier Markdown en diaporama PDF grâce à
beamer. Un exemple *explicatif* est disponible dans
[exemple-ulille-diaporama.md](exemple-ulille-diaporama.md), avec un
rendu dans
[exemple-ulille-diaporama.pdf](exemple-ulille-diaporama.pdf).
