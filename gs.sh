#/bin/bash

for i in `ls`
do
	cd $i
	git_stat_seg=$(git status | grep "Cambios no rastreados para el commit:" | wc -l)
	git_stat_changes=$(git status | grep "Archivos sin seguimiento:" | wc -l)
	if [ $git_stat_seg = 0 ] && [ $git_stat_changes = 0 ]
	then
		echo "$i esta actualizada"
	else
		if [ $git_stat_seg = 0 ]
		then
			echo "$i no tiene archivos sin seguimiento"
		else
		echo "$i tiene archivos sin seguimiento"
		fi
		if [ $git_stat_changes = 0 ]
		then
			echo "$i no tiene archivos con cambios"
		else
			echo "$i tiene archivos con cambios"
		fi
	fi
	cd ..
done

