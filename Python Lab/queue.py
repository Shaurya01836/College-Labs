# we have to implement queue using list 

L = [] 
a = True

front = 0 
rear = 0 

while a:
    print("Menu")
    print("1.Insert")
    print("2.Delete")
    print("3.Front Element")
    print("4.Rear Element")
    print("5.Display")
    print("6.Middle")
    print("7.Exit")
    ch = input("Enter your choice : ")
    
    if(ch == '1'):
        num = input("Enter number :")
        if(num.isdigit()):
            num = int(num)
        L.append(num)
        rear = rear + 1 
    elif(ch == '2'):
        if(len(L) != 0):
            print("Deleted Element :" , L[front])
            L.remove(L[front])
        else:
            print("Queue underflow")
    elif(ch == '3'):
        if(len(L) != 0):
            print("Front element :" , L[0])
        else:
            print("Queue underflow")
    elif(ch == '4'):
        if(len(L) != 0):
            print("Rear element :" , L[len(L)-1])
        else:
            print("Queue underflow")
    elif(ch == '5'):
        print(L)
    elif(ch =='6'):
        if(len(L) % 2 == 0):
            print("Middle elements : " , L[len(L) //2 -1 ] , L[len(L) //2] )
        else :
            print("Middle elements :" , L[len(L)//2])
    elif(ch == '7'):
        a = False 
        print("exit")
    else :
        print("Invalid Operation")    
    
    
    





