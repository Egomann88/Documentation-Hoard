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
        if (statistic.Equals("mean"))
        {
            double result = Average.Average.ComputeMeanOfFile(path);
            Console.WriteLine(result);
        }
        else if (statistic.Equals("median"))
        {
            double result = Average.Average.ComputeMedianOfFile(path);
            Console.WriteLine(result);
        }
        else if (statistic.Equals("mode"))
        {
            List<int> result = Average.Average.ComputeModeOfFile(path);
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
