#/bin/bash

for i in `ls`
do
	cd $i
	git_stat_changes=$(git status | grep "Cambios no rastreados para el commit:" | wc -l)
	git_stat_seg=$(git status | grep "Archivos sin seguimiento:" | wc -l)
	if [ $git_stat_seg = 0 ] && [ $git_stat_changes = 0 ]
	then
		echo "$i esta actualizada"
	else
		if [ $git_stat_seg = 0 ] && [ $git_stat_changes -gt 0 ]
		then
			echo "$i tiene archivos con cambios"
		elif [ $git_stat_seg -gt 0 ] && [ $git_stat_changes = 0 ]
		then
			echo "$i tiene archivos sin seguimiento"
		else
			echo "$i tiene archivos con cambios y archivos sin seguimiento"
		fi
	fi
	cd ..
done

