fun morseCode(c: Char): String {
    return when (c) {
        'a' -> ".-"
        'b' -> "-..."
        'c' -> "-.-."
        'd' -> "-.."
        'e' -> "."
        'f' -> "..-."
        'g' -> "--."
        'h' -> "...."
        'i' -> ".."
        'j' -> ".---"
        'k' -> "-.-"
        'l' -> ".-.."
        'm' -> "--"
        'n' -> "-."
        'o' -> "---"
        'p' -> ".--."
        'r' -> ".-."
        's' -> "..."
        't' -> "-"
        'u' -> "..-"
        'v' -> "...-"
        'w' -> ".--"
        'x' -> "-..-"
        'z' -> "--.."
        'y' -> "-.--"
        else -> ""
    }
}

fun main() {
    val input = readLine() ?: ""
    val words = input.split(" ")

    val uniqueMorse = mutableSetOf<String>()

    for (word in words) {
        var morse = ""
        for (c in word) {
            morse += morseCode(c)
        }
        morse = morse.toCharArray().sorted().joinToString("")
        uniqueMorse.add(morse)
    }

    println(uniqueMorse.size)
}
 
