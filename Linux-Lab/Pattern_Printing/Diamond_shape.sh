row=5
n=1
#upper part
for ((i=1 ; i<=row; i=`expr $i + 2`))
do 	
	for (( k=n ; k<=2; k++ ))
	do
		echo -n " "		
	done
	for (( j=1 ; j<=i; j++ ))
	do	
		echo -n "*"
	done
	echo " "
	n=`expr $n + 1`
done


#lower part
n=2
row=`expr $row - 2`
for ((i=row ; i>=1; i=`expr $i - 2`))
do 
	for (( k=n ; k<=2; k++ ))
	do
		echo -n " "		
	done
	for (( j=1 ; j<=i; j++ ))
	do
		echo -n "*"
	done
	echo " "
	n=`expr $n - 1`
done

