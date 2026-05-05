echo "Enter digit in your no :"
read a
echo "Enter a number : "
read num
original_num=$num
i=1
reverse=0
while [ $i -le $a ]
do 
	rem=$((num % 10))
	reverse=$((reverse * 10 + rem))
	num=$((num / 10))
	i=$((i + 1))
done
if [ $reverse -eq $original_num ]
then 
	echo "Palandrom"
else 
	echo "Not"
fi
