a = "Welcome"

print(a.find('el'))

print(a.find('e' , 6)) #start from index 6

print(a.find('z' , 2))


# print(a.index('z' , 2)) 
# index fn shows error if substring not present 

print(a.isalpha())

a = "welc123"

print(a.isalpha())

print("checking a is alnum or not:" ,a.isalnum())

a = "123"

print("checking a is digit is not:" , a.isdigit())

print("checking a is numeric or not:" ,a.isnumeric())

a = 65
# ascii to char
print(a , "ascii to character : " , chr(a))

y = chr(65)
print(type(y) , y)

h = 'a'

print("ascii value of" , h , ":" , ord(h))


a = "Welcome {} to {} pce".format("Students" , "all")
print("after using format in string :" , a) 

a = "hello {1} india {0} fine".format("all" , "person")

print(a)

a = "I am {a} {b} fine".format(a = "@" , b = 20)

print(a)

a = "I {a:10} am {b:20} Shaurya".format(a = 10 , b = 20)

print(a)

a = "I {a:^10} am {b:^10} fine".format(a = "Nitin" , b = "hello")
print(a)

a = "I {a:<10} am {b:<10} fine".format(a = "Nitin" , b = "hello")
print(a)

a = "I {a:>10} am {b:>10} fine".format(a = "Nitin" , b = "hello")
print(a)