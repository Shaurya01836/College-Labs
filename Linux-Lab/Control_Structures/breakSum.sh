echo "Enter a number"
read dnum
num=0
sum=0
flag=0
while [ $flag -eq 0 ]
do 
	num=`expr $dnum % 10`
	sum=`expr $sum + $num`
	dnum=`expr $dnum / 10`
	if [ $dnum -le 0 ]
	then 
		flag=1 
	fi
done
echo "$sum"
