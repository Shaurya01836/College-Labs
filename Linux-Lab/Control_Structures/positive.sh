echo "Enter a number"
read a
if [ $a -gt 0 ]
then 
	echo "$a is positive number"
fi
if [ $a -lt 0 ]
then 
	echo "$a is negative"
fi
if [ $a -eq 0 ]
then 
	echo "$a is neither negative nor positive"
fi
