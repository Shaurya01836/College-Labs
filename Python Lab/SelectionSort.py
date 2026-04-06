l = []

n = int(input("Enter the number of elements: "))

for i in range(n):
    num = int(input("Enter number: "))
    l.append(num)

print("Unsorted array:", l)

for i in range(n):
    min_i = i
    for j in range(i + 1, n):
        if l[j] < l[min_i]:
            min_i = j

    temp = l[i]
    l[i] = l[min_i]
    l[min_i] = temp

print("Sorted array:", l)