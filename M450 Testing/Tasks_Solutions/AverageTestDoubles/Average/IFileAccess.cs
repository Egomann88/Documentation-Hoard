namespace Average
{
    public interface IFileAccess
    {
        // I'm using IEnumerable<int> instead of List<int> because it's more general and can accept arrays and lists
        IEnumerable<int> ReadNumbers();
    }
}
