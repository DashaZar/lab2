MORSE_CODES = {
    'a': '.-', 'b': '-...', 'c': '-.-.', 'd': '-..', 'e': '.',
    'f': '..-.', 'g': '--.', 'h': '....', 'i': '..', 'j': '.---',
    'k': '-.-', 'l': '.-..', 'm': '--', 'n': '-.', 'o': '---',
    'p': '.--.', 'r': '.-.', 's': '...', 't': '-', 'u': '..-',
    'v': '...-', 'w': '.--', 'x': '-..-', 'z': '--..', 'y': '-.--'
}

def word_to_morse(word):
    return ''.join([MORSE_CODES[c] for c in word])

def unique_morse_representations(words):
    unique = set()
    for word in words:
        morse = word_to_morse(word)
        sorted_morse = ''.join(sorted(morse))
        unique.add(sorted_morse)
    return len(unique)

def main():
    import sys
    input_words = sys.stdin.read().strip().split()
    
    # Проверки
    if not 1 <= len(input_words) <= 100:
        print("Invalid number of words (1-100)", file=sys.stderr)
        sys.exit(1)
    
    for word in input_words:
        if not 1 <= len(word) <= 12:
            print("Word length must be 1-12 characters", file=sys.stderr)
            sys.exit(1)
        if not all(c in MORSE_CODES for c in word):
            print("Only lowercase English letters allowed", file=sys.stderr)
            sys.exit(1)
    
    print(unique_morse_representations(input_words))

if __name__ == "__main__":
    main()
