echo "Enter a value "
read num

if [ $num -gt 0 -a $num -lt 10 ]
then 
	num=1
fi

if [ $num -gt 10 -a $num -lt 100 ]
then 
	num=2
fi

if [ $num -gt 100 -a $num -lt 1000 ]
then 
	num=3
fi


case $num in
1)echo "Hello India";;
2)echo "Hello world";;
3)echo "Hello PCE";;
*)echo "Please enter a valid input" ;;
esac
