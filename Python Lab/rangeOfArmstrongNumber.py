for num in range (100 , 1000):
    original = num
    sum = 0
    while (num > 0):
        digit = num % 10
        sum += digit * digit * digit
        num //= 10


    if sum == original:
        print(original)
