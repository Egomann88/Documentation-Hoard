public class Program
{
    public static void Main(string[] args)
    {
        if (args.Length < 2)
        {
            Console.WriteLine(
                "usage: {0} [mean/median/mode] [file]",
                AppDomain.CurrentDomain.FriendlyName
            );
            Environment.Exit(1);
        }
        string statistic = args[0].ToLower();
        string path = args[1];
        Average.FileAccess fileAccess = new(path);
        Average.Average average = new(fileAccess);
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
            Environment.Exit(2);
        }
    }
}
