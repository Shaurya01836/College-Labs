echo "Enter a number :"
read a 
echo "Enter another number :"
read b 
flag=1
while [ $flag -eq 1 ]
do
	echo "Menu"
	echo "1.Addition"
	echo "2.Subtraction"
	echo "3.Multiplication"
	echo "4.division"
	echo "5.Exit"
	echo "Enter your choice :"
	read choice 
	
	case $choice in 
	1) sum=`expr $a + $b`
	echo "sum is : $sum" ;;
	2)
	sub=`expr $a - $b`
	echo "Sub is : $sub";;
	3)
	mul=`expr $a \* $b`
	echo "mul is : $mul";;
	4)
	div=`expr $a / $b`
	echo "div is : $div";;
	5)echo "Exiting" 
		flag=0;;
	*)echo "Invalid choice" ;;
	esac
done
