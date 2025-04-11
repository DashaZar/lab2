<?php
function sumDigitsDivisibleBy3($num) {
    $sum = 0;
    $num = abs($num);
    while ($num > 0) {
        $digit = $num % 10;
        if ($digit % 3 == 0 && $digit != 0) {
            $sum += $digit;
        }
        $num = (int)($num / 10);
    }
    return $sum;
}

$n = (int)fgets(STDIN);
$total = 0;
for ($i = 0; $i < $n; $i++) {
    $num = (int)fgets(STDIN);
    $total += sumDigitsDivisibleBy3($num);
}
echo $total . "\n";
?>
