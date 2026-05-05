echo "Enter the number of element"
read n
echo "Enter elements"
for((i=0; i<n ; i++))
do
	read element
	arr[i]=$element
done
echo "The elements of array are :"
for((i=0; i<n ;i++))
do 
	echo "${arr[i]}"
done
