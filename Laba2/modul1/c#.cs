class Program
{
    static bool IsPrime(int num)
    {
        if (num <= 1) return false;
        if (num == 2) return true;
        if (num % 2 == 0) return false;
        for (int i = 3; i <= Math.Sqrt(num); i += 2)
        {
            if (num % i == 0) return false;
        }
        return true;
    }

    static Tuple<int, int> NearestPrime(int N)
    {
        if (N <= 1) return Tuple.Create(2, N - 2);
        int lower = N - 1;
        while (lower >= 2 && !IsPrime(lower))
        {
            lower--;
        }
        int higher = N + 1;
        while (!IsPrime(higher))
        {
            higher++;
        }
        return (N - lower <= higher - N) 
            ? Tuple.Create(lower, N - lower) 
            : Tuple.Create(higher, N - higher);
    }

    static void Main()
    {
        Console.Write("Enter N: ");
        if (!int.TryParse(Console.ReadLine(), out int N) || N < 0)
        {
            Console.WriteLine("Please enter a non-negative integer");
            return;
        }
        var result = NearestPrime(N);
        Console.WriteLine($"Nearest prime: {result.Item1}, Difference: {result.Item2}");
    }
}
