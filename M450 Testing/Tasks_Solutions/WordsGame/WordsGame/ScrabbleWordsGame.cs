using WordsGame.Interfaces;

namespace WordsGame;

public class ScrabbleWordsGame : WordsGame
{
    public ScrabbleWordsGame(IScrambler scrambler) : base(scrambler)
    {
    }

    protected override int CorrectScore(string solution)
    {
        return Utils.CalculateScrabbleScore(solution);
    }
}