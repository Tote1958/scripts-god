#/bin/bash

for i in `ls`
do
	cd $i
	git_stat_changes=$(git status | grep "Cambios no rastreados para el commit:" | wc -l)
	git_stat_seg=$(git status | grep "Archivos sin seguimiento:" | wc -l)
	git_stat_changes_to_commit=$(git status | grep "Cambios a ser confirmados:" | wc -l)
	git_stat_push=$(git status | grep "git push" | wc -l)
	if [ $git_stat_seg = 0 ] && [ $git_stat_changes = 0 ] && [ $git_stat_changes_to_commit = 0 ] && [ $git_stat_push = 0 ]
	then
		echo "$i esta actualizada"
	elif [ $git_stat_changes_to_commit \> 0 ]
	then
		echo "$i tiene archivos staged (a ser confirmados)"
	elif [ $git_stat_push \> 0 ]
	then
		echo "$i tiene commits para pushear"
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

