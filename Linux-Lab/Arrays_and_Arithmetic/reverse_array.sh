echo "Enter the number of element"
read n
echo "Enter elements"
for((i=0; i<n ; i++))
do
	read element
	arr[i]=$element
done
echo "The elements of array in reverse order are :"
for((i=n-1; i>=0 ;i--))
do 
	echo "${arr[i]}"
done
