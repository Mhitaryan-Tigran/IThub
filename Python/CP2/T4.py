import random

n = int(input("Введите количество элементов массива: "))
arr4 = [random.randint(-50, 50) for _ in range(n)]

print(f"Массив: {arr4}")

count_div_3 = sum(1 for x in arr4 if x % 3 == 0)
print(f"Количество чисел, делящихся на 3: {count_div_3}")

even_numbers = [x for x in arr4 if x % 2 == 0]
if even_numbers:
    avg_even = sum(even_numbers) / len(even_numbers)
    print(f"Среднее арифметическое чётных чисел: {avg_even}")
else:
    print("В массиве нет чётных чисел")
