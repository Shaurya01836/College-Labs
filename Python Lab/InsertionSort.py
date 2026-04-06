l = []

n = int(input("Enter the number of elements:"))

for i in range(0 , n):
    num = int(input("Enter number:"))
    l.append(num)
    
print("Unsorted array :" , l)

for i in range(1 , n):
    elem = l[i]
    j = i-1
    
    while(j >= 0 and elem < l[j]): 
        l[j+1] = l[j]
        j = j-1
    
    l[j+1] = elem


print("Sorted array :  " , l)
    