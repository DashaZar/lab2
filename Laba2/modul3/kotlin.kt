fun sumDigitsDivisibleBy3(num: Int): Int {
    var sum = 0
    var n = Math.abs(num)
    while (n > 0) {
        val digit = n % 10
        if (digit % 3 == 0 && digit != 0) {
            sum += digit
        }
        n /= 10
    }
    return sum
}

fun main() {
    val n = readLine()!!.toInt()
    var total = 0
    for (i in 1..n) {
        val num = readLine()!!.toInt()
        total += sumDigitsDivisibleBy3(num)
    }
    println(total)
}
