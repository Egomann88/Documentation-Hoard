namespace Average.Test;

public class FileAccessTest
{
    [Fact]
    public void TestReadEmptyFile()
    {
        // Arrange
        string tempFilePath = Path.Combine(Path.GetTempPath(), "numbers.txt");
        StreamWriter writer = new(tempFilePath);
        writer.WriteLine("1");
        writer.WriteLine("2");
        writer.WriteLine("3");
        writer.Close();

        // Act
        FileAccess fileAccess = new(tempFilePath);
        IEnumerable<int> numbers = fileAccess.ReadNumbers();

        // Assert
        Assert.Equal(new List<int>() { 1, 2, 3 }, numbers);

        // Cleanup
        File.Delete(tempFilePath);
    }

    [Fact]
    public void TestEmptyPath()
    {
        // Arrange
        string tempFilePath = "";

        // Act
        FileAccess fileAccess = new(tempFilePath);

        // Assert
        Assert.Throws<ArgumentException>(fileAccess.ReadNumbers);
    }

    [Fact]
    public void TestNonExistentFile()
    {
        // Arrange
        string tempFilePath = Path.Combine(Path.GetTempPath(), "doesNotExist.txt");

        // Act
        FileAccess fileAccess = new(tempFilePath);

        // Assert
        Assert.Throws<FileNotFoundException>(fileAccess.ReadNumbers);
    }
}
