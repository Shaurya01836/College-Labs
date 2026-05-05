sum=0
sum1=0
res=0
echo "Enter the number of element"
read n
echo "Enter elements"
for((i=0; i<n ; i++))
do
	read element
	arr[i]=$element
done
for((i=0; i<n ;i++))
do 
	sum=`expr $sum + ${arr[i]}`
done
#echo "The Sum of array are : $sum"
for((i=n-1; i>=0 ; i--))
do 
	sum1=`expr $sum1 + ${arr[i]}`
done
#echo "The Sum of array are : $sum1"
res=`expr $sum - $sum1`
#echo "Difference is : $res"
if [ $sum -eq $sum1 ]
then 
	echo "You got it"
else 
	echo "No way"
fi
