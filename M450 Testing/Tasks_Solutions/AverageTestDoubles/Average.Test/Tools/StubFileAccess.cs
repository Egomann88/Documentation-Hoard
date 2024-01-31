namespace Average.Test.Tools
{
    // hard-coded stub
    internal class StubFileAccess : IFileAccess
    {
        public IEnumerable<int> ReadNumbers()
        {
            return new int[] { 1, 2, 3 };
        }
    }

    // configurable stub
    internal class ConfigurableStubFileAccess : IFileAccess
    {
        public ConfigurableStubFileAccess(IEnumerable<int> numbers)
        {
            this.numbers = numbers;
        }

        // you could use getter and setter instead, but this is more concise for other developers who don't know much about C#
        private readonly IEnumerable<int> numbers;

        public IEnumerable<int> ReadNumbers()
        {
            return numbers;
        }
    }
}
