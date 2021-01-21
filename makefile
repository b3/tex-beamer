MODELES := exemple-bbb-cours.tex
MODELES += exemple-ulille-cours.tex exemple-lille1-cours.tex
MODELES += exemple-gate-cours.tex exemple-lyon2-cours.tex exemple-lyon2gate-cours.tex
MODELES += exemple-sif-cours.tex

MODELES += exemple-bbb-simple.tex exemple-yvan-simple.tex
MODELES += exemple-ulille-simple.tex
MODELES += exemple-sif-simple.tex

MODELES += exemple-bbb-options.tex
MODELES += exemple-sif-options.tex

MODELES += exemple-bbb-presentation.tex
MODELES += exemple-ulille-presentation.tex exemple-lille1-presentation.tex
MODELES += exemple-gate-presentation.tex exemple-lyon2-presentation.tex exemple-lyon2gate-presentation.tex
MODELES += exemple-sif-presentation.tex

PDF := $(addsuffix .pdf,$(basename $(MODELES))) modele-diaporama.pdf

IMG-SVG := $(wildcard img/*.svg)
IMG-PDF := $(addsuffix .pdf,$(basename $(IMG-SVG)))
IMG-PNG := $(addsuffix .png,$(basename $(IMG-SVG)))
IMG-JPG := $(wildcard img/*.jpg)

# POSIX shell for all for ERE
SED := sed $(shell sed v </dev/null >/dev/null 2>&1 && echo " --posix") -E

QUOI = @printf "\nFABRICATION de $@ à partir de $<\n"

help:                           ## liste les cibles disponibles
	@eval $$($(SED) -n '/^[a-zA-Z0-9_-]+:/ s/^(.*):([^#]*)(## |)(.*)$$/printf "\\033[36m%-15s\\033[0m %s\\n" "\1" "\4";/ ; ta; b; :a p' $(MAKEFILE_LIST))

##############################################################################

img/%.pdf: img/%.svg
	$(QUOI)
	inkscape -d 2400 -o $@ -T $<

img/%.png: img/%.svg
	$(QUOI)
	inkscape -d 72 -o $@ -T $<

%.pdf: %.tex $(IMG-PDF) $(IMG-PNG)
	$(QUOI)
	pdflatex $<
	pdflatex $<

%.pdf: %.md $(IMG-PDF) $(IMG-PNG)
	$(QUOI)
	bin/md2beamer $^ img

exemple-%-cours.tex: modele-cours.tex dist/%/*.tex 0*.tex etc/*
	$(QUOI)
	bin/include -p "% include " -I dist/$* $< > $@

exemple-%-presentation.tex: modele-presentation.tex dist/%/*.tex etc/*
	$(QUOI)
	bin/include -p "% include " -I dist/$* $< > $@

exemple-%-simple.tex: modele-simple.tex dist/%/*.tex 0*.tex etc/*
	$(QUOI)
	bin/include -p "% include " -I dist/$* $< > $@

exemple-%-options.tex: modele-options.tex dist/%/*.tex etc/*
	$(QUOI)
	bin/include -p "% include " -I dist/$* $< > $@

##############################################################################

.PHONY: build check clean dist dist-clean modeles

modeles: $(MODELES)             ## construit les modèles (version source)

build: $(PDF)                   ## construit les modèles (version PDF)

images: $(IMG-PDF) $(IMG-PNG)   ## génère les images PDF et PNG à partir des SVG

check:                          ## vérifier la présence des outils nécessaires
	@which pdflatex
	@which inkscape

clean:                          ## supprimer les fichiers inutiles
	-rm -f $(shell find . -name "*~")
	-rm -f *.aux *.bbl *.blg *.toc *.lof *.log *.lot *.flg *.out *.nav *.snm *.vrb *.bak *.synctex.gz

reset: clean                    ## supprimer les fichiers regénérables
	-rm -f $(IMG-PDF) $(IMG-PNG) $(MODELES) $(PDF)

