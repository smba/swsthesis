# Makefile for LaTeX document with BibTeX and XeLaTeX

# Variables
SRC = example.tex
BIB = literature.bib
OUT = example.pdf

# Commands
PDFLATEX = pdflatex
BIBTEX = bibtex

# Utilities
PDF2TEXT = pdflatex
WC = wc -w

# Makefile targets
all: $(OUT) #wordcount pagecount calculate_ratio

$(OUT): $(SRC) $(BIB) 
	$(PDFLATEX)  $(SRC) #>/dev/null 2>&1
	$(BIBTEX) $(basename $(SRC)) #>/dev/null 2>&1
	
	makeindex  $(SRC)  #>/dev/null 2>&1
	
	
	
	$(PDFLATEX) $(SRC) #>/dev/null 2>&1
	$(PDFLATEX) $(SRC) #>/dev/null 2>&1

clean:
	rm -f *.lot *.lof *.toc *.run.xml *-blx.bib *.aux *.bbl *.blg *.log *.out *.pdf wordcount.txt pagecount.txt

.PHONY: all 
