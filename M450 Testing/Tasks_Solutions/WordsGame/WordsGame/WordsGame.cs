using WordsGame.Interfaces;

namespace WordsGame;

public class WordsGame : IWordsGame
{
    public WordsGame(IScrambler scrambler) {
        Scrambler = scrambler;
    }

    private IScrambler Scrambler { get; }
    private string OgWord { get; set; }

    public string Start(string word)
    {
        OgWord = word;
        return Scrambler.Scramble(word);
    }

    public int Grade(string solution)
    {
        return solution == OgWord ? CorrectScore(solution) : 0;
    }
    protected virtual int CorrectScore(string solution)
    {
        return solution.Length;
    }
}
