L = []

n = int(input("Enter number of elements: "))

for i in range(n):
    num = int(input("Enter number: "))
    L.append(num)


mid = len(L) // 2
arr1 = L[:mid]
arr2 = L[mid:]


arr1.sort()
arr2.sort()


i = 0
j = 0
merged = []

while i < len(arr1) and j < len(arr2):
    if arr1[i] < arr2[j]:
        merged.append(arr1[i])
        i += 1
    else:
        merged.append(arr2[j])
        j += 1

while i < len(arr1):
    merged.append(arr1[i])
    i += 1

while j < len(arr2):
    merged.append(arr2[j])
    j += 1

print("Sorted list:", merged)