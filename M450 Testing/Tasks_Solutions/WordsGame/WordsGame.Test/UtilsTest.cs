namespace WordsGame.Test;

public class UtilsTest
{
    [Theory]
    [InlineData("WORD", 8)]
    [InlineData("QUIZ", 22)]
    [InlineData("JAZZ", 29)]
    [InlineData("", 0)]
    public void TestCalculateScrabbleScoreShouldCalculateCorrectly(string word, int expectedScore)
    {
        int score = Utils.CalculateScrabbleScore(word);
        Assert.Equal(expectedScore, score);
    }

    [Fact]
    public void TestCalculateScrabbleScoreShouldBeCaseInsensitive()
    {
        int scoreLower = Utils.CalculateScrabbleScore("word");
        int scoreUpper = Utils.CalculateScrabbleScore("WORD");
        Assert.Equal(scoreLower, scoreUpper);
    }
}