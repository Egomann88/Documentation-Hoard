namespace Average;

public class FileAccess
{
    public static List<int> ReadNumbers(string path)
    {
        List<int> numbers = new List<int>();
        foreach (string line in File.ReadLines(path))
        {
            int value = int.Parse(line);
            numbers.Add(value);
        }
        return numbers;
    }
}
