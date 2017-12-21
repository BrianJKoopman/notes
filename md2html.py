from jinja2 import Template
import os

f = open('./markdown/example.md', 'r')
a = f.read()
f.close()
file_contents = a.split('\n')

template = "./templates/strapdown.html"
f = open(template, 'r')
t = Template(f.read())
output = t.render(note_file = file_contents)

with open(os.path.join("./html/", "index.html"), "wb") as fout:
    fout.write(output)
