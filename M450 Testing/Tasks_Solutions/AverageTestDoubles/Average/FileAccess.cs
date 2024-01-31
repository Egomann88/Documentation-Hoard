namespace Average;

public class FileAccess : IFileAccess
{
    public FileAccess(string path)
    {
        this.path = path;
    }

    private readonly string path;

    public IEnumerable<int> ReadNumbers()
    {
        List<int> numbers = new();
        foreach (string line in File.ReadLines(path))
        {
            int value = int.Parse(line);
            numbers.Add(value);
        }
        return numbers;
    }
}
