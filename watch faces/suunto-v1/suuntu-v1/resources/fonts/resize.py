import re
from PIL import Image

s = 0.2  # 428 px -> ~86 px

im = Image.open('suunto2.png')
im = im.resize((round(im.width * s), round(im.height * s)), Image.LANCZOS)
im.save('font.png')

scaled_keys = {'size', 'lineHeight', 'base', 'scaleW', 'scaleH',
               'x', 'y', 'width', 'height', 'xoffset', 'yoffset', 'xadvance'}

def scale(m):
    key, val = m.group(1), int(m.group(2))
    if key in scaled_keys:
        val = round(val * s)
    return f'{key}={val}'

out = []
for line in open('suunto2.fnt'):
    tag = line.split(' ', 1)[0]
    if tag in ('info', 'common', 'char'):
        line = re.sub(r'(\w+)=(-?\d+)', scale, line)
    out.append(line)

open('font.fnt', 'w').write(''.join(out))