num = int(input("Enter a number : "))

org = num 
reverse = 0 

while(num > 0):
    reverse = reverse*10 + (num % 10)
    num = num // 10 

if(org == reverse):
    print("Palindrome number")
else:
    print("Not a Palindrome")
