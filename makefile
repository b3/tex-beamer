IMG-SVG := $(wildcard img/*.svg)
IMG-PDF := $(addsuffix .pdf,$(basename $(IMG-SVG)))
IMG-PNG := $(addsuffix .png,$(basename $(IMG-SVG)))
IMG-JPG := $(wildcard img/*.jpg)
MODELES := modele-cours-gate.tex modele-cours-lille1.tex modele-cours-lyon2.tex
MODELES += modele-presentation-gate.tex modele-presentation-lille1.tex

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

images: $(IMG-PDF) $(IMG-PNG)   ## génère les images PDF et PNG à partir des SVG

modele-cours-%.tex: modele-cours.tex dist/%/*.tex
	bin/include -p "% include " -I dist/$* $< > $@

modele-presentation-%.tex: modele-presentation.tex dist/%/*.tex
	bin/include -p "% include " -I dist/$* $< > $@

##############################################################################

.PHONY: check clean dist dist-clean modeles

check:                          ## vérifier la présence des outils nécessaires
	@which pdflatex
	@which inkscape

clean:                          ## supprimer les fichiers inutiles
	-rm $(shell find . -name "*~")

dist-clean: clean               ## supprimer les fichiers regénérables
	-rm $(IMG-PDF) $(IMG-PNG) $(MODELES)

modeles: $(MODELES)             ## générer les modèles
