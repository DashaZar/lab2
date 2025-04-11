import Foundation

let morseCodes: [Character: String] = [
    "a": ".-", "b": "-...", "c": "-.-.", "d": "-..", "e": ".",
    "f": "..-.", "g": "--.", "h": "....", "i": "..", "j": ".---",
    "k": "-.-", "l": ".-..", "m": "--", "n": "-.", "o": "---",
    "p": ".--.", "r": ".-.", "s": "...", "t": "-", "u": "..-",
    "v": "...-", "w": ".--", "x": "-..-", "z": "--..", "y": "-.--"
]

func morseCode(_ c: Character) -> String {
    return morseCodes[c] ?? ""
}

func wordToMorse(_ word: String) -> String {
    var morse = ""
    for c in word {
        morse += morseCode(c)
    }
    return morse
}

func uniqueMorseRepresentations(_ words: [String]) -> Int {
    var unique = Set<String>()
    for word in words {
        let morse = wordToMorse(word)
        let sortedMorse = String(morse.sorted())
        unique.insert(sortedMorse)
    }
    return unique.count
}

// Чтение ввода
print("Enter words separated by spaces: ", terminator: "")
guard let input = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines) else {
    fatalError("No input provided")
}

let words = input.components(separatedBy: .whitespaces).filter { !$0.isEmpty }

// Проверки
if words.isEmpty || words.count > 100 {
    print("Invalid number of words (1-100)")
    exit(1)
}

for word in words {
    if word.count < 1 || word.count > 12 {
        print("Word length must be 1-12 characters")
        exit(1)
    }
    if !word.allSatisfy({ morseCodes.keys.contains($0) }) {
        print("Only lowercase English letters a-z allowed")
        exit(1)
    }
   }
print(uniqueMorseRepresentations(words))
