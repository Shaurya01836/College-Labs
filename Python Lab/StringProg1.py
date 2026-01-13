s = input("Enter a string :")
s.lower()


for i in range (0 , min(7 , len(s))):
    print(s[i])

if(len(s) > 7):
    print("Index out of bound error !!")



print()
print("Lower : ")
temp = ""
for i in range (0 , min(7 , len(s))):
    temp = temp + s[i]
print(temp.lower())

print()
print("Title : ")
print(temp.title())

print()
print("Capitalize : ")
print(temp.capitalize())
