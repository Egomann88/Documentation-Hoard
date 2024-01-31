namespace Average.Test.Tools;

internal class FakeFileAccess : IFileAccess
{
    // Path to the file
    private readonly string path;
    // Dictionary fakes file system, by storing the path and the value
    // Path as Key, List of Numbers as Value
    private readonly Dictionary<string, IEnumerable<int>> pseudoDictionary = new();

    public FakeFileAccess(string path)
    {
        this.path = path;
    }

    // Add a fake entry to the dictionary, so that the ReadNumbers method can return the value
    public void AddFakeEntry(string path, IEnumerable<int> value)
    {
        pseudoDictionary.Add(path, value);
    }

    public IEnumerable<int> ReadNumbers()
    {
        // search for the path (fake file search) and return the value
        if (pseudoDictionary.TryGetValue(path, out IEnumerable<int>? value))
        {
            return value;
        }

        // If the path is not in the dictionary, throw an exception
        // https://learn.microsoft.com/en-us/dotnet/api/system.io.file.readlines?view=net-8.0
        throw new FileNotFoundException();
    }
}
