namespace SeparationOfConcerns;

public class MultiplicationTable
{
    public static void For(List<int> numbers)
    {
        var biggestResult = FindBiggestResult(numbers);
        var magnitude = CalculateMagnitude(biggestResult);
        OutPutTable(numbers, magnitude);
    }

    /// <summary>
    /// Find the biggest possible result to compute its magnitude
    /// </summary>
    /// <param name="numbers"></param>
    /// <returns></returns>
    /// <exception cref="ArgumentException"></exception>
    public static int FindBiggestResult(IEnumerable<int> numbers)
    {
        var biggest = int.MinValue;
        foreach (var number in numbers)
        {
            if (number < 0)
            {
                throw new ArgumentException("negative numbers are not supported");
            }
            if (number > biggest)
            {
                biggest = number;
            }
        }
        return biggest * biggest;
    }

    public static int CalculateMagnitude(int biggestResult)
    {
        var magnitude = 0;
        while (biggestResult > 0)
        {
            magnitude++;
            biggestResult /= 10;
        }
        magnitude++; // the magnitude (plus some space) will be used for the width
        return magnitude;
    }

    private static void OutPutTable(IEnumerable<int> numbers, int magnitude)
    {
        var titleRow = "";
        titleRow += "*".PadLeft(magnitude) + " ||";
        foreach (var col in numbers)
        {
            titleRow += $"{col}".PadLeft(magnitude) + " |";
        }
        Console.WriteLine(titleRow);
        for (var i = 0; i < titleRow.Length; i++)
        {
            Console.Write("=");
        }
        Console.WriteLine();
        foreach (var row in numbers)
        {
            Console.Write($"{row}".PadLeft(magnitude) + " ||");
            foreach (var col in numbers)
            {
                var product = row * col;
                Console.Write($"{product}".PadLeft(magnitude) + " |");
            }
            Console.WriteLine();
        }
    }
}
