N=0
a=0
b=1
echo "$a"
echo "$b"
while [ $N -le 5 ]
do 
	num=`expr $a + $b`
	echo "$num"
	a=$b
	b=$num
	N=`expr $N + 1`
done
