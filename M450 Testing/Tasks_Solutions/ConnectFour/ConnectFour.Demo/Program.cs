namespace ConnectFour.Demo;

public class Program
{
    public static void Main(string[] args)
    {
        var board = new Board();
        var finished = false;
        var player = Board.PLAYER_1;

        board.Output();

        while (!finished)
        {
            Console.Write($"Player {player}: ");
            var input = Console.ReadLine().Trim();
            var column = int.Parse(input);
            var row = board.MakeMove(player, column);
            board.Output();
            var winner = board.Winner(player, row, column);
            if (winner != Board.EMPTY)
            {
                Console.WriteLine($"Player {player}: A winner is you!");
                break;
            }
            player = (player == Board.PLAYER_1) ? Board.PLAYER_2 : Board.PLAYER_1;
        }
    }
}
