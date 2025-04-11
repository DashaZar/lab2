function isPrime(num: number): boolean {
    if (num <= 1) return false;
    if (num === 2) return true;
    if (num % 2 === 0) return false;
    for (let i = 3; i <= Math.sqrt(num); i += 2) {
        if (num % i === 0) return false;
    }
    return true;
}

function nearestPrime(N: number): [number, number] {
    if (N <= 1) return [2, N - 2];
    let lower = N - 1;
    while (lower >= 2 && !isPrime(lower)) {
        lower--;
    }
    let higher = N + 1;
    while (!isPrime(higher)) {
        higher++;
    }
    return (N - lower <= higher - N) ? [lower, N - lower] : [higher, N - higher];
}

const input = prompt("Enter N: ");
const N = parseInt(input || "0");
if (isNaN(N) || N < 0) {
    console.log("Please enter a non-negative integer");
} else {
    const [prime, diff] = nearestPrime(N);
    console.log(`Nearest prime: ${prime}, Difference: ${diff}`);
}

