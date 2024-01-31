using SeparationOfConcerns.Interfaces;

namespace SeparationOfConcerns.Classes
{
    public class MontyHallRandom : IMontyHallPlayer
    {
        public int GuessDoor()
        {
            return GenerateRandomGuess();
        }

        private static int GenerateRandomGuess()
        {
            return new Random().Next(1, 4);
        }
    }
}
