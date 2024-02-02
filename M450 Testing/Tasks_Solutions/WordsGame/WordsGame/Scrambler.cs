using WordsGame.Interfaces;

namespace WordsGame;

public class Scrambler : IScrambler
{
    public string Scramble(string original)
    {
        return original.Length <= 1 ? original : ScrambleForceChange(original);
    }

    private static string ScrambleForceChange(string original)
    {
        string result = OrderRandomly(original);

        while (result == original)
        {
            result = OrderRandomly(original);
        }

        return result;
    }

    private static string OrderRandomly(string original) => new(original.ToCharArray().OrderBy(s => Guid.NewGuid()).ToArray());

    public static List<string> SlurpLines(string filePath)
    {
        List<string> words = new();
        foreach (string line in File.ReadLines(filePath))
        {
            words.Add(line.Trim());
        }
        return words;
    }

    public static string PickRandom(List<string> entries)
    {
        var i = new Random().NextInt64() % entries.Count;
        return entries[(int)i];
    }
}