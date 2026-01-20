str1 = input("Enter a string:")
str2 = input("Enter another string:")

st = ""

# str = "{} hello i {}".format("Shaurya" , "nitin")
# print(str)


for i in range(len(str2)):
    if(str2[i] == ' '):
        str1 = "{} ".format(st) + str1
        st = ""
    st = st + str2[i]

str1 = str1 + " {}".format(st)

print(str1)