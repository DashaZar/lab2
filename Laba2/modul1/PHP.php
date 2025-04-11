<?php
function isPrime($num) {
    if ($num <= 1) return false;
    if ($num == 2) return true;
    if ($num % 2 == 0) return false;
    for ($i = 3; $i <= sqrt($num); $i += 2) {
        if ($num % $i == 0) return false;
    }
    return true;
}

function nearestPrime($N) {
    if ($N <= 1) return [2, $N - 2];
    $lower = $N - 1;
    while ($lower >= 2 && !isPrime($lower)) {
        $lower--;
    }
    $higher = $N + 1;
    while (!isPrime($higher)) {
        $higher++;
    }
    return ($N - $lower <= $higher - $N) ? [$lower, $N - $lower] : [$higher, $N - $higher];
}

echo "Enter N: ";
$input = trim(fgets(STDIN));
if (!is_numeric($input) || $input < 0) {
    echo "Please enter a non-negative integer\n";
} else {
    $N = intval($input);
    list($prime, $diff) = nearestPrime($N);
    echo "Nearest prime: $prime, Difference: $diff\n";
}
?>
