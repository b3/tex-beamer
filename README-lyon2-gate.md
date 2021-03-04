# Modèles de présentations pour l'Université de Lyon 2 et le GATE

Des fichiers présents ici s'adressent aux personnes qui veulent des
modèles de présentation *propres* (c'est-à-dire avec exigence sur la
qualité du résultat) utilisant l'identité de l'[Université de Lyon
2](https://www.univ-lyon2.fr), du [GATE](https://www.gate.cnrs.fr), ou
d'un mélange des 2.

Ça s'adresse aussi aux personnes qui ne connaissent pas très bien le
système de composition de texte [LaTeX](https://www.latex-project.org)
ou qui débutent dans son utilisation ou dans l'utilisation de son
paquet [beamer](https://github.com/josephwright/beamer) prévu pour
préparer des présentations.

L'objet est de faciliter la production de support de présentation
(*Powerpoint* en novlangue) avec un rendu simple mais spécifique.

Pour ceu@qx qui connaissent [LaTeX](http://www.latex-project.org) et sa classe
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

Pour les *débutants* pour bien utiliser ces modèles il est recommandé
de lire le fichier [exemple-lyon2-cours.pdf](exemple-lyon2-cours.pdf)
puis de le relire une seconde fois en comparant avec le contenu du
fichier source [exemple-lyon2-cours.tex](exemple-lyon2-cours.tex).

La même chose est faisable pour les 2 autres thèmes :

- pour `lyon2gate` via
  [exemple-lyon2gate-cours.pdf](exemple-lyon2gate-cours.pdf) et
  [exemple-lyon2gate-cours.tex](exemple-lyon2gate-cours.tex) ;
- pour `gate` via [exemple-gate-cours.pdf](exemple-gate-cours.pdf) et
  [exemple-gate-cours.tex](exemple-gate-cours.tex).

Il y a aussi des exemples pour des présentations plutôt que des cours
pour chacun des thèmes :

- `gate` via [exemple-gate-presentation.pdf](exemple-gate-presentation.pdf) et
  [exemple-gate-presentation.tex](exemple-gate-presentation.tex),
- `lyon2` via [exemple-lyon2-presentation.pdf](exemple-lyon2-presentation.pdf)
  et [exemple-lyon2-presentation.tex](exemple-lyon2-presentation.tex),
- `lyon2gate` via
  [exemple-lyon2gate-presentation.pdf](exemple-lyon2gate-presentation.pdf) et
  [exemple-lyon2gate-presentation.tex](exemple-lyon2gate-presentation.tex).

Pour ceux qui ont des besoins encore plus rapide et léger
(présentations très simples), le script [md2pdf](bin/md2pdf) permet de
transformer un fichier Markdown en diaporama PDF grâce à Beamer. Un
exemple *explicatif* est disponible dans
[exemple-lyon2-diaporama.md](exemple-lyon2-diaporama.md), avec un
rendu dans [exemple-lyon2-diaporama.pdf](exemple-lyon2-diaporama.pdf).
