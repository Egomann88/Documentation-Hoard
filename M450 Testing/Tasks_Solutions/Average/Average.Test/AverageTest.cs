namespace Average.Test
{
    public class AverageTest
    {
        [Fact]
        public void TestComputeMeanOfFile()
        {
            // Arrange
            string tempFilePath = Path.Combine(Path.GetTempPath(), "numbers.txt");
            StreamWriter writer = new(tempFilePath);
            writer.WriteLine("1");
            writer.WriteLine("2");
            writer.WriteLine("3");
            writer.Close();

            // Act
            double actual = Average.ComputeMeanOfFile(tempFilePath);

            // Assert
            Assert.Equal(2, actual);
            File.Delete(tempFilePath);
        }

        [Fact]
        public void TestComputeMedianOfFile()
        {
            // Arrange
            string tempFilePath = Path.Combine(Path.GetTempPath(), "numbers.txt");
            StreamWriter writer = new(tempFilePath);
            writer.WriteLine("23");
            writer.WriteLine("29");
            writer.WriteLine("25");
            writer.WriteLine("-142");
            writer.Close();

            // Act
            double actual = Average.ComputeMedianOfFile(tempFilePath);

            // Assert
            Assert.Equal(24, actual);
            File.Delete(tempFilePath);
        }

        [Fact]
        public void TestComputeModeOfFile()
        {
            // Arrange
            string tempFilePath = Path.Combine(Path.GetTempPath(), "numbers.txt");
            StreamWriter writer = new(tempFilePath);
            writer.WriteLine("23");
            writer.WriteLine("29");
            writer.WriteLine("23");
            writer.Close();

            // Act
            List<int> actual = Average.ComputeModeOfFile(tempFilePath);

            // Assert
            Assert.Equal(new[] { 23 }, actual);
            File.Delete(tempFilePath);
        }
    }
}
