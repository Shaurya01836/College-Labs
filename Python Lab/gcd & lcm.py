num1 = int(input("Enter first number: "))
num2 = int(input("Enter second number: "))

a = num1
b = num2


for i in range(1, min(num1, num2) + 1):
    if(num1 % i == 0 and num2 % i == 0):
        gcd = i

lcm = (num1 * num2) // gcd

print("GCD:", gcd)
print("LCM:", lcm)