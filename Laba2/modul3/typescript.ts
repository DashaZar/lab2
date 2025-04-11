function sumDigitsDivisibleBy3(num: number): number {
    let sum = 0;
    num = Math.abs(num);
    while (num > 0) {
        const digit = num % 10;
        if (digit % 3 === 0 && digit !== 0) {
            sum += digit;
        }
        num = Math.floor(num / 10);
    }
    return sum;
}

function main() {
    const n = parseInt(prompt("Введите количество чисел:") || "0");
    
    if (isNaN(n) || n <= 0) {
        alert("Ошибка: введите положительное число");
        return;
    }

    let total = 0;
    for (let i = 0; i < n; i++) {
        const num = parseInt(prompt(`Введите число ${i + 1}/${n}:`) || "0");
        total += sumDigitsDivisibleBy3(num);
    }

    alert(`Сумма цифр, делящихся на 3: ${total}`);
}

main();
