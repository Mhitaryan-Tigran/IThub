import random

rows = int(input("Введите количество строк: "))
cols = int(input("Введите количество столбцов: "))

arr2 = [[random.randint(-20, 20) for _ in range(cols)] for _ in range(rows)]

print("Двумерный массив:")
for row in arr2:
    print(row)

min_element = min(min(row) for row in arr2)
print(f"\nМинимальный элемент: {min_element}")

if rows > 1:
    print(f"Вторая строка: {arr2[1]}")
else:
    print("Вторая строка отсутствует (массив имеет менее 2 строк)")

print(f"Первый столбец: {[row[0] for row in arr2]}")
