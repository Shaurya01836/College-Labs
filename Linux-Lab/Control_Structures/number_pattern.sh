echo "enter the number of row"
read Row
num=1
for ((i=1 ; i<=Row; i++))
do 	num=1
	for (( j=1 ; j<=i; j++ ))
	do
		echo -n "$num"
		num=`expr $num + 1`
	done
	echo " "
done
