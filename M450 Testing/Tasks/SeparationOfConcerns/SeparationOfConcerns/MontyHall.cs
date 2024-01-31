public class MontyHall
{
    public static void Play(int times)
    {
        if (times < 0)
        {
            throw new ArgumentException("negative numbers are not supported");
        }
        var wonSticking = 0;
        var wonChanging = 0;
        for (var i = 0; i < times; i++)
        {
            // first, prepare the game
            var doorsWithPrice = new Dictionary<int, bool> { { 1, false }, { 2, false }, { 3, false } };
            var winningDoor = (int)(new Random().NextInt64() % 3 + 1);
            doorsWithPrice[winningDoor] = true;

            // second, let the player make his guess
            var playerGuess = (int)(new Random().NextInt64() % 3 + 1);

            // third, reveal a losing door to be eliminated from the choices
            var choices = doorsWithPrice.Keys.ToHashSet();
            for (var j = 1; j <= 3; j++)
            {
                if (j != playerGuess && doorsWithPrice[j] == false)
                {
                    choices.Remove(j);
                    break;
                }
            }

            // fourth, count wins by 1) sticking to choice, and 2) changing choice
            var winsSticking = doorsWithPrice[playerGuess];
            choices.Remove(playerGuess);
            var otherDoor = choices.First();
            var winsChanging = doorsWithPrice[otherDoor];
            if (winsSticking)
            {
                wonSticking++;
            }
            if (winsChanging)
            {
                wonChanging++;
            }
        }

        // finally, print the statistics
        Console.WriteLine($"played {times} times");
        Console.WriteLine($"won {wonSticking} times by sticking to choice");
        Console.WriteLine($"won {wonChanging} times by changing the choice");
        Console.WriteLine($"sticking wins {wonSticking / (float)times * 100:0.00}% of games");
        Console.WriteLine($"changing wins {wonChanging / (float)times * 100:0.00}% of games");
    }
}