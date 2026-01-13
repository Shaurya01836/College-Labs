str = input("Enter a string :")


i = 0 
j = len(str)-1

flag = 1 


while(i < j):
    if(str[i] != str[j]):
        print("Not an palindrome")
        flag = 0
        break
    i = i+1 
    j = j-1 


if(flag == 1):
    print("Palindrome string")




