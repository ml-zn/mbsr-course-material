BUILD = build
BOOKNAME = mbsr-leitfaden-kursleiter
METADATA = metadata.yaml
METADATA_PDF = metadata-pdf.yaml
CHAPTERS = 00_orientierung.md \
					 01_kurseinheit.md \
					 01_bodyscan.md \
					 01_bodyscan_kurz.md \
					 02_kurseinheit.md \
					 02_sitzmeditation_kurz.md \
					 03_kurseinheit.md \
					 ../teilnehmer/03_yoga_liegen.md \
					 04_kurseinheit.md \
					 ../teilnehmer/04_stress.md \
					 05_kurseinheit.md \
					 05_sitzmeditation.md \
					 ../teilnehmer/05_stressaktion.md \
					 ../teilnehmer/01_yoga_stehen.md \
					 06_kurseinheit.md \
					 ../teilnehmer/06_meditation_gehen.md \
					 ../teilnehmer/06_achtsame_kommunikation.md \
					 tag_der_achtsamkeit.md \
					 aa_inquiry.md \
					 bb_sitzmeditation_5stufen.md \
					 zz_kursreflexion.md
TOC = --toc --toc-depth=4

all: book

book: init epub pdf

init:
	mkdir -p $(BUILD)

clean: init
	rm -r $(BUILD)

epub: $(BUILD)/epub/$(BOOKNAME).epub

pdf: $(BUILD)/pdf/$(BOOKNAME).pdf

$(BUILD)/epub/$(BOOKNAME).epub: $(METADATA) $(CHAPTERS)
	mkdir -p $(BUILD)/epub
	pandoc -s $(TOC) -t epub3+smart --epub-embed-font=../_fonts/*.ttf --filter pandoc-citeproc -o $@ $^

$(BUILD)/pdf/$(BOOKNAME).pdf: $(METADATA_PDF) $(CHAPTERS)
	mkdir -p $(BUILD)/pdf
	pandoc -s --template=../_latex/template-mbsr-latex.tex $(TOC) --filter pandoc-citeproc --pdf-engine=xelatex -V documentclass=$(LATEX_CLASS) -o $(BUILD)/pdf/$(BOOKNAME).pdf $^
	pdfunite $(BUILD)/pdf/$(BOOKNAME).pdf ../material/Übungstagebuch.pdf ../material/TagebuchAngenehmerErlebnisse.pdf $(BUILD)/pdf/$(BOOKNAME)-complete.pdf

.PHONY: all book clean epub pdf
