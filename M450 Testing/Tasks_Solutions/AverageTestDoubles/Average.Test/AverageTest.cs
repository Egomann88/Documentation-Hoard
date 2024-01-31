using Average.Test.Tools;
using System;

namespace Average.Test;

public class AverageTest
{
    /// General Test cases for empty files
    public static IEnumerable<object[]> EmptyFileTestCases()
    {
        yield return new object[] { new Func<Average, double>(average => average.ComputeMeanOfFile()) };
        yield return new object[] { new Func<Average, double>(average => average.ComputeMedianOfFile()) };
        yield return new object[] { new Func<Average, List<int>>(average => average.ComputeModeOfFile()) };
    }

    [Theory]
    [MemberData(nameof(EmptyFileTestCases))]
    void TestCalculateWithEmptyFiles<T>(Func<Average, T> toTest)
    {
        // Arrange
        FakeFileAccess fakeFileAccess = new("/path/to/an/empty/file");

        fakeFileAccess.AddFakeEntry("/path/to/an/empty/file", new List<int> { });
        var average = new Average(fakeFileAccess);

        // Act
        var exception = Assert.Throws<ArgumentException>(() => toTest(average));

        // Assert
        Assert.Contains("empty", exception.Message);
    }

    /// Fake Test Double
    [Theory]
    [InlineData("/path/to/some/other/file", 3, 0)]
    [InlineData("C:/test-data/third-file.txt", 14.333, 0.001)]
    public void TestComputeMeanOfFile_Fake(string filePath, double expected, double tolerance)
    {
        // Arrange
        FakeFileAccess fakeFileAccess = new(filePath);

        // Add fake entries to the dictionary
        fakeFileAccess.AddFakeEntry("/path/to/an/empty/file", new List<int> { });
        fakeFileAccess.AddFakeEntry("/path/to/some/other/file", new List<int> { 1, 2, 3, 4, 5 });
        fakeFileAccess.AddFakeEntry("C:/test-data/third-file.txt", new List<int> { 7, 34, 2 });

        // call the real Average class but with the fake file access to read fake files
        var average = new Average(fakeFileAccess);

        // Act
        double result = average.ComputeMeanOfFile();

        // Assert
        Assert.Equal(expected, result, tolerance); // tolerance is needed because of floating point arithmetic
    }

    /// Stub Test Double

    // hard-coded stub
    [Fact]
    public void TestComputeMeanOfFile_hcStub()
    {
        // Arrange
        var stubFileAccess = new StubFileAccess();
        var average = new Average(stubFileAccess);

        /** this is also possible:
         * var average = new Average(new StubFileAccess());
         * why you should avoid this is explained below
         */

        // Act
        var result = average.ComputeMeanOfFile();

        // Assert
        Assert.Equal(2, result);

        /** one could also write:
         * Assert.Equal(3, average.ComputeMeanOfFile());
         * but you should avoid this, because it makes debugging harder
         * and the readability of the test is worse
         * readability is the most important thing in tests
         * never combine multiple lines or A-A-A in one line, unless it's a one-liner
         * is this a one-liner? no, it's not.
         * Assert.Equal(3, new Average(new StubFileAccess()).ComputeMeanOfFile());
         */
    }

    // configurable stub
    [Theory]
    [InlineData(new int[] { 1, 2, 3 }, 2)]
    [InlineData(new int[] { 4, 5, 1, 2, 3, 6 }, 3.5)]
    [InlineData(new int[] { 5, 5, 5 }, 5)]
    public void TestComputeMeanOfFile_cStub(IEnumerable<int> numbers, double expected)
    {
        // Arrange
        // this is better than the hard-coded stub, because you can configure the stub and can see the configuration directly
        var stubFileAccess = new ConfigurableStubFileAccess(numbers);
        var average = new Average(stubFileAccess);

        // Act
        var result = average.ComputeMeanOfFile();

        // Assert
        Assert.Equal(expected, result);
    }

    /// Mock Test Double
    [Fact]
    public void TestComputeMeanOfFile_Mock()
    {
        // Arrange
        MockFileAccess mockFileAccess = new();
        Average average = new(mockFileAccess);

        // Act
        var result = average.ComputeMeanOfFile();

        // Assert
        Assert.Equal(2, result);
        Assert.Equal(1, mockFileAccess.ReadNumbersCallCount);
    }

    /// Spy Test Double
    [Fact]
    public void TestComputeMeanOfFile_Spy()
    {
        // Arrange
        string tempFilePath = Path.Combine(Path.GetTempPath(), "numbers.txt");

        // Redundant code from FileAccessTest, but it's okay for this example
        StreamWriter writer = new(tempFilePath);
        writer.WriteLine("1");
        writer.WriteLine("2");
        writer.WriteLine("3");
        writer.Close();

        SpyFileAccess spyFileAccess = new(tempFilePath);
        Average average = new(spyFileAccess);

        // Act
        var result = average.ComputeMeanOfFile();

        // Assert
        Assert.Equal(2, result);
        Assert.Equal(1, spyFileAccess.ReadNumbersCallCount);
        Assert.NotEmpty(spyFileAccess.ReadNumbersResults);
    }
}
