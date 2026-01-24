even_sum = 0
even_count = 0

while True:
    num = int(input())
    if num == 100:
        even_sum += num
        even_count += 1
        break
    if num % 2 == 0:
        even_sum += num
        even_count += 1

if even_count > 0:
    avg = even_sum / even_count
    print(f"Среднее четных: {avg}")
else:
    print("Четных чисел нет")

