n = int(input("Введите количество элементов массива: "))
arr3 = []

for i in range(n):
    elem = int(input(f"Введите элемент {i + 1}: "))
    arr3.append(elem)

print(f"Массив: {arr3}")

has_two_zeros = False
for i in range(len(arr3) - 1):
    if arr3[i] == 0 and arr3[i + 1] == 0:
        has_two_zeros = True
        break

if has_two_zeros:
    print("В массиве есть два подряд идущих нуля")
else:
    print("В массиве нет двух подряд идущих нулей")
