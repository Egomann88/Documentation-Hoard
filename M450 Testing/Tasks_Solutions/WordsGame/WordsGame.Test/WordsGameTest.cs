using WordsGame.Test.Tools;

namespace WordsGame.Test;

public class WordsGameTest
{
    [Fact]
    public void TestReversedScramble()
    {
        // Arrange
        string og = "abcdefghijkl"; // orginal

        // Act
        string scrambled = new WordsGame(new FakeScrambler()).Start(og);

        // Assert
        Assert.Equal("lkjihgfedcba", scrambled);
    }

    [Fact]
    public void TestGradeIsZeroForWrongSolution()
    {
        // Arrange
        string og = "Apfel"; // orginal
        WordsGame game = new(new FakeScrambler());
        game.Start(og);

        // Act
        int grade = game.Grade("Afpel");

        // Assert
        Assert.Equal(0, grade);
    }

    [Theory]
    [InlineData("halo", 4)]
    [InlineData("Lord", 4)]
    [InlineData("blau", 4)]
    [InlineData("Frickelbude", 11)]
    [InlineData("Kartoffel", 9)]
    public void TestGradeIsNumForCorrectSolution(string word, byte expectedPts)
    {
        // Arrange
        WordsGame game = new(new FakeScrambler());
        game.Start(word);

        // Act
        int grade = game.Grade(word);

        // Assert
        Assert.Equal(expectedPts, grade);
    }
}