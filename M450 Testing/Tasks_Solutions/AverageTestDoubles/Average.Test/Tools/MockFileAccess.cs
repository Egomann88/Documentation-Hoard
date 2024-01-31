namespace Average.Test.Tools;

internal class MockFileAccess : IFileAccess
{
    // private set is used to prevent changes from outside the class
    private int readNumbersCallCount;

    // public get is used to allow access from outside
    public int ReadNumbersCallCount => readNumbersCallCount;

    public IEnumerable<int> ReadNumbers()
    {
        readNumbersCallCount++; // increment call count
        return new int[] { 1, 2, 3 };
    }
}
