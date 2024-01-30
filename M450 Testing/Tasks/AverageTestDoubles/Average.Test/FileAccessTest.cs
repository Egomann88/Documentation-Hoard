namespace Average.Test;

public class FileAccessTest
{
    [Fact]
    public void TestReadEmptyFile()
    {
        // Arrange
        string tempFilePath = Path.Combine(Path.GetTempPath(), "numbers.txt");
        StreamWriter writer = new System.IO.StreamWriter(tempFilePath);
        writer.WriteLine("1");
        writer.WriteLine("2");
        writer.WriteLine("3");
        writer.Close();

        // Act
        FileAccess fileAccess = new FileAccess(tempFilePath);
        List<int> numbers = fileAccess.ReadNumbers();

        // Assert
        Assert.Equal(new List<int>() { 1, 2, 3 }, numbers);

        // Cleanup
        File.Delete(tempFilePath);
    }
}
