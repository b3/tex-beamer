# Modèles de présentations pour la Société Informatique de France

Des fichiers présents ici s'adressent aux personnes qui veulent des
modèles de présentation *propres* (c'est-à-dire avec exigence sur la
qualité du résultat) utilisant l'identité de la [Société Informatique
de France](https://www.societe-informatique-de-francefr).

Ça s'adresse aux personnes qui ne connaissent pas très bien le système
de composition de texte [LaTeX](https://www.latex-project.org) ou qui
débutent dans son utilisation ou dans celle de l'utilisation de son
paquet [beamer](https://github.com/josephwright/beamer) prévu pour
préparer des présentations.

L'objet est de faciliter la production de support de présentation
(*Powerpoint* en novlangue) avec un rendu simple mais spécifique.

## LaTeX

### Utilisation

Pour ceux qui connaissent [LaTeX](http://www.latex-project.org) et sa
classe [Beamer](https://github.com/josephwright/beamer), les fichiers
importants sont :

- le thème [`beamerthemesif.sty`](etc/beamerthemesif.sty),
- le logo vectoriel de la SIF [`logo-sif.pdf`](img/logo-sif.pdf) ;
- le bandeau de la SIF [`bandeau-sif.pdf`](img/bandeau-sif.pdf).

Pour les *débutants* pour bien utiliser ces modèles il est recommandé
de lire le fichier [exemple-sif-cours.pdf](exemple-sif-cours.pdf) puis
de le relire une seconde fois en comparant avec le contenu des
fichiers sources [exemple-sif-cours.tex](exemple-sif-cours.tex).

Il y a aussi des exemples pour des présentations différentes :

- [exemple-sif-presentation.pdf](exemple-sif-presentation.pdf),
- [exemple-sif-simple.pdf](exemple-sif-exemple.pdf),
- [exemple-sif-options.pdf](exemple-sif-options.pdf).

### Paramétrages du thème Beamer

Plusieurs paramétrages peuvent être utilisés lors du chargement du
style beamer par la commande `\usetheme{sif}` :

- `partpage`, `nopartpage` : composition ou non d'une diapositive
  spécifique en début de chaque partie (commande LaTeX `\part{}`)
  contenant le nom de la partie (par défaut `partpage` est activé) ;

- `sectionpage`, `nosectionpage` : composition ou non d'une
  diapositive spécifique en début de chaque section (commande LaTeX
  `\section{}`) contenant la table des matières et la position
  courante (par défaut `sectionpage` est activé) ;

- `subsectionpage`, `nosubsectionpage` : composition ou non d'une
  diapositive spécifique en début de chaque sous-section (commande
  LaTeX `\subsection{}`) affichant la table des matières et la
  position courante (par défaut `subsectionpage` est désactivé) ;

- `sectioninfoot`, `nosectioninfoot` : inclusion ou non du titre de la
  section dans le pied de page de chaque diapositive en sus du titre
  de la présentation (par défaut `sectioninfoot` est activé) ;

- `long`, `court` : active ou désactive toutes les options `partpage`,
  `sectionpage`, `subsectionpage` et `sectioninfoot`.
 
Pour mémoire les options se spécifient en options de la commande comme
dans `\usetheme[param1,param2]{sif}`.

Le style offre également des commandes de paramétrages de la page de
titre :

- `\titlebackground{}` : permet de spécifier un chemin vers une image
  à utiliser en fond de page de la page de titre ;

- `\titlegraphic{}` : permet de spécifier un ensemble de commandes
  LaTeX à utiliser pour placer des images sur la page de titre **à la
  place du** logo standard de la SIF (placé en bas de page).
  
## Markdown

Pour ceux qui ne connaissent pas LaTeX (et ne veulent pas l'apprendre)
ou ont des besoins encore plus rapide et léger, le script
[md2pdf](bin/md2pdf) permet de transformer un fichier Markdown en
diaporama PDF grâce à Beamer et [pandoc](https://pandoc.org) de
manière quasi transparente. Un exemple *explicatif* est disponible
dans [exemple-sif-diaporama.md](exemple-sif-diaporama.md), avec un
rendu dans [exemple-sif-diaporama.pdf](exemple-sif-diaporama.pdf).
