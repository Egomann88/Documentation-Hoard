using Moq;
using SeparationOfConcerns.Interfaces;

namespace SeparationOfConcerns.Test;

public class MontyHallTest
{
    [Fact]
    public void CalculateRound_WithSingleGuess_ReturnsOnlyOneOrLessWins()
    {
        // Arrange
        var playerMock = new Mock<IMontyHallPlayer>();
        playerMock.Setup(p => p.GuessDoor()).Returns(1);

        // Act
        var result = MontyHall.CalculateRound(0, 0, playerMock.Object);
        var IsBiggerTwo = (result.Item1 + result.Item2) > 2;

        // Assert
        Assert.False(IsBiggerTwo);
    }
}