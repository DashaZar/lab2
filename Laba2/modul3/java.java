import java.util.Scanner;

public class Main {
    public static int sumDigitsDivisibleBy3(int num) {
        int sum = 0;
        num = Math.abs(num);
        while (num > 0) {
            int digit = num % 10;
            if (digit % 3 == 0 && digit != 0) {
                sum += digit;
            }
            num /= 10;
        }
        return sum;
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        int total = 0;
        for (int i = 0; i < n; i++) {
            int num = scanner.nextInt();
            total += sumDigitsDivisibleBy3(num);
        }
        System.out.println(total);
    }
}
