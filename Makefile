.PHONY:
clean:
	-@rm -rf \
		*~ \
		*.aux \
		*.bbl \
		*.blg \
		*.dvi \
		*.ent \
		*.loa \
		*.lof \
		*.lot \
		*.toc \
		*.log \
		*.out \
		.fuse* \
		*.run.xml \
		*.bcf \
		*.gz
	-@find . -name *.aux -exec rm {} \;


chinese: clean main.tex
	# x -> b -> x -> x
	xelatex -synctex=1 -interaction=nonstopmode -file-line-error -pdf main
	bibtex main
	xelatex -synctex=1 -interaction=nonstopmode -file-line-error -pdf main
	xelatex -synctex=1 -interaction=nonstopmode -file-line-error -pdf main

english: clean main_en.tex
	# p -> b -> p -> p
	pdflatex -synctex=1 -interaction=nonstopmode -file-line-error main_en
	bibtex main_en
	pdflatex -synctex=1 -interaction=nonstopmode -file-line-error main_en
	pdflatex -synctex=1 -interaction=nonstopmode -file-line-error main_en