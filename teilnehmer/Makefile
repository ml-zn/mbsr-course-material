BUILD = build
BOOKNAME = mbsr-teilnehmer
METADATA = metadata.yaml
METADATA_PDF = metadata-pdf.yaml
CHAPTERS = 01_kurseinheit.md
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
