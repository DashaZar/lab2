import java.util.*;

public class Main {
    // Создаем Map для хранения соответствий символов и их Morse-кода
    private static final Map<Character, String> morseMap = new HashMap<>() {{
        put('a', ".-");
        put('b', "-...");
        put('c', "-.-.");
        put('d', "-..");
        put('e', ".");
        put('f', "..-.");
        put('g', "--.");
        put('h', "....");
        put('i', "..");
        put('j', ".---");
        put('k', "-.-");
        put('l', ".-..");
        put('m', "--");
        put('n', "-.");
        put('o', "---");
        put('p', ".--.");
        put('r', ".-.");
        put('s', "...");
        put('t', "-");
        put('u', "..-");
        put('v', "...-");
        put('w', ".--");
        put('x', "-..-");
        put('y', "-.--");
        put('z', "--..");
    }};

    static String morseCode(char c) {
        // Возвращаем значение из Map или пустую строку, если символа нет
        return morseMap.getOrDefault(c, "");
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String input = scanner.nextLine();
        String[] words = input.split(" ");

        Set<String> uniqueMorse = new HashSet<>();

        for (String word : words) {
            StringBuilder morse = new StringBuilder();
            for (char c : word.toCharArray()) {
                morse.append(morseCode(c));
            }
            char[] morseArray = morse.toString().toCharArray();
            Arrays.sort(morseArray);
            String sortedMorse = new String(morseArray);

            uniqueMorse.add(sortedMorse);
        }

        System.out.println(uniqueMorse.size());
        scanner.close();
    }
}
