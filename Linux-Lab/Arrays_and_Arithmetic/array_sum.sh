sum=0
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
echo "The Sum of array are : $sum"
