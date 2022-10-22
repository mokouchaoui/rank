#!/bin/bash
while true
do
	python3 script/rank.py > data/rank.txt
	sh script/launch_json.sh
	echo "$(cat data/format_final.json | perl -p -e "s/\n//" | rev | cut -c 3- | rev)" > data/data-tmp2.json
	echo "$(cat data/data-tmp2.json|  sed 's# ##g')" > data/data-tmp2.json
	echo "$(cat data/data_sample.json | perl -p -e "s/"200"/$(cat data/data-tmp2.json | rev | sed 's/.$//' | rev ),"201"/")" > data/data.json
	echo "$(cat data/data.json | sed "s/201/\x22201/")" > data/data.json
	cp data/data.json .
	git add *; git commit -m "updaterank"; git push
	sleep 900s
done
