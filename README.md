# 42 Network Automatic Ranking of Students
rank_auto_update.sh is the script to refresh the ranking, it will execute 2 other script in the folder "script", and use the folder "data" to store and edit data files, then pushing the new ranks in the folder "1337RANK.io" in the json format (data.json).

## How to Use the script for your 42 campus anywhere in the world
### You can change the directory name in the script rank_auto_update.sh (line 16) by your website folder, you can use the index.html in 1337RANK.io to change the website accordly to your campus
### You need to change only one number in the script/rank.py python code, line 15 after {"filter[campus_id]" : 55} (55 = Tetouan-Med Campus in Morocco, "1"= 42 Paris campus etc..)
### To find your campus id, use the ruby script in the script directory
### And last of all, you need to adjust the number of students according to your campus, the script "launch_json.sh" line 3 "while [ $var -lt 200]"  and the python script "rank.py" line 27 "pets=users[:200]"  >> 200 is the number of students in 42 Med Morocco
### To get the students official photos, go to "Charts" folder and check the readme
