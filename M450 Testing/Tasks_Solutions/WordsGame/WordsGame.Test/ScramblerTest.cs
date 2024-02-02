namespace WordsGame.Test;

public class ScramblerTest
{
    [Fact]
    public void TestScrambleEmptyIsEmpty()
    {
        // Arrange
        string empty = "";

        // Act
        string scrambled = new Scrambler().Scramble(empty);

        // Assert
        Assert.Equal("", scrambled);
    }

    [Fact]
    public void TestScrambleSingleLetterIsSame()
    {
        // Arrange
        string og = ((char)new Random().Next('a', 'z')).ToString(); // orginal

        // Act
        string scrambled = new Scrambler().Scramble(og);

        // Assert
        Assert.Equal(og, scrambled);
    }

    [Fact]
    public void TestScramble2String()
    {
        // Arrange
        string og = "ab"; // orginal

        // Act
        string scrambled = new Scrambler().Scramble(og);

        // Assert
        Assert.Equal("ba", scrambled);
    }

    [Fact]
    public void TestScramble2StringOriginal()
    {
        // Arrange
        string og = "ab"; // orginal

        // Act
        string scrambled = new Scrambler().Scramble(og);
        string iptOrder = string.Concat(og.OrderBy(c => c)); // input order
        string resOrder = string.Concat(scrambled.OrderBy(c => c)); // result order

        // Assert
        Assert.Equal(iptOrder, resOrder);
    }

    [Fact]
    public void TestScramble3String()
    {
        // Arrange
        string og = "abc"; // orginal

        // Act
        string scrambled = new Scrambler().Scramble(og);

        // Assert
        Assert.Equal(og.Length, scrambled.Length);
        Assert.NotEqual("abc", scrambled);
    }

    [Fact]
    public void TestScramble3StringOriginal()
    {
        // Arrange
        string og = "abc"; // orginal

        // Act
        string scrambled = new Scrambler().Scramble(og);
        string iptOrder = string.Concat(og.OrderBy(c => c)); // input order
        string resOrder = string.Concat(scrambled.OrderBy(c => c)); // result order

        // Assert
        Assert.Equal(iptOrder, resOrder);
    }
}