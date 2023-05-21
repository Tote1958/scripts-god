import os
import sys
import subprocess
import re
pwd = os.getcwd()
directories = []
git = []
items = os.listdir('.')
for item in items:
    if os.path.isdir(item):
        directories.append(item)
print(directories)

for i in directories:
    if re.fullmatch('\.(.)*', i):
        item_index = directories.index(i)
        directories.pop(item_index)
print(directories)

for i in directories:
    if re.fullmatch('\.(.)*', i):
        item_index = directories.index(i)
        directories.pop(item_index)
print(directories)


"""
for i in directories:
    os.system(f'cd {directories}')
    command = subprocess.check_output(['git status'])
    print(command)
    os.system('cd ..')
"""