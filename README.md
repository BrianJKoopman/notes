# notes

Take notes using Markdown, quickly view them in your browser using
[Strapdown.js](http://strapdownjs.com/), then convert them to the [MediaWiki
markup](http://www.mediawiki.org/wiki/Help:Formatting) format using
[pandoc](http://pandoc.org/). The provided `clip` script uses
[xclip](https://github.com/astrand/xclip) for quick copying and pasting to a
MediaWiki. 

## Motviation

I often take notes on my computer in random text files, in a format that could
easily be Markdown, which end up strewn across my filesystem. This is an
attempt to wrangle those random files enough to post them to a wiki.

This allows me to continue taking notes in vim, while enabling me to post them
to a wiki when I am done, without having to think about a particular wiki's
syntax.

## Getting Started

These instructions will get you a copy of the project up and running on your
local machine for taking your own notes. 

### Prerequisites

* python 2.7
* jinja2
* pandoc
* xclip
* a web browser

### Installing

To use, start by cloning the repo:

```
git clone https://github.com/BrianJKoopman/notes.git
```

Simply start taking notes in the `markdown/` directory with the editor of your
choice, ensuring the notes end in `.md`. When ready to convert to html run
`make` from the top directory. As an example, we can test this on the
`markdown/example.md` file. After cloning the repo run:

```
make clean
make
```

You should see the following output:

```
$ make clean
rm -f ./html/*.html
rm -f ./wiki/*.wiki

$ make
python2 md2html.py markdown/example.md
pandoc markdown/example.md -f markdown -t mediawiki -s -o wiki/example.wiki
```

This produces `html/example.html` and `wiki/example.wiki`. View the html file
in a browser to quickly check your notes. When satisfied, post the wiki version
to your MediaWiki. To copy the file to your clipboard, `clip` uses `xclip`.

```
./clip wiki/example.wiki
```

## Built With

* [Jinja](http://jinja.pocoo.org/) - Template engine
* [pandoc](http://pandoc.org/) - a universal document converter
* [Strapdown.js](http://strapdownjs.com/) - javascript based Markdown viewing
* [xclip](https://github.com/astrand/xclip) - cmdline utility for accessing the clipboard

## Authors

* **Brian Koopman** - *Initial work* - [BrianJKoopman](https://github.com/BrianJKoopman)

See also the list of [contributors](https://github.com/BrianJKoopman/notes/graphs/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
