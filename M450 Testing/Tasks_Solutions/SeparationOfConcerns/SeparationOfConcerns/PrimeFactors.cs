public class PrimeFactors
{
    public static void Factor(List<int> numbers)
    {
        foreach (var number in numbers)
        {
            if (number < 1)
            {
                throw new ArgumentException("Negative numbers are not supported");
            }

            var factors = GetPrimeFactors(number);
            OutputResult(factors, number);
        }
    }

    public static List<int> GetPrimeFactors(int number)
    {
        var factors = new List<int>();

        for (int divisor = 2; divisor <= number; divisor++)
        {
            while (number % divisor == 0)
            {
                factors.Add(divisor);
                number /= divisor;
            }
        }

        return factors;
    }

    private static void OutputResult(List<int> factors, int number)
    {
        Console.Write($"{number}: ");
        Console.WriteLine(string.Join(" ", factors));
    }
}
