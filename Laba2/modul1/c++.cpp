#include <iostream>
#include <cmath>

using namespace std;

bool isPrime(int num) {
    if (num <= 1) return false;
    if (num == 2) return true;
    if (num % 2 == 0) return false;
    for (int i = 3; i <= sqrt(num); i += 2) {
        if (num % i == 0) return false;
    }
    return true;
}

pair<int, int> nearestPrime(int N) {
    if (N <= 1) return make_pair(2, N - 2);
    
    // Ищем ближайшее простое меньше N
    int lower = N - 1;
    while (lower >= 2 && !isPrime(lower)) {
        lower--;
    }
    
    // Ищем ближайшее простое больше N
    int higher = N + 1;
    while (!isPrime(higher)) {
        higher++;
    }
    
    // Выбираем ближайшее
    if (N - lower <= higher - N) {
        return make_pair(lower, N - lower);
    } else {
        return make_pair(higher, N - higher);
    }
}

int main() {
    int N;
    cout << "Enter N: ";
    cin >> N;
    
    if (cin.fail() || N < 0) {
        cout << "Please enter a non-negative integer" << endl;
        return 1;
    }
    
    pair<int, int> result = nearestPrime(N);
    cout << "Nearest prime: " << result.first << ", Difference: " << result.second << endl;
    
    return 0;
}
