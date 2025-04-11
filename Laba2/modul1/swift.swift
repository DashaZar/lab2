import Foundation

func isPrime(_ num: Int) -> Bool {
    if num <= 1 {
        return false
    }
    if num == 2 {
        return true
    }
    if num % 2 == 0 {
        return false
    }
    var i = 3
    while i * i <= num {
        if num % i == 0 {
            return false
        }
        i += 2
    }
    return true
}

func nearestPrime(_ N: Int) -> (Int, Int) {
    if N <= 1 {
        return (2, N - 2)
    }
    var lower = N - 1
    while lower >= 2 && !isPrime(lower) {
        lower -= 1
    }
    var higher = N + 1
    while !isPrime(higher) {
        higher += 1
    }
    return (N - lower) <= (higher - N) ? (lower, N - lower) : (higher, N - higher)
}

print("Enter N: ", terminator: "")
guard let input = readLine(), let N = Int(input), N >= 0 else {
    print("Please enter a non-negative integer")
    exit(0)
}
let (prime, diff) = nearestPrime(N)
print("Nearest prime: \(prime), Difference: \(diff)")

