echo "enter the number of row"
read RowSize
for ((i=1 ; i<=RowSize; i++))
do 
	for (( j=1 ; j<=i; j++ ))
	do
		echo -n "*"
	done
	echo " "
done
