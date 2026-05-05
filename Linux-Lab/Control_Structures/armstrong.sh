echo "Enter digit in your no :"
read d 
echo "Enter a number :"
read n 
original_no=$n
sum=0
i=1
rem=0
while [ $i -le $d ]
do
	rem=$((n%10))
	x=$((rem*rem*rem))
	sum=$((sum+x))
	newNo=$((n/10))
	n=$newN0
	i=$((i+1))
done 
if [ $sum -eq $original_no ]
then
	echo "number is armstrong"
else 
	echo "number is not armstrong"
fi
