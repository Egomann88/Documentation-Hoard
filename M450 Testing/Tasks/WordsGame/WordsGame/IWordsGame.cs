namespace WordsGame;

public interface IWordsGame
{
    /// <summary>
    /// Starts a word game.
    /// </summary>
    /// <param name="word">the original word</param>
    /// <returns>a scrambled version of the original word</returns>
    public string Start(string word);

    /// <summary>
    /// Grades the solution of the word game.
    /// </summary>
    /// <param name="solution">the submitted solution</param>
    /// <returns>the number of points awarded</returns>
    public int Grade(string solution);
}