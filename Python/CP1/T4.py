text = input("Введите текст: ").split()
allowed = {'a', 'b', 'c', 'A', 'B', 'C'}

if all(word[0] in allowed for word in text if word):
    print("YES")
else:
    print("NO")
