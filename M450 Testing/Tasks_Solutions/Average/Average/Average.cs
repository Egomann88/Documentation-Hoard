namespace Average;

public class Average
{
    public static double ComputeMeanOfFile(string path)
    {
        List<int> numbers = FileAccess.ReadNumbers(path);
        return Statistics.Mean(numbers);
    }

    public static double ComputeMedianOfFile(string path)
    {
        List<int> numbers = FileAccess.ReadNumbers(path);
        return Statistics.Median(numbers);
    }

    public static List<int> ComputeModeOfFile(string path)
    {
        List<int> numbers = FileAccess.ReadNumbers(path);
        return Statistics.Mode(numbers);
    }
}
