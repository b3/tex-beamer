# Modèles de présentations pour l'Université de Lyon 2 et le GATE

Des fichiers présents ici s'adressent aux personnes qui veulent des modèles de
présentation *propres* (c'est-à-dire avec exigence sur la qualité du résultat)
utilisant l'identité de l'[Université de Lyon 2](https://www.univ-lyon2.fr), du
[GATE](https://www.gate.cnrs.fr), ou d'un mélange des 2.

Ça s'adresse aussi aux personnes qui ne connaissent pas très bien le système
de composition de texte [LaTeX](https://www.latex-project.org) ou qui débutent
dans son utilisation ou dans l'utilisation de son paquet
[beamer](https://github.com/josephwright/beamer) prévu pour préparer des
présentations.

L'objet est de faciliter la production de support de présentation
(*Powerpoint* en novlangue) avec un rendu simple mais spécifique.

Pour ceux qui connaissent [LaTeX](http://www.latex-project.org) et sa classe
[Beamer](https://github.com/josephwright/beamer), les fichiers importants sont :

- pour l'identité du GATE :
    - le thème [`beamerthemegate.sty`](etc/beamerthemegate.sty) (`gate`),
    - le logo vectoriel du laboratoire [`logo-gate.pdf`](img/logo-gate.pdf) ;
    
- pour l'identité de l'Université de Lyon 2 :
    - le thème [`beamerthemelyon2.sty`](etc/beamerthemelyon2.sty) (`lyon2`),
    - le logo vectoriel de l'Université dans sa dernière version [`logo-univ-lyon2-2018.pdf`](img/logo-univ-lyon2-2018.pdf) ;

- pour les deux identités réunies :
    - le thème [`beamerthemelyon2gate.sty`](etc/beamerthemelyon2gate.sty) (`lyon2gate`),
    - le logo vectoriel de l'Université dans sa dernière version [`logo-univ-lyon2-2018.pdf`](img/logo-univ-lyon2-2018.pdf),
    - le logo vectoriel du laboratoire [`logo-gate.pdf`](img/logo-gate.pdf).

Pour les *débutants* pour bien utiliser ces modèles il est recommandé de lire
d'abord un des fichiers d'abord
[modele-cours-lyon2.pdf](modele-cours-lyon2.pdf),
[modele-cours-lyon2gate.pdf](modele-cours-lyon2gate.pdf) ou
[modele-cours-gate.pdf](modele-cours-gate.pdf) puis de le relire une seconde
fois en comparant avec le contenu des fichiers sources
[modele-cours-lyon2.tex](modele-cours-lyon2.tex),
[modele-cours-lyon2gate.tex](modele-cours-lyon2gate.tex) ou
[modele-cours-gate.tex](modele-cours-gate.tex).

La même chose peut-être faite avec
[modele-presentation-gate.pdf](modele-presentation-gate.pdf),
[modele-presentation-lyon2.pdf](modele-presentation-lyon2.pdf) ou
[modele-presentation-lyon2gate.pdf](modele-presentation-lyon2gate.pdf) et
[modele-presentation-gate.tex](modele-presentation-gate.tex),
[modele-presentation-lyon2.tex](modele-presentation-lyon2.tex) ou
[modele-presentation-lyon2gate.tex](modele-presentation-lyon2gate.tex).

Pour ceux qui ont des besoins encore plus rapide et léger (présentations très
simples), le script [md2beamer](bin/md2beamer) permet de transformer un
fichier Markdown en diaporama PDF grâce à Beamer. Un exemple *explicatif* est
disponible dans [modele-diaporama.md](modele-diaporama.md), avec un rendu dans
[modele-diaporama.pdf](modele-diaporama.pdf).
