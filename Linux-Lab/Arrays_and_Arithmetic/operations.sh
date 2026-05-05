echo "Enter the value of a"
read a
echo "Enter the value of b"
read b 
sum=`expr $a + $b`
echo "sum is : $sum"
sub=`expr $a - $b`
echo "Sub is : $sub"
mul=`expr $a \* $b`
echo "mul is : $mul"
div=`expr $a / $b`
echo "div is : $div"
mod=`expr $a % $b`
echo "mod is : $mod"

