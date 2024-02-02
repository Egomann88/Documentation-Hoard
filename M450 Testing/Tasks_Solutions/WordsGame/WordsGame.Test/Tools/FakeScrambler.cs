using WordsGame.Interfaces;

namespace WordsGame.Test.Tools;

internal class FakeScrambler : IScrambler
{
    // simplify the scramble method -> reverse word
    public string Scramble(string word) => new(word.Reverse().ToArray());
}
