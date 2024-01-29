namespace Average.Test;

public class FileAccessTest
{
    private readonly string TestDataPath = Path.GetTempPath();

    [Fact]
    public void TestReadEmptyFile()
    {
        // Arrange
        string emptyFilePath = TestDataPath + "emptyFile.txt";
        File.Create(emptyFilePath).Close(); // create an emtpy file

        // Act
        List<int> result = FileAccess.ReadNumbers(emptyFilePath);

        // Assert
        Assert.Empty(result); // Expects the results list to be empty

        try
        {
            File.Delete(emptyFilePath);
        }
        catch (Exception ex)
        {
            throw new Exception("An error occurred while deleting the file.", ex);
        }
    }

    [Fact]
    public void TestReadNumbersFromFile()
    {
        // Arrange
        string filePath = TestDataPath + "readNumbersFromFileText.txt";

        // Create or overwrite the text file
        using (StreamWriter writer = new(filePath))
        {
            // Insert numbers 1 through 5 into the file
            for (int i = 1; i < 6; i++)
            {
                writer.WriteLine(i);
            }
        }

        // Act
        List<int> result = FileAccess.ReadNumbers(filePath);

        // Assert
        Assert.Equal(new List<int> { 1, 2, 3, 4, 5 }, result);

        try
        {
            File.Delete(filePath);
        }
        catch (Exception ex)
        {
            throw new Exception("An error occurred while deleting the file.", ex);
        }
    }

    [Fact]
    public void TestReadNonExistentFile()
    {
        // Act & Assert
        Assert.Throws<FileNotFoundException>(() => FileAccess.ReadNumbers("non_existent_file.txt"));
    }
}
