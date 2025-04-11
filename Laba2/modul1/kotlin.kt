import java.util.Scanner
import kotlin.math.sqrt

fun isPrime(num: Int): Boolean {
    if (num <= 1) return false
    if (num == 2) return true
    if (num % 2 == 0) return false
    for (i in 3..sqrt(num.toDouble()).toInt() step 2) {
        if (num % i == 0) return false
    }
    return true
}

fun nearestPrime(N: Int): Pair<Int, Int> {
    if (N <= 1) return Pair(2, N - 2)
    var lower = N - 1
    while (lower >= 2 && !isPrime(lower)) {
        lower--
    }
    var higher = N + 1
    while (!isPrime(higher)) {
        higher++
    }
    return if (N - lower <= higher - N) Pair(lower, N - lower) else Pair(higher, N - higher)
}

fun main() {
    val scanner = Scanner(System.`in`)
    print("Enter N: ")
    if (!scanner.hasNextInt()) {
        println("Please enter a non-negative integer")
        return
    }
    val N = scanner.nextInt()
    if (N < 0) {
        println("Please enter a non-negative integer")
        return
    }
    val (prime, diff) = nearestPrime(N)
    println("Nearest prime: $prime, Difference: $diff")
}
