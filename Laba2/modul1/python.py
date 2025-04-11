import math

def is_prime(num):
    if num <= 1:
        return False
    if num == 2:
        return True
    if num % 2 == 0:
        return False
    for i in range(3, int(math.sqrt(num)) + 1, 2):
        if num % i == 0:
            return False
    return True

def nearest_prime(N):
    if N <= 1:
        return 2, N - 2
    lower = N - 1
    while lower >= 2 and not is_prime(lower):
        lower -= 1
    higher = N + 1
    while not is_prime(higher):
        higher += 1
    return (lower, N - lower) if (N - lower <= higher - N) else (higher, N - higher)

try:
    N = int(input("Enter N: "))
    if N < 0:
        print("Please enter a non-negative integer")
    else:
        prime, diff = nearest_prime(N)
        print(f"Nearest prime: {prime}, Difference: {diff}")
except ValueError:
    print("Please enter a non-negative integer")

