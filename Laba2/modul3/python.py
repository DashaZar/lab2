def sum_digits_divisible_by_3(num):
    sum = 0
    num = abs(num)
    while num > 0:
        digit = num % 10
        if digit % 3 == 0 and digit != 0:
            sum += digit
        num = num // 10
    return sum

n = int(input())
total = 0
for _ in range(n):
    num = int(input())
    total += sum_digits_divisible_by_3(num)
print(total)
