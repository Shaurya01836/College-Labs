echo "enter the number of row"
read RowSize
for ((i=1 ; i<=RowSize; i++))
do 
	for (( j=i ; j<=RowSize; j++ ))
	do
		echo -n "*"
	done
	echo " "
done
