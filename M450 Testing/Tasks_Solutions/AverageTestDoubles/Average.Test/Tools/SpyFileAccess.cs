namespace Average.Test.Tools;

internal class SpyFileAccess : IFileAccess
{
    private readonly FileAccess fileAccess;
    public SpyFileAccess(string path)
    {
        // call real FileAccess to spy on
        fileAccess = new FileAccess(path);
    }


    // private set is used to prevent changes from outside the class
    private int readNumbersCallCount;
    // write protection because list is reference type and should only be changed by its own methods
    private readonly List<int> readNumbersResults = new();


    // public get is used to allow access from outside
    public int ReadNumbersCallCount => readNumbersCallCount;
    public List<int> ReadNumbersResults => readNumbersResults;


    public IEnumerable<int> ReadNumbers()
    {
        readNumbersCallCount++;
        // call real Method and save certain values
        var result = fileAccess.ReadNumbers();
        readNumbersResults.AddRange(result);
        return result;
    }
}
