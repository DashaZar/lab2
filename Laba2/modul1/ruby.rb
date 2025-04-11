def nearest_prime(n)
  return 2 if n <= 1
  
  # Ищем ближайшее простое меньше n
  lower = n - 1
  lower -= 1 while lower >= 2 && !prime?(lower)
  
  # Ищем ближайшее простое больше n
  higher = n + 1
  higher += 1 until prime?(higher)
  
  # Выбираем ближайшее
  (n - lower) <= (higher - n) ? lower : higher
end

def prime?(num)
  return false if num <= 1
  return true if num == 2
  (2..Math.sqrt(num).to_i).none? { |i| num % i == 0 }
end

# Пример использования
print "Введите число: "
number = gets.chomp.to_i
prime = nearest_prime(number)
puts "Ближайшее простое число: #{prime}"
puts "Разность: #{number - prime}" #{result}"
