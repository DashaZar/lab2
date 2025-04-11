# Функция для подсчета суммы цифр, делящихся на 3
def sum_digits_divisible_by_3(num)
  sum = 0
  num = num.abs
  while num > 0
    digit = num % 10
    sum += digit if digit % 3 == 0 && digit != 0
    num /= 10
  end
  sum
end

# Чтение всех входных данных сразу (для JDoodle)
input = STDIN.read.split.map(&:to_i)

n = input[0]
if n <= 0 || input.size < n + 1
  puts "Ошибка: некорректный ввод"
  exit
end

total = 0
(1..n).each do |i|
  total += sum_digits_divisible_by_3(input[i])
end

puts "Сумма цифр, делящихся на 3: #{total}"
