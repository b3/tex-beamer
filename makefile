
MODELES := modele-cours-bbb.tex
MODELES += modele-cours-lille1.tex modele-cours-ulille.tex
MODELES += modele-cours-gate.tex modele-cours-lyon2.tex

MODELES += simple-bbb.tex simple-yvan.tex
MODELES += simple-lille1.tex simple-ulille.tex

MODELES += modele-presentation-bbb.tex
MODELES += modele-presentation-lille1.tex modele-presentation-ulille.tex
MODELES += modele-presentation-gate.tex

PDF := $(addsuffix .pdf,$(basename $(MODELES))) modele-diaporama.pdf

IMG-SVG := $(wildcard img/*.svg)
IMG-PDF := $(addsuffix .pdf,$(basename $(IMG-SVG)))
IMG-PNG := $(addsuffix .png,$(basename $(IMG-SVG)))
IMG-JPG := $(wildcard img/*.jpg)

# FreeBSD & GNU sed do not use the same option for ERE
SED=sed$(shell { sed v </dev/null >/dev/null 2>&1 && echo " -r" ; } || echo " -E" ) 

all: help

help:                           ## liste les cibles disponibles
	@eval $$($(SED) -n '/^[a-zA-Z0-9_-]+:/ s/^(.*):([^#]*)(## |)(.*)$$/printf "\\033[36m%-15s\\033[0m %s\\n" "\1" "\4";/ ; ta; b; :a p' $(MAKEFILE_LIST))

##############################################################################

img/%.pdf: img/%.svg
	inkscape -z -d 2400 -A $@ -T $<

img/%.png: img/%.svg
	inkscape -z -d 72 -e $@ -T $<

%.pdf: %.tex $(IMG-PDF) $(IMG-PNG)
	pdflatex $<
	pdflatex $<

%.pdf: %.md $(IMG-PDF) $(IMG-PNG)
	bin/md2beamer $^ img

images: $(IMG-PDF) $(IMG-PNG)   ## génère les images PDF et PNG à partir des SVG

modele-cours-%.tex: modele-cours.tex dist/%/*.tex 0*.tex etc/*
	bin/include -p "% include " -I dist/$* $< > $@

simple-%.tex: simple.tex dist/%/*.tex 0*.tex etc/*
	bin/include -p "% include " -I dist/$* $< > $@

modele-presentation-%.tex: modele-presentation.tex dist/%/*.tex etc/*
	bin/include -p "% include " -I dist/$* $< > $@

##############################################################################

.PHONY: build check clean dist dist-clean modeles

build: $(PDF)                   ## construit les modèles (version PDF)

check:                          ## vérifier la présence des outils nécessaires
	@which pdflatex
	@which inkscape

clean:                          ## supprimer les fichiers inutiles
	-rm -f $(shell find . -name "*~")
	-rm -f *.aux *.bbl *.blg *.toc *.lof *.log *.lot *.flg *.out *.nav *.snm *.vrb *.bak *.synctex.gz

dist-clean: clean               ## supprimer les fichiers regénérables
	-rm -f $(IMG-PDF) $(IMG-PNG) $(MODELES) $(PDF)

modeles: $(MODELES)             ## construit les modèles (version source)
