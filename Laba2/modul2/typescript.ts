"use strict";

// Определяем тип для кода Морзе
type MorseCode = {
  [key: string]: string;
};

// Таблица кодов Морзе с явным указанием типа
const morseCode: MorseCode = {
  'a': ".-", 'b': "-...", 'c': "-.-.", 'd': "-..", 'e': ".", 'f': "..-.",
  'g': "--.", 'h': "....", 'i': "..", 'j': ".---", 'k': "-.-", 'l': ".-..",
  'm': "--", 'n': "-.", 'o': "---", 'p': ".--.", 'q': "--.-", 'r': ".-.",
  's': "...", 't': "-", 'u': "..-", 'v': "...-", 'w': ".--", 'x': "-..-",
  'y': "-.--", 'z': "--.."
};

// Функция для обработки слов с указанием типа возвращаемого значения
function processWords(): void {
  const input: string | null = prompt("Введите слова через пробел:");
  
  if (!input) {
    alert("Вы не ввели ни одного слова");
    return;
  }
  
  try {
    const words: string[] = input.trim().toLowerCase().split(/\s+/);
    
    // Валидация
    if (words.length > 100) {
      throw new Error("Максимум 100 слов");
    }
    
    const codes: Set<string> = new Set();
    
    words.forEach((word: string) => {
      if (word.length > 12) {
        throw new Error(`Слово "${word}" > 12 букв`);
      }
      if (!/^[a-z]+$/.test(word)) {
        throw new Error(`Недопустимые символы в "${word}"`);
      }
      
      const morse: string = word.split('')
        .map((c: string) => morseCode[c])
        .join('');
      
      codes.add(morse.split('').sort().join(''));
    });
    
    alert(`Уникальных кодов: ${codes.size}`);
  } catch (error) {
    if (error instanceof Error) {
      alert("Ошибка: " + error.message);
    } else {
      alert("Произошла неизвестная ошибка");
    }
  }
}

// Вызываем функцию
processWords();
