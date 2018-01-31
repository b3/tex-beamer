IMG-SVG := $(wildcard img/*.svg)
IMG-PDF := $(addsuffix .pdf,$(basename $(IMG-SVG)))
IMG-PNG := $(addsuffix .png,$(basename $(IMG-SVG)))
IMG-JPG := $(wildcard img/*.jpg)
EXEMPLES := $(shell bin/exemples -l)

all: help

help:
	@eval $$($(SED) -n '/^[a-zA-Z0-9_-]+:/ s/^(.*):([^#]*)(## |)(.*)$$/printf "\\033[36m%-30s\\033[0m %s\\n" "\1" "\4";/ ; ta; b; :a p' $(MAKEFILE_LIST))


##############################################################################

img/%.pdf: img/%.svg
	inkscape -z -d 2400 -A $@ -T $<

img/%.png: img/%.svg
	inkscape -z -d 72 -e $@ -T $<

images: $(IMG-PDF) $(IMG-PNG)

##############################################################################

.PHONY: check clean dist dist-clean

check:
	@which pdflatex
	@which inkscape

clean:
	-rm $(shell find . -name "*~")

dist: images
	bin/exemples

dist-clean: clean
	-rm $(IMG-PDF) $(IMG-PNG) $(EXEMPLES)
