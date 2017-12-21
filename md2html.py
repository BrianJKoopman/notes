import os
import argparse

from jinja2 import Template

parser = argparse.ArgumentParser()
parser.add_argument("file", help="The markdown file to convert to html.")
args = parser.parse_args()

f = open(args.file, 'r')
a = f.read()
f.close()
file_contents = a.split('\n')
page_title = os.path.basename(args.file).replace('.md', '')

template = "./templates/strapdown.html"
f = open(template, 'r')
t = Template(f.read())
output = t.render(title = page_title, note_file = file_contents)

with open(os.path.join("./html/", "%s.html"%page_title), "wb") as fout:
    fout.write(output)
