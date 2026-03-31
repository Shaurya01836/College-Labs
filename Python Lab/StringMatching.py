str1 = input("Enter string 1 :")


str2 = input("Enter string 2 :")

if(len(str1) != len(str2)) :
    print("Strings are not same due to length")
else : 
    flag = 1 
    for i in range (0 , len(str1)):
        if(str1[i] != str2[i]):
            flag = 0
    
    if(flag):
        print("String are same")
    else : 
        print("String are not same")
