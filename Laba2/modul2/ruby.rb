require 'set'

MORSE_CODES = {
  'a' => '.-', 'b' => '-...', 'c' => '-.-.', 'd' => '-..', 'e' => '.',
  'f' => '..-.', 'g' => '--.', 'h' => '....', 'i' => '..', 'j' => '.---',
  'k' => '-.-', 'l' => '.-..', 'm' => '--', 'n' => '-.', 'o' => '---',
  'p' => '.--.', 'r' => '.-.', 's' => '...', 't' => '-', 'u' => '..-',
  'v' => '...-', 'w' => '.--', 'x' => '-..-', 'z' => '--..', 'y' => '-.--'
}

def word_to_morse(word)
  word.chars.map { |c| MORSE_CODES[c] }.join
end

def unique_morse_representations(words)
  unique = Set.new
  words.each do |word|
    morse = word_to_morse(word)
    sorted_morse = morse.chars.sort.join
    unique.add(sorted_morse)
  end
  unique.size
end

begin
  print "Enter words separated by spaces: "
  input = gets.chomp
  words = input.split

  # Проверки
  if words.empty? || words.size > 100
    puts "Invalid number of words (1-100)"
    exit 1
  end

  words.each do |word|
    if word.length < 1 || word.length > 12
      puts "Word length must be 1-12 characters"
      exit 1
    end
    unless word.match(/^[a-z]+$/)
      puts "Only lowercase English letters allowed"
      exit 1
    end
  end

  puts unique_morse_representations(words)
rescue => e
  puts "Error: #{e.message}"
  exit 1
end
