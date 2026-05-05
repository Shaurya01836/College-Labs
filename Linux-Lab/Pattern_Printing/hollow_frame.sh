row=5
col=8
for ((i=1 ; i<=row; i++))
do 
	for (( j=1 ; j<=col; j++ ))
	do	
		
		if [ $i -eq 1 -o $i -eq $row ]
		then 
			echo -n "*"
		else 
			if [ $j -eq $col ]
			then 
			echo -n "*"
			fi
			if [ $j -eq 1 ]
			then
			echo -n "*"
			else 
				echo -n " "
			fi
			
		fi
		
	done
	echo " "
done
