num = int(input("Enter a number:"))

if(num > 10):
    print("It is out of range")
else:
    for n in range(num-1,0,-1):
        num = num*n ; 
    print(num)
