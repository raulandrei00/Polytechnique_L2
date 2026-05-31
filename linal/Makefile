# Makefile for main.tex
#
# Usage:
#   make         - build main.pdf
#   make watch   - rebuild automatically on save (needs latexmk)
#   make view    - build and open the PDF
#   make clean   - remove build artifacts (keep the PDF)
#   make distclean - remove everything including the PDF

TARGET  = main
TEX     = $(TARGET).tex
PDF     = $(TARGET).pdf

LATEXMK := $(shell command -v latexmk 2>/dev/null)

# Open command per platform (linux: xdg-open, mac: open, windows: start)
ifeq ($(OS),Windows_NT)
	OPEN = cmd /c start ""
else ifeq ($(shell uname),Darwin)
	OPEN = open
else
	OPEN = xdg-open
endif

.PHONY: all watch view clean distclean

all: $(PDF)

ifdef LATEXMK
# --- Preferred path: latexmk handles reruns and bibliography automatically ---
$(PDF): $(TEX)
	latexmk -pdf -interaction=nonstopmode -halt-on-error $(TARGET)

watch: $(TEX)
	latexmk -pdf -pvc -interaction=nonstopmode $(TARGET)

clean:
	latexmk -c

distclean:
	latexmk -C
else
# --- Fallback: manual pdflatex + bibtex passes ---
$(PDF): $(TEX)
	pdflatex -interaction=nonstopmode -halt-on-error $(TARGET)
	-bibtex $(TARGET)
	pdflatex -interaction=nonstopmode -halt-on-error $(TARGET)
	pdflatex -interaction=nonstopmode -halt-on-error $(TARGET)

watch:
	@echo "watch needs latexmk: install it or run 'make' after each edit"

clean:
	rm -f $(TARGET).aux $(TARGET).log $(TARGET).out $(TARGET).toc \
	      $(TARGET).bbl $(TARGET).blg $(TARGET).fls $(TARGET).fdb_latexmk \
	      $(TARGET).synctex.gz

distclean: clean
	rm -f $(PDF)
endif

view: $(PDF)
	$(OPEN) $(PDF)
