using Moq;
using WordsGame.Interfaces;

namespace WordsGame.Test;

public class ScrabbleWordsGameTest
{
    private readonly Mock<IScrambler> mockScrambler;
    private readonly ScrabbleWordsGame game;

    public ScrabbleWordsGameTest()
    {
        mockScrambler = new Mock<IScrambler>();
        game = new ScrabbleWordsGame(mockScrambler.Object);
    }

    [Fact]
    public void TestStartShouldScrambleWord()
    {
        const string originalWord = "TEST";
        const string scrambledWord = "TSTE";
        mockScrambler.Setup(s => s.Scramble(originalWord)).Returns(scrambledWord);

        var result = game.Start(originalWord);

        Assert.Equal(scrambledWord, result);
    }

    [Theory]
    [InlineData("WORD", "WORD", 8)]
    [InlineData("WORD", "WRONG", 0)]
    public void TestGradeShouldCalculateScoreCorrectly(string originalWord, string solution, int expectedScore)
    {
        game.Start(originalWord);
        int score = game.Grade(solution);

        Assert.Equal(expectedScore, score);
    }
}