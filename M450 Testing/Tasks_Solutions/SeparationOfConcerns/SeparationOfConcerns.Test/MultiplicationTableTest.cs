namespace SeparationOfConcerns.Test;

public class MultiplicationTableTest
{
    [Fact]
    public void TestFindBiggestResult()
    {
        //arrange
        var numbers = new List<int>() { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };

        //act
        var result = MultiplicationTable.FindBiggestResult(numbers);

        //assert
        Assert.Equal(100, result);
    }
}