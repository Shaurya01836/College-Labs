# user se input lena h aur list me store karana h 

l = []

n = int(input("Enter the size of the list : "))

for i in range(n) :
    flag = int(input("String(0) or Number(1) : "))
    if(flag):
        num = int(input("Enter number : "))
    else:
        num = input("Enter String :")
    l.append(num) 
    
print(l)

print(l[2::2])

