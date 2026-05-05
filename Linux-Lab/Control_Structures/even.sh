echo "Enter a number"
read a 
if [ `expr $a % 2` -eq 0 ]
then
	echo "$a Number is even"
else 
	echo "$a Number is odd"
fi
