echo "Enter the number of rows :"
read row
echo "Enter the number of col :"
read col
for ((i=1 ; i<=row; i++))
do 
	for (( j=1 ; j<=col; j++ ))
	do
		echo -n "*"
	done
	echo " "
done
