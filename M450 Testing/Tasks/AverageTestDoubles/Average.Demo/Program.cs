using Average;

public class Program
{
    public static void Main(string[] args)
    {
        if (args.Length < 2)
        {
            Console.WriteLine(
                "usage: {0} [mean/median/mode] [file]",
                System.AppDomain.CurrentDomain.FriendlyName
            );
            System.Environment.Exit(1);
        }
        string statistic = args[0].ToLower();
        string path = args[1];
        Average.FileAccess fileAccess = new Average.FileAccess(path);
        Average.Average average = new Average.Average(fileAccess);
        if (statistic.Equals("mean"))
        {
            double result = average.ComputeMeanOfFile();
            Console.WriteLine(result);
        }
        else if (statistic.Equals("median"))
        {
            double result = average.ComputeMedianOfFile();
            Console.WriteLine(result);
        }
        else if (statistic.Equals("mode"))
        {
            List<int> result = average.ComputeModeOfFile();
            foreach (int value in result)
            {
                Console.WriteLine(value);
            }
        }
        else
        {
            Console.WriteLine("use mean, median, or mode as the first argument");
            System.Environment.Exit(2);
        }
    }
}
