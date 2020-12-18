from os import system as run
from os import listdir

svgs = []
for item in listdir():
    if 'svg' in item:
        svgs.append(item)


def convert(svg):
    pdf = svg.split('.')[0].lower()
    pdf = f'{pdf}.pdf'
    command = f'rsvg-convert -f pdf -o "{pdf}" "{svg}"'
    # print(command)
    run(command)


for svg in svgs:
    convert(svg)
