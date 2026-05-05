echo "Enter a value"
read a 
i=2
flag=0
while [ $i -lt $a ]
do 
	if [ `expr $a % $i` -eq 0 ]
	then 
		flag=1
	fi
	i=`expr $i + 1`
done 
if [ $flag -eq 0 ]
then 
	echo "Prime number"
else 
	echo "Not a Prime number"
fi
