import os

for filename in os.listdir('.'):
    if filename.endswith('.css') and os.path.isfile(filename):
        with open(filename, 'r+', encoding='utf-8') as f:
            content = f.read()
            f.seek(0, 0)
            f.write(f'/* {filename} */\n' + content)