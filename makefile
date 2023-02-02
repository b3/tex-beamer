# Variables :
#     THEMES     définit le(s) thème(s) à générer

ifndef THEMES
COURS := bbb ulille lille1 gate lyon2 lyon2gate sif
SIMPLE := bbb yvan ulille sif
OPTIONS := bbb ulille sif
PRESENTATION := bbb ulille lille1 gate lyon2 lyon2gate sif
DIAPORAMA := lille1 ulille lyon2 sif
else
COURS := $(THEMES)
SIMPLE := $(THEMES)
OPTIONS := $(THEMES)
PRESENTATION := $(THEMES)
DIAPORAMA := $(THEMES)
endif

# POSIX shell for all for ERE
SED := sed $(shell sed v </dev/null >/dev/null 2>&1 && echo " --posix") -E

EXEMPLES := $(patsubst %,exemple-%-cours.tex,$(COURS))
EXEMPLES += $(patsubst %,exemple-%-simple.tex,$(SIMPLE))
EXEMPLES += $(patsubst %,exemple-%-options.tex,$(OPTIONS))
EXEMPLES += $(patsubst %,exemple-%-presentation.tex,$(PRESENTATION))
EXEMPLES += $(patsubst %,exemple-%-diaporama.md,$(DIAPORAMA))

PDF := $(addsuffix .pdf,$(basename $(EXEMPLES)))

IMG-SVG := $(wildcard img/*.svg)
IMG-PDF := $(addsuffix .pdf,$(basename $(IMG-SVG)))
IMG-PNG := $(addsuffix .png,$(basename $(IMG-SVG)))
IMG-JPG := $(wildcard img/*.jpg)

# POSIX shell for all for ERE
SED := sed $(shell sed v </dev/null >/dev/null 2>&1 && echo " --posix") -E

QUOI = @printf "\nFABRICATION de $@ à partir de $<\n"

help:                           ## liste les cibles disponibles
	@eval $$($(SED) -n '/^[a-zA-Z0-9_-]+:/ s/^(.*):([^#]*)(## |)(.*)$$/printf "\\033[36m%-15s\\033[0m %s\\n" "\1" "\4";/ ; ta; b; :a p' $(MAKEFILE_LIST))

doc:							## affiche la documentation
	@$(SED) -n '1,/^$$/ { s/^ *#// ; s/^ //g ; p }' $(MAKEFILE_LIST) | $(SED) '$$d'

##############################################################################

img/%.pdf: img/%.svg
	$(QUOI)
	inkscape -d 2400 -o $@ -T $<

img/%.png: img/%.svg
	$(QUOI)
	inkscape -d 72 -o $@ -T $<

%.pdf: %.tex $(IMG-PDF) $(IMG-PNG)
	$(QUOI)
	pdflatex -halt-on-error $< >/dev/null
	pdflatex -halt-on-error $< >/dev/null

%.pdf: %.md $(IMG-PDF) $(IMG-PNG)
	$(QUOI)
	$(MD2PDF) $<

MD2PDF := bin/md2pdf
define TMP =
exemple-THEME-diaporama.pdf: MD2PDF += -t THEME
endef
$(foreach T,$(DIAPORAMA),$(eval $(subst THEME,$(T),$(TMP))))

exemple-%-cours.tex: modele-cours.tex dist/%/*.tex 0*.tex etc/beamertheme%.sty
	$(QUOI)
	bin/include -p "% include " -I dist/$* $< > $@

exemple-%-presentation.tex: modele-presentation.tex dist/%/*.tex etc/beamertheme%.sty
	$(QUOI)
	bin/include -p "% include " -I dist/$* $< > $@

exemple-%-simple.tex: modele-simple.tex dist/%/*.tex 0*.tex etc/beamertheme%.sty
	$(QUOI)
	bin/include -p "% include " -I dist/$* $< > $@

exemple-%-options.tex: modele-options.tex dist/%/*.tex etc/beamertheme%.sty
	$(QUOI)
	bin/include -p "% include " -I dist/$* $< > $@

exemple-%-diaporama.md: modele-diaporama.md etc/beamertheme%.sty
	$(QUOI)
	$(SED) 's/@THEME@/$*/g' $< >$@

##############################################################################

.PHONY: check clean dist reset

exemples: $(EXEMPLES)           ## construit les exemples sources

build: $(PDF)                   ## construit les exemples pdf

images: $(IMG-PDF) $(IMG-PNG)   ## génère les images PDF et PNG à partir des SVG

check:                          ## vérifier la présence des outils nécessaires
	@which pdflatex
	@which inkscape

clean:                          ## supprimer les fichiers inutiles
	-rm -f $(shell find . -name "*~")
	-rm -f *.aux *.bbl *.blg *.toc *.lof *.log *.lot *.flg *.out *.nav *.snm *.vrb *.bak *.synctex.gz

reset: clean                    ## supprimer les fichiers regénérables
	-rm -f $(IMG-PDF) $(IMG-PNG) $(EXEMPLES) $(PDF)
