namespace Average;

public class Average
{
    public Average(IFileAccess fileAccess)
    {
        this.fileAccess = fileAccess;
    }

    private readonly IFileAccess fileAccess;

    public double ComputeMeanOfFile()
    {
        List<int> numbers = fileAccess.ReadNumbers().ToList(); // IEnumerable<int> is converted to List<int> to use Count
        return Statistics.Mean(numbers);
    }

    public double ComputeMedianOfFile()
    {
        List<int> numbers = fileAccess.ReadNumbers().ToList(); // IEnumerable<int> is converted to List<int> to use Count
        return Statistics.Median(numbers);
    }

    public List<int> ComputeModeOfFile()
    {
        List<int> numbers = fileAccess.ReadNumbers().ToList(); // IEnumerable<int> is converted to List<int> to use Count
        return Statistics.Mode(numbers);
    }
}
