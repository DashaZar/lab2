using System;
using System.Collections.Generic;
using System.Linq;

public class Solution {
    // Создаем словарь для хранения соответствий символов и их Morse-кода
    private static readonly Dictionary<char, string> morseMap = new Dictionary<char, string> {
        {'a', ".-"},
        {'b', "-..."},
        {'c', "-.-."},
        {'d', "-.."},
        {'e', "."},
        {'f', "..-."},
        {'g', "--."},
        {'h', "...."},
        {'i', ".."},
        {'j', ".---"},
        {'k', "-.-"},
        {'l', ".-.."},
        {'m', "--"},
        {'n', "-."},
        {'o', "---"},
        {'p', ".--."},
        {'r', ".-."},
        {'s', "..."},
        {'t', "-"},
        {'u', "..-"},
        {'v', "...-"},
        {'w', ".--"},
        {'x', "-..-"},
        {'y', "-.--"},
        {'z', "--.."}
    };

    static string MorseCode(char c) {
        // Получаем значение из словаря или возвращаем пустую строку
        return morseMap.TryGetValue(c, out string code) ? code : "";
    }

    public static void Main(string[] args) {
        string input = Console.ReadLine();
        string[] words = input.Split(' ');

        HashSet<string> uniqueMorse = new HashSet<string>();

        foreach (string word in words) {
            string morse = string.Concat(word.Select(c => MorseCode(c)));
            char[] morseArray = morse.ToCharArray();
            Array.Sort(morseArray);
            string sortedMorse = new string(morseArray);

            uniqueMorse.Add(sortedMorse);
        }

        Console.WriteLine(uniqueMorse.Count);
    }
}
