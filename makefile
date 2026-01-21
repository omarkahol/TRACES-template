# ============================================================================
# Author: Omar Kahol
# Email: omar.kahol@inria.fr
# ============================================================================

PROJ = main
LC = latexmk
AUXSDIR = .build
OPT = -halt-on-error
ARGS = -pdfxe -outdir=$(AUXSDIR)  -pdfxelatex="xelatex $(OPT)" -bibtex

all: $(PROJ).pdf

$(PROJ).pdf: FORCE
	$(LC) $(ARGS) $(PROJ).tex
	cp $(AUXSDIR)/$(PROJ).pdf $@

clean:
	rm -rf $(AUXSDIR)
	rm -f $(PROJ).pdf

FORCE:

.PHONY: all clean FORCE