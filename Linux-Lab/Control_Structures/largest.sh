echo "Enter number a"
read a
echo "Enter number b"
read b
echo "Enter number c"
read c
if [ $a -gt $b -a $a -gt $c ]
then 
	echo "$a is greater"
fi
if [ $b -gt $a -a $b -gt $c ]
then
	echo "$b is greater"
fi
if [ $c -gt $a -a $c -gt $b ]
then
	echo "$c is greater"
fi
