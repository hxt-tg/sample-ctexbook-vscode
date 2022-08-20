.PHONY: all clean clean-all

# Makefile tested on Windows with bash (cygwin).

# Note: *.tikz extension is not allowed for VSCode LaTeX Workshop.
# Use *.tex for TikZ figures instead.

makeFileDir := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
target := main
latexmk_option := -synctex=1 -interaction=nonstopmode -file-line-error -pdf
chapter_dir := $(sort $(wildcard chap*))

tikz_figure_dir := $(chapter_dir:%=%/figures)
all_tikz_src := $(foreach sdir,$(tikz_figure_dir),$(wildcard $(sdir)/*.tex))
all_tikz_pdf := $(all_tikz_src:%.tex=%.pdf)

$(target).pdf: ${all_tikz_pdf}
	latexmk $(latexmk_option) $(target).tex

$(all_tikz_pdf): %.pdf: %.tex tikz_preamble.tex
	pdflatex -halt-on-error -output-directory $(dir $@) $<

# Note: The blank line before `endef` is for WinNT compatibility.
define clean_figure =
	-rm -f $(1:.pdf=.synctex.gz) $(1:.pdf=.dvi)
	cd $(dir $1) && latexmk -c

endef

clean:
	$(call clean_figure, ./$(target).pdf)
	$(foreach var,$(all_tikz_pdf), $(call clean_figure, $(var)))

clean-all: clean
	-rm -f $(target).pdf $(all_tikz_pdf)
