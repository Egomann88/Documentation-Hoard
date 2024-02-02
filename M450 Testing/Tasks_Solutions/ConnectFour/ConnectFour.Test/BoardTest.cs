namespace ConnectFour.Test;

public class BoardTest
{
    [Theory]
    [InlineData(7)]
    [InlineData(-1)]
    public void TestInvalidMove(int columnMove)
    {
        // Arrange
        int invalidColumnMove = columnMove;
        Board board = new();
        
        // Act
        int result = board.MakeMove('x', invalidColumnMove);

        // Assert
        Assert.Equal(-1, result);
    }

    [Theory]
    [InlineData(0, 0)] // invalid row
    [InlineData(6, 0)] // invalid row
    [InlineData(0, -1)] // invalid column
    [InlineData(0, 7)] // invalid column
    [InlineData(6, -1)] // invalid row and column
    [InlineData(6, 7)] // invalid row and column
    public void TestInvalidWinnerRow(short row, short column)
    {
        // Arrange
        Board board = new();

        // Act
        char result = board.Winner('x', row, column); // returns empty

        // Assert
        Assert.Equal(Board.EMPTY, result);
    }

    [Fact]
    public void TestTwoOverlappingDiagonalsEachNotFourWinner()
    {
        // Arrange
        Board board = new();

        // Act
        board.MakeMove('x', 2);
        board.MakeMove('o', 3);
        board.MakeMove('x', 4);
        board.MakeMove('o', 2);
        board.MakeMove('x', 3);
        board.MakeMove('o', 4);
        board.MakeMove('x', 2);
        char result = board.Winner('x', 3, 2);

        // Assert
        Assert.Equal(Board.EMPTY, result);
    }
}