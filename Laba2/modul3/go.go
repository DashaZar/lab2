package main

import (
	"fmt"
)

// Функция для вычисления суммы цифр числа, которые делятся на 3 (но не равны 0)
func sumDigitsDivisibleBy3(num int) int {
	sum := 0  // Инициализируем сумму
	
	// Обрабатываем отрицательные числа - берем их модуль
	if num < 0 {
		num = -num
	}
	
	// Разбираем число по цифрам, пока оно больше 0
	for num > 0 {
		digit := num % 10  // Получаем последнюю цифру числа
		
		// Проверяем, что цифра делится на 3 и не равна 0
		if digit%3 == 0 && digit != 0 {
			sum += digit  // Добавляем цифру к сумме
		}
		
		num /= 10  // Убираем последнюю цифру из числа
	}
	
	return sum  // Возвращаем полученную сумму
}

func main() {
	var n, num, total int
	
	// Считываем количество чисел для обработки
	fmt.Scan(&n)
	
	// Читаем и обрабатываем каждое число
	for i := 0; i < n; i++ {
		fmt.Scan(&num)  // Читаем очередное число
		total += sumDigitsDivisibleBy3(num)  // Добавляем сумму подходящих цифр к общему результату
	}
	
	// Выводим итоговую сумму
	fmt.Println(total)
}
