const readline = require('readline');

// Функция для подсчета суммы цифр, делящихся на 3
function sumDigitsDivisibleBy3(num) {
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

// Создаем интерфейс для чтения ввода
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

async function getInput(promptText) {
    return new Promise((resolve) => {
        rl.question(promptText, (answer) => {
            resolve(answer);
        });
    });
}

async function main() {
    try {
        // Запрашиваем количество чисел
        const n = parseInt(await getInput('Введите количество чисел: '));
        
        if (isNaN(n) || n <= 0) {
            throw new Error('Некорректное количество чисел. Введите положительное целое число.');
        }

        let total = 0;

        // Запрашиваем каждое число
        for (let i = 0; i < n; i++) {
            const num = parseInt(await getInput(`Введите число ${i + 1}: `));
            
            if (isNaN(num)) {
                console.log('Некорректный ввод. Пропускаем это число.');
                continue;
            }

            total += sumDigitsDivisibleBy3(num);
        }

        console.log(`Общая сумма цифр, делящихся на 3: ${total}`);
    } catch (error) {
        console.error('Ошибка:', error.message);
    } finally {
        rl.close();
    }
}

// Запускаем программу
main();
