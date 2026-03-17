# we have to implement stack using list 

L = [] 
a = True

while a:
    print("Menu")
    print("1.push")
    print("2.pop")
    print("3.peek")
    print("4.Display")
    print("5.Exit")
    ch = input("Enter your choice : ")
    
    if(ch == '1'):
        num = input("Enter number :")
        if(num.isdigit()):
            num = int(num)
        L.insert(0 , num)
    elif(ch == '2'):
        if(len(L) != 0):
            print("Popped Element :" , L[0])
            L.remove(L[0])
        else:
            print("Stack underflow")
    elif(ch == '3'):
        if(len(L) != 0):
            print(L[0])
        else:
            print("Stack underflow")
    elif(ch == '4'):
        print(L)
    elif(ch == '5'):
        print("Exit")
        a = False
    else :
        print("Invalid Operation")    
    
    
    





