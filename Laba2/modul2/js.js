const readline = require('readline').createInterface({
  input: process.stdin,
  output: process.stdout
});

const morseCode = {
  'a': ".-", 'b': "-...", 'c': "-.-.", 'd': "-..", 'e': ".", 'f': "..-.",
  'g': "--.", 'h': "....", 'i': "..", 'j': ".---", 'k': "-.-", 'l': ".-..",
  'm': "--", 'n': "-.", 'o': "---", 'p': ".--.", 'q': "--.-", 'r': ".-.",
  's': "...", 't': "-", 'u': "..-", 'v': "...-", 'w': ".--", 'x': "-..-",
  'y': "-.--", 'z': "--.."
};

function wordToMorse(word) {
  return word.split('').map(char => morseCode[char]).join('');
}

function countUniqueMorse(words) {
  const codes = new Set();
  words.forEach(word => {
    codes.add(wordToMorse(word).split('').sort().join(''));
  });
  return codes.size;
}

readline.question('Введите слова через пробел: ', input => {
  try {
    const words = input.trim().toLowerCase().split(/\s+/);
    
    // Проверки
    if (!words.length) throw new Error("Не введено ни одного слова");
    if (words.length > 100) throw new Error("Превышен лимит в 100 слов");
    
    for (const word of words) {
      if (word.length > 12) throw new Error(`Слово "${word}" превышает 12 символов`);
      if (!/^[a-z]+$/.test(word)) throw new Error(`Слово "${word}" содержит недопустимые символы`);
    }
    
    const result = countUniqueMorse(words);
    console.log(`Количество уникальных представлений: ${result}`);
  } catch (error) {
    console.error("Ошибка:", error.message);
  } finally {
    readline.close();
  }
});
