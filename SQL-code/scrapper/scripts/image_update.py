#!/usr/bin/env python3

import os

os.chdir('images/')
path = os.getcwd()
path = path + '/'
with open('../Database/image_update.sql', 'w') as l:
    for i in range(120):
        with open(f'{i}.png', 'rb') as f:
            image_path = path + f'{i}.png'
            array = f.read()
            l.write(f"UPDATE book SET image = LOAD_FILE('{image_path}') WHERE id = {i+1};\n")
