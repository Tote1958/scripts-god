import json

followers_list = []
follows_list = []
with open('followers_1.json', 'r') as f:
    followers = json.load(f)

with open('following.json', 'r') as f:
    follows = json.load(f)


for value in followers:
    algo = value['string_list_data']
    algo = algo[0]
    followers_list.append(algo['value'])

follows = follows['relationships_following']

for value in follows:
    algo = value['string_list_data']
    algo = algo[0]
    follows_list.append(algo['value'])

for i in follows_list:
    if i not in followers_list:
        print(i)
print('--------------------')

for i in followers_list:
    if i not in follows_list:
        print(i)
