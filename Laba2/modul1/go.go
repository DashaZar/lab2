package main

import (
	"fmt"
	"math"
)

// Функция проверки, является ли число простым
func isPrime(num int) bool {
	// Числа меньше или равные 1 не являются простыми
	if num <= 1 {
		return false
	}
	// 2 - единственное четное простое число
	if num == 2 {
		return true
	}
	// Все остальные четные числа не являются простыми
	if num%2 == 0 {
		return false
	}
	// Проверяем делители от 3 до квадратного корня из num
	// Увеличиваем i на 2, чтобы проверять только нечетные числа
	for i := 3; i <= int(math.Sqrt(float64(num))); i += 2 {
		// Если num делится на i без остатка, оно не простое
		if num%i == 0 {
			return false
		}
	}
	// Если делителей не найдено, число простое
	return true
}

// Функция поиска ближайшего простого числа к N
func nearestPrime(N int) int {
	// Для чисел <= 1 ближайшее простое - 2
	if N <= 1 {
		return 2
	}
	
	// Ищем ближайшее простое число меньше N
	lower := N - 1
	// Уменьшаем lower, пока не найдем простое число или не дойдем до 2
	for lower >= 2 && !isPrime(lower) {
		lower--
	}
	
	// Ищем ближайшее простое число больше N
	higher := N + 1
	// Увеличиваем higher, пока не найдем простое число
	for !isPrime(higher) {
		higher++
	}
	
	// Сравниваем расстояния до найденных простых чисел
	// Возвращаем то, которое ближе к N
	if N-lower <= higher-N {
		return lower
	}
	return higher
}

func main() {
	var N int
	// Запрашиваем у пользователя ввод числа N
	fmt.Print("Enter N: ")
	// Считываем ввод
	_, err := fmt.Scan(&N)
	// Проверяем на ошибки ввода (например, если введено не число)
	// или если число отрицательное
	if err != nil || N < 0 {
		fmt.Println("Please enter a non-negative integer")
		return
	}
	
	// Находим ближайшее простое число к N
	prime := nearestPrime(N)
	// Вычисляем разницу между N и ближайшим простым числом
	result := N - prime
	
	// Выводим результат
	fmt.Printf("The %d-th term is: %d\n", N, result)
}
