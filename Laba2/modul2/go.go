package main

import (
	"bufio"
	"fmt"
	"os"
	"sort"
	"strings"
)

// Используем map для хранения соответствий символов и их Morse-кода
var morseMap = map[rune]string{
	'a': ".-",
	'b': "-...",
	'c': "-.-.",
	'd': "-..",
	'e': ".",
	'f': "..-.",
	'g': "--.",
	'h': "....",
	'i': "..",
	'j': ".---",
	'k': "-.-",
	'l': ".-..",
	'm': "--",
	'n': "-.",
	'o': "---",
	'p': ".--.",
	'r': ".-.",
	's': "...",
	't': "-",
	'u': "..-",
	'v': "...-",
	'w': ".--",
	'x': "-..-",
	'y': "-.--",
	'z': "--..",
}

// Функция преобразования символа в код Морзе
func morseCode(c rune) string {
	return morseMap[c] // Возвращает пустую строку, если символа нет в map
}

func main() {
	reader := bufio.NewReader(os.Stdin)
	input, _ := reader.ReadString('\n')
	input = strings.TrimSpace(input)
	words := strings.Split(input, " ")

	uniqueMorse := make(map[string]bool)

	for _, word := range words {
		morse := ""
		for _, c := range word {
			morse += morseCode(c)
		}
		
		morseChars := strings.Split(morse, "")
		sort.Strings(morseChars)
		sortedMorse := strings.Join(morseChars, "")
		
		uniqueMorse[sortedMorse] = true
	}

	fmt.Println(len(uniqueMorse))
}

