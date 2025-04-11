<?php

function morseCode(string $c): string {
    $morseMap = [
        'a' => '.-', 'b' => '-...', 'c' => '-.-.', 'd' => '-..', 'e' => '.',
        'f' => '..-.', 'g' => '--.', 'h' => '....', 'i' => '..', 'j' => '.---',
        'k' => '-.-', 'l' => '.-..', 'm' => '--', 'n' => '-.', 'o' => '---',
        'p' => '.--.', 'r' => '.-.', 's' => '...', 't' => '-', 'u' => '..-',
        'v' => '...-', 'w' => '.--', 'x' => '-..-', 'z' => '--..', 'y' => '-.--'
    ];
    return $morseMap[$c] ?? '';
}

$input = trim(fgets(STDIN));
$words = explode(" ", $input);

$uniqueMorse = [];

foreach ($words as $word) {
    $morse = "";
    foreach (str_split($word) as $c) {
        $morse .= morseCode($c);
    }
    $morseArray = str_split($morse);
    sort($morseArray);
    $sortedMorse = implode("", $morseArray);

    $uniqueMorse[$sortedMorse] = true;
}

echo count($uniqueMorse) . PHP_EOL;

?>
