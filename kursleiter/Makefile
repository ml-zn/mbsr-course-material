BUILD = build
BOOKNAME = mbsr-leitfaden-kursleiter
METADATA = metadata.yaml
METADATA_PDF = metadata-pdf.yaml
CHAPTERS = 00_00_orientierung.md 00_01_geschichte_mbsr.md 00_02_achtsamkeit.md 00_03_praxis.md 00_04_mbsr_8_wochen.md 00_05_risiken_fragen.md \
01_00_kurseinheit_1.md 01_01_einfuehrung_meditation.md 01_02_achtsamkeit.md 01_03_kursregeln.md 01_04_reflexion.md 01_05_yoga_stehen.md \
01_06_rosinenuebung.md 01_07_bauchatmung.md 01_08_bodyscan.md 01_09_austausch.md 01_10_hausaufgaben.md
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
	
.PHONY: all book clean epub pdf
