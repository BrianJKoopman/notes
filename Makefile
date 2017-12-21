MD_DIRECTORY = ./markdown/
MD_FILES = $(wildcard $(MD_DIRECTORY)*.md)

HTML_FILES = $(patsubst $(MD_DIRECTORY)%.md, ./html/%.html, $(MD_FILES))
WIKI_FILES = $(patsubst $(MD_DIRECTORY)%.md, ./wiki/%.wiki, $(MD_FILES))

.PHONY : all
all : html wiki

.PHONY: html
html : $(HTML_FILES)

./html/%.html : $(MD_DIRECTORY)%.md md2html.py
	python2 md2html.py $<

.PHONY: wiki
wiki : $(WIKI_FILES)

./wiki/%.wiki : $(MD_DIRECTORY)%.md
	pandoc $< -f markdown -t mediawiki -s -o $@

.PHONY : clean
clean:
	rm -f ./html/*.html
	rm -f ./wiki/*.wiki

.PHONY: variables
variables:
	@echo MD_FILES: $(MD_FILES)
	@echo HTML_FILES: $(HTML_FILES)
	@echo WIKI_FILES: $(WIKI_FILES)

# vim: set expandtab!:
