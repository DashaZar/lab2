use std::collections::HashSet;
use std::io;

fn morse_code(c: char) -> &'static str {
    match c {
        'a' => ".-",
        'b' => "-...",
        'c' => "-.-.",
        'd' => "-..",
        'e' => ".",
        'f' => "..-.",
        'g' => "--.",
        'h' => "....",
        'i' => "..",
        'j' => ".---",
        'k' => "-.-",
        'l' => ".-..",
        'm' => "--",
        'n' => "-.",
        'o' => "---",
        'p' => ".--.",
        'r' => ".-.",
        's' => "...",
        't' => "-",
        'u' => "..-",
        'v' => "...-",
        'w' => ".--",
        'x' => "-..-",
        'z' => "--..",
        'y' => "-.--",
        _ => "",
    }
}

fn main() {
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    let words: Vec<&str> = input.trim().split_whitespace().collect();

    let mut unique_morse: HashSet<String> = HashSet::new();

    for word in words {
        let mut morse = String::new();
        for c in word.chars() {
            morse.push_str(morse_code(c));
        }
        let mut morse_chars: Vec<char> = morse.chars().collect();
        morse_chars.sort_unstable();
        let sorted_morse: String = morse_chars.into_iter().collect();

        unique_morse.insert(sorted_morse);
    }

    println!("{}", unique_morse.len());
}
