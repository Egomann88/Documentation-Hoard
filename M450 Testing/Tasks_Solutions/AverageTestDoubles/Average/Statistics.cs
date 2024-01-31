namespace Average;

public class Statistics
{
    public static double Mean(List<int> numbers)
    {
        if (numbers.Count == 0)
        {
            throw new ArgumentException("cannot compute mean of empty list");
        }
        double sum = 0.0;
        foreach (int value in numbers)
        {
            sum += value;
        }
        return sum / numbers.Count;
    }

    public static double Median(List<int> numbers)
    {
        int n = numbers.Count;
        numbers.Sort();
        if (n == 0)
        {
            throw new ArgumentException("cannot compute median of empty list");
        }
        else if (n % 2 == 0)
        {
            return (numbers[n / 2 - 1] + numbers[n / 2]) / 2.0;
        }
        else
        {
            return numbers[n / 2];
        }
    }

    public static List<int> Mode(List<int> numbers)
    {
        if (numbers.Count == 0)
        {
            throw new ArgumentException("cannot compute mean of empty list");
        }
        List<int> modes = new List<int>();
        Dictionary<int, int> frequencies = new Dictionary<int, int>();
        foreach (int value in numbers)
        {
            if (frequencies.ContainsKey(value))
            {
                frequencies[value]++;
            }
            else
            {
                frequencies[value] = 0;
            }
        }
        int maxN = -1;
        foreach (int frequency in frequencies.Values)
        {
            if (frequency > maxN)
            {
                maxN = frequency;
            }
        }
        foreach (int key in frequencies.Keys)
        {
            if (frequencies[key] == maxN)
            {
                modes.Add(key);
            }
        }
        return modes;
    }
}
