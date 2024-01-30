namespace Average;

public class FileAccess
{
    public FileAccess(string path)
    {
        this.path = path;
    }

    private readonly string path;

    public List<int> ReadNumbers()
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
