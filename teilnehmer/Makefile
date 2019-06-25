BUILD = build
BOOKNAME = mbsr-teilnehmer
METADATA = metadata.yaml
METADATA_PDF = metadata-pdf.yaml
CHAPTERS = 01_kurseinheit.md 02_kurseinheit.md 03_kurseinheit.md 03_yoga_liegen.md 04_kurseinheit.md 04_stress.md \
05_kurseinheit.md  05_stressaktion.md 01_yoga_stehen.md 06_kurseinheit.md  06_meditation_gehen.md
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
	pandoc -s --template=../_latex/template-mbsr-latex.tex $(TOC) --filter pandoc-citeproc --pdf-engine=xelatex -V documentclass=$(LATEX_CLASS) -o $(BUILD)/pdf/$(BOOKNAME)-1.pdf metadata-pdf-1.yaml 01_kurseinheit.md
	pandoc -s --template=../_latex/template-mbsr-latex.tex $(TOC) --filter pandoc-citeproc --pdf-engine=xelatex -V documentclass=$(LATEX_CLASS) -o $(BUILD)/pdf/$(BOOKNAME)-2.pdf metadata-pdf-2.yaml 02_kurseinheit.md
	pandoc -s --template=../_latex/template-mbsr-latex.tex $(TOC) --filter pandoc-citeproc --pdf-engine=xelatex -V documentclass=$(LATEX_CLASS) -o $(BUILD)/pdf/$(BOOKNAME)-3.pdf metadata-pdf-3.yaml 03_kurseinheit.md 03_yoga_liegen.md
	pandoc -s --template=../_latex/template-mbsr-latex.tex $(TOC) --filter pandoc-citeproc --pdf-engine=xelatex -V documentclass=$(LATEX_CLASS) -o $(BUILD)/pdf/$(BOOKNAME)-4.pdf metadata-pdf-4.yaml 04_kurseinheit.md 04_stress.md
	pandoc -s --template=../_latex/template-mbsr-latex.tex $(TOC) --filter pandoc-citeproc --pdf-engine=xelatex -V documentclass=$(LATEX_CLASS) -o $(BUILD)/pdf/$(BOOKNAME)-5.pdf metadata-pdf-5.yaml 05_kurseinheit.md 05_stressaktion.md 01_yoga_stehen.md
	pandoc -s --template=../_latex/template-mbsr-latex.tex $(TOC) --filter pandoc-citeproc --pdf-engine=xelatex -V documentclass=$(LATEX_CLASS) -o $(BUILD)/pdf/$(BOOKNAME)-6.pdf metadata-pdf-6.yaml 06_kurseinheit.md 06_meditation_gehen.md
	pandoc -s --template=../_latex/template-mbsr-latex.tex $(TOC) --filter pandoc-citeproc --pdf-engine=xelatex -V documentclass=$(LATEX_CLASS) -o $(BUILD)/pdf/$(BOOKNAME).pdf $^
	pdfunite $(BUILD)/pdf/$(BOOKNAME).pdf ../material/Übungstagebuch.pdf ../material/TagebuchAngenehmerErlebnisse.pdf $(BUILD)/pdf/$(BOOKNAME)-complete.pdf

.PHONY: all book clean epub pdf
