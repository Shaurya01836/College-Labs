echo "Enter a number"
read a
if [ `expr $a % 11` -eq 0 ]
then 
	echo "$a Number is divisible by 11"
else 
	echo "$a Number is not divisible by 11"
fi
