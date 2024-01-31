namespace SeparationOfConcerns.Test;

public class PrimeFactorsTest
{
    [Fact]
    public void TestGetPrimeFactors()
    {
        // Arrange
        int number = 30;
        List<int> expectedFactors = new List<int> { 2, 3, 5 };

        // Act
        List<int> factors = PrimeFactors.GetPrimeFactors(number);

        // Assert
        Assert.Equal(expectedFactors, factors);
    }
}