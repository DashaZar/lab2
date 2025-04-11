using System;

class Program {
    static int SumDigitsDivisibleBy3(int num) {
        int sum = 0;
        num = Math.Abs(num);
        while (num > 0) {
            int digit = num % 10;
            if (digit % 3 == 0 && digit != 0) {
                sum += digit;
            }
            num /= 10;
        }
        return sum;
    }

    static void Main() {
        try {
            Console.WriteLine("Введите количество чисел (n):");
            int n;
            while (!int.TryParse(Console.ReadLine(), out n) || n <= 0) {
                Console.WriteLine("Ошибка! Введите целое положительное число:");
            }

            int total = 0;
            for (int i = 0; i < n; i++) {
                Console.WriteLine($"Введите число #{i + 1}:");
                int num;
                while (!int.TryParse(Console.ReadLine(), out num)) {
                    Console.WriteLine("Ошибка! Введите целое число:");
                }
                total += SumDigitsDivisibleBy3(num);
            }
            Console.WriteLine($"Сумма цифр, делящихся на 3: {total}");
        }
        catch (Exception ex) {
            Console.WriteLine($"Произошла ошибка: {ex.Message}");
        }
    }
}
