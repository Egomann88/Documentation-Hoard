public class PrimeFactors
{
    public static void Factor(List<int> numbers)
    {
        // first, compute prime numbers up to each number
        var primesUpToNumber = new Dictionary<int, List<int>>();
        foreach (var number in numbers)
        {
            if (number < 1)
            {
                throw new ArgumentException("negative numbers are not supported");
            }
            primesUpToNumber.Add(number, new List<int>());
            for (var candidate = 2; candidate <= number; candidate++)
            {
                var isPrime = true;
                for (var i = 2; i < candidate; i++)
                {
                    if (candidate % i == 0)
                    {
                        isPrime = false;
                        break;
                    }
                }
                if (isPrime)
                {
                    primesUpToNumber[number].Add(candidate);
                }
            }
        }

        // second, factorize number by its primes
        foreach (var number in primesUpToNumber.Keys)
        {
            var primes = primesUpToNumber[number];
            var factors = new List<int>() { };
            if (primes.Count == 0)
            {
                factors.Add(number);
            }
            else
            {
                var remainder = number;
                for (var i = 0; i < primes.Count && remainder > 0;)
                {
                    var prime = primes[i];
                    if (remainder % prime == 0)
                    {
                        remainder /= primes[i];
                        factors.Add(prime);
                    }
                    else
                    {
                        i++;
                    }
                }
            }
            Console.Write($"{number}: ");
            foreach (var factor in factors)
            {
                Console.Write($"{factor} ");
            }
            Console.WriteLine();
        }
    }
}
