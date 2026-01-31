def print_hello(name):
    print(f"Hello, {name}!")


def gcd(a, b):
    while b != 0:
        a, b = b, a % b
    return a

print_hello("Yandex")

result = gcd(12, 45)
print(result)
