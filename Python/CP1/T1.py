questions = [
    ("Что выведет print('Hello' + 'World')?", "A) HelloWorld", "B) Hello World", "C) Error"),
    ("Какой тип данных у 3.14?", "A) int", "B) str", "C) float"),
    ("Что делает list.append(5)?", "A) Заменяет элемент", "B) Добавляет в конец", "C) Удаляет элемент"),
    ("Какой результат 2 ** 3?", "A) 6", "B) 8", "C) 5"),
    ("Что возвращает len([1,2,3])?", "A) 3", "B) 6", "C) [1,2,3]"),
    ("Какой тип у '5'?", "A) int", "B) float", "C) str"),
    ("Что делает if x > 0:?", "A) Всегда True", "B) Проверяет x", "C) Цикл"),
    ("Как создать словарь?", "A) dict()", "B) list()", "C) str()"),
    ("Что выведет range(3)?", "A) [0,1,2]", "B) [1,2,3]", "C) Error"),
    ("Какой метод для строк?", "A) append()", "B) upper()", "C) pop()")
]

correct_answers = ['A', 'C', 'B', 'B', 'A', 'C', 'B', 'A', 'A', 'B']

score = 0
for i, q in enumerate(questions, 1):
    print(f"\nВопрос {i}: {q[0]}")
    print(f"{q[1]}\n{q[2]}\n{q[3]}")
    ans = input("Ваш ответ (A/B/C): ").upper()
    if ans == correct_answers[i-1]:
        print("Правильно")
        score += 1
    else:
        print("Не правильно")

print(f"\nИтог: {score}/10")
