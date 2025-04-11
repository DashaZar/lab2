import java.util.Scanner;

public class Main {
    // Функция проверки, является ли число простым
    public static boolean isPrime(int num) {
        // Числа меньше или равные 1 не являются простыми
        if (num <= 1) return false;
        // 2 - единственное четное простое число
        if (num == 2) return true;
        // Все остальные четные числа не являются простыми
        if (num % 2 == 0) return false;
        // Проверяем делители от 3 до квадратного корня из num
        // Увеличиваем i на 2, чтобы проверять только нечетные числа
        for (int i = 3; i <= Math.sqrt(num); i += 2) {
            // Если num делится на i без остатка, оно не простое
            if (num % i == 0) return false;
        }
        // Если делителей не найдено, число простое
        return true;
    }

    // Функция поиска ближайшего простого числа к N и разницы между ними
    public static int[] nearestPrime(int N) {
        // Для чисел <= 1 ближайшее простое - 2, разница = N - 2
        if (N <= 1) return new int[]{2, N - 2};
        
        // Ищем ближайшее простое число меньше N
        int lower = N - 1;
        // Уменьшаем lower, пока не найдем простое число или не дойдем до 2
        while (lower >= 2 && !isPrime(lower)) {
            lower--;
        }
        
        // Ищем ближайшее простое число больше N
        int higher = N + 1;
        // Увеличиваем higher, пока не найдем простое число
        while (!isPrime(higher)) {
            higher++;
        }
        
        // Сравниваем расстояния до найденных простых чисел
        // Возвращаем массив из двух элементов:
        // [0] - ближайшее простое число, [1] - разница N - prime
        if (N - lower <= higher - N) {
            return new int[]{lower, N - lower};
        }
        return new int[]{higher, N - higher};
    }

    public static void main(String[] args) {
        // Создаем Scanner для чтения ввода пользователя
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter N: ");
        
        // Проверяем, что введено целое число
        if (!scanner.hasNextInt()) {
            System.out.println("Please enter a non-negative integer");
            return;
        }
        
        // Считываем число N
        int N = scanner.nextInt();
        
        // Проверяем, что число неотрицательное
        if (N < 0) {
            System.out.println("Please enter a non-negative integer");
            return;
        }
        
        // Получаем результат: ближайшее простое число и разницу
        int[] result = nearestPrime(N);
        
        // Выводим результат в формате:
        // Nearest prime: X, Difference: Y
        System.out.printf("Nearest prime: %d, Difference: %d\n", result[0], result[1]);
    }
}
