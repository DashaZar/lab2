use std::io;

fn sum_digits_divisible_by_3(num: i32) -> i32 {
    let mut sum = 0;
    let mut n = num.abs();
    while n > 0 {
        let digit = n % 10;
        if digit % 3 == 0 && digit != 0 {
            sum += digit;
        }
        n /= 10;
    }
    sum
}

fn main() {
    let mut input = String::new();
    io::stdin().read_line(&mut input).unwrap();
    let n: i32 = input.trim().parse().unwrap();
    
    let mut total = 0;
    for _ in 0..n {
        input.clear();
        io::stdin().read_line(&mut input).unwrap();
        let num: i32 = input.trim().parse().unwrap();
        total += sum_digits_divisible_by_3(num);
    }
    println!("{}", total);
}
