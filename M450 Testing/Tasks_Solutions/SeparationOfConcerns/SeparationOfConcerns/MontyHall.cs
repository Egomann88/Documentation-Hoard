using SeparationOfConcerns.Interfaces;

public class MontyHall
{
    public static void Play(int times, IMontyHallPlayer player)
    {
        if (times < 0)
        {
            throw new ArgumentException("negative numbers are not supported");
        }
        var wonSticking = 0;
        var wonChanging = 0;
        for (var i = 0; i < times; i++)
        {
            var result = CalculateRound(wonSticking, wonChanging, player);
            wonSticking = result.Item1;
            wonChanging = result.Item2;
        }

        // finally, print the statistics
        OutPutResult(times, wonSticking, wonChanging);
    }

    public static (int, int) CalculateRound(int wonSticking, int wonChanging, IMontyHallPlayer player)
    {
        // first, prepare the game 
        var doorsWithPrice = SeedDoorWithPrices();

        // second, let the player make his guess
        var playerGuess = player.GuessDoor();

        // third, reveal a losing door to be eliminated from the choices
        var choices = RevealLosingDoor(doorsWithPrice, playerGuess);

        // fourth, count wins by 1) sticking to choice, and 2) changing choice
        var result = CheckForWinType(doorsWithPrice, playerGuess, choices);
        var winsSticking = result.Item1;
        var winsChanging = result.Item2;
        if (winsSticking)
        {
            wonSticking++;
        }
        if (winsChanging)
        {
            wonChanging++;
        }

        return (wonSticking, wonChanging);
    }

    public static Dictionary<int, bool> SeedDoorWithPrices()
    {
        var doorsWithPrice = new Dictionary<int, bool> { { 1, false }, { 2, false }, { 3, false } };
        var winningDoor = (int)(new Random().NextInt64() % 3 + 1);
        doorsWithPrice[winningDoor] = true;
        return doorsWithPrice;
    }

    private static HashSet<int> RevealLosingDoor(Dictionary<int, bool> doorsWithPrice, int playerGuess)
    {
        var choices = doorsWithPrice.Keys.ToHashSet();
        for (var j = 1; j <= 3; j++)
        {
            if (j != playerGuess && doorsWithPrice[j] == false)
            {
                choices.Remove(j);
                break;
            }
        }
        return choices;
    }

    private static (bool, bool) CheckForWinType(Dictionary<int, bool> doorsWithPrice, int playerGuess, HashSet<int> choices)
    {
        var winsSticking = doorsWithPrice[playerGuess];
        choices.Remove(playerGuess);
        var otherDoor = choices.First();
        var winsChanging = doorsWithPrice[otherDoor];
        return (winsSticking, winsChanging);
    }

    private static void OutPutResult(int times, int wonSticking, int wonChanging)
    {
        Console.WriteLine($"played {times} times");
        Console.WriteLine($"won {wonSticking} times by sticking to choice");
        Console.WriteLine($"won {wonChanging} times by changing the choice");
        Console.WriteLine($"sticking wins {wonSticking / (float)times * 100:0.00}% of games");
        Console.WriteLine($"changing wins {wonChanging / (float)times * 100:0.00}% of games");
    }
}