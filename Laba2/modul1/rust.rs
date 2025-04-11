use std::io;

fn is_prime(num: i32) -> bool {
    if num <= 1 {
        return false;
    }
    if num == 2 {
        return true;
    }
    if num % 2 == 0 {
        return false;
    }
    let mut i = 3;
    while i * i <= num {
        if num % i == 0 {
            return false;
        }
        i += 2;
    }
    true
}

fn nearest_prime(N: i32) -> (i32, i32) {
    if N <= 1 {
        return (2, N - 2);
    }
    let mut lower = N - 1;
    while lower >= 2 && !is_prime(lower) {
        lower -= 1;
    }
    let mut higher = N + 1;
    while !is_prime(higher) {
        higher += 1;
    }
    if N - lower <= higher - N {
        (lower, N - lower)
    } else {
        (higher, N - higher)
    }
}

fn main() {
    println!("Enter N: ");
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    let N: i32 = match input.trim().parse() {
        Ok(num) if num >= 0 => num,
        _ => {
            println!("Please enter a non-negative integer");
            return;
        }
    };
    let (prime, diff) = nearest_prime(N);
    println!("Nearest prime: {}, Difference: {}", prime, diff);
}

