import os

os.chdir('../../new_and_improved/images/')
path = os.getcwd()
path = path + '\\'
with open('../../new_and_improved/Database/image_update.sql', 'w') as l:
    for i in range(120):
        with open(f'{i}.png', 'rb') as f:
            image_path = path + f'{i}.png'
            print(image_path)
            image_path= image_path.replace("\\", "\\\\")
            print(image_path)
            array = f.read()
            l.write(f"UPDATE book SET image = '{image_path}' WHERE id = {i+1} ;\n")