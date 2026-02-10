# str =  input("Enter a string:")
# l = str.split() 

# print(l)

l = []

for a in range(1,4):
    s = input("Enter the string " + str(a) + " :-")
    l.append(s)
    
print(l)


l = [10,20,30,40,10]
print("Count of 10: " + str(l.count(10)))
print("Max value in list: " + str(max(l)))
print("Max value in list: " + str(min(l)))

l = ["Hello" , "World", "Zoo"]

print("Max value in list: " + str(max(l)))
print("Max value in list: " + str(min(l)))


# for finding the index number
print("Index in list: " + str(l.index("Zoo")))


l.reverse()
print(l)

l1 = [2,4,5,5]
l2 = [3,56,3,2]

# l2.append(l1)

# print(l2)

l2.extend(l1)

print(l2)

l1 = [10,20,40,60]
l2 = [20,30,60,80]

for i in range(0, len(l1)):
    print(l1[i] , "    " , l2[i])
    
    