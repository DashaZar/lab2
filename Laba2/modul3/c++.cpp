#include <iostream>
using namespace std;

int sumDigitsDivisibleBy3(int num) {
    int sum = 0;
    num = abs(num);
    while (num > 0) {
        int digit = num % 10;
        if (digit % 3 == 0 && digit != 0) {
            sum += digit;
        }
        num /= 10;
    }
    return sum;
}

int main() {
    int n, total = 0;
    cin >> n;
    for (int i = 0; i < n; i++) {
        int num;
        cin >> num;
        total += sumDigitsDivisibleBy3(num);
    }
    cout << total << endl;
    return 0;
}
