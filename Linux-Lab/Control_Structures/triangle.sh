echo "First angle :"
read a
echo "Second angle :"
read b
echo "Third angle :"
read c

flag=0
sum=$((a+b+c))

if [ $a -gt 0 -a $b -gt 0 -a $c -gt 0 ]
then 
	flag=1
else 
	flag=0
fi

if [ $flag -eq 1 -a $sum -eq 180 ]
then 
	echo "Triangle"
else 
	echo "No"
fi
