func sumDigitsDivisibleBy3(_ num: Int) -> Int {
    var sum = 0
    var n = abs(num)
    while n > 0 {
        let digit = n % 10
        if digit % 3 == 0 && digit != 0 {
            sum += digit
        }
        n /= 10
    }
    return sum
}

let n = Int(readLine()!)!
var total = 0
for _ in 0..<n {
    let num = Int(readLine()!)!
    total += sumDigitsDivisibleBy3(num)
}
print(total)
