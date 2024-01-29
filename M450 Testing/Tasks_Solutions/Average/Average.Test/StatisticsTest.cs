namespace Average.Test
{
    public class StatisticsTest
    {
        /// <summary>
        /// Generiert Testfälle für statistische Funktionen mit leeren Listen als Eingabe.
        /// </summary>
        /// <returns>Sammlung von Funktionsdelegaten</returns>
        public static IEnumerable<object[]> EmptyListTestCases()
        {
            yield return new object[] { new Func<List<int>, double>(Statistics.Mean) };
            yield return new object[] { new Func<List<int>, double>(Statistics.Median) };
            yield return new object[] { new Func<List<int>, List<int>>(Statistics.Mode) };
        }

        [Theory]
        [MemberData(nameof(EmptyListTestCases))]
        /// <summary>
        /// Testet die statistischen Funktionen mit leeren Listen als Eingabe.
        /// </summary>
        /// <typeparam name="T">Der Rückgabetyp der zu testenden Funktion.</typeparam>
        /// <param name="toTest">Der Delegat der zu testenden Funktion.</param>
        void TestCalculateWithEmptyLists<T>(Func<List<int>, T> toTest)
        {
            // Arrange
            List<int> emptyList = new();

            // Act
            var exception = Assert.Throws<ArgumentException>(() => toTest(emptyList));
            
            // Assert
            Assert.Contains("empty list", exception.Message);
        }

        [Theory]
        [InlineData(new[] { 1 }, 1)]
        [InlineData(new[] { 23, 25, 23, 1354, 1, -142 }, 214)]
        void TestCalculateMean(int[] values, double expected)
        {
            // Arrange & Act
            double actual = Statistics.Mean(new List<int>(values));

            // Assert
            Assert.Equal(expected, actual);
        }

        [Theory]
        [InlineData(new[] { 1 }, 1)]
        [InlineData(new[] { 23, 25, 29, 1354, 1, -142 }, 24)]
        [InlineData(new[] { 23, 25, 23, 1354, 1 }, 23)]
        void TestCalculateMedian(int[] values, double expected)
        {
            // Arrange & Act
            double actual = Statistics.Median(new List<int>(values));

            // Assert
            Assert.Equal(expected, actual);
        }

        [Theory]
        [InlineData(new[] { 1 }, new[] { 1 })]
        [InlineData(new[] { 1, 2, 3, 4 }, new[] { 1, 2, 3, 4 })]
        [InlineData(new[] { 23, 25, 23, 1354, 1, -142 }, new[] { 23 })]
        [InlineData(new[] { 23, 25, 23, 1354, 1, -142, -142 }, new[] { -142, 23 })]
        void TestCalculateMode(int[] values, int[] expected)
        {
            // Arrange & Act
            List<int> actual = Statistics.Mode(new List<int>(values));

            // Assert
            Assert.Equal(expected, actual);
        }
    }
}
