using System;

namespace ConsoleApplication
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var result = LevenshteinDistance("gibraltar", "labrador");
            Console.WriteLine(result); // 5
        }

        public static int LevenshteinDistance(string source, string target)
        {
            var matrix = CreateMatrix(source, target);

            for (int i = 1; i <= source.Length; i++)
            {
                for (int j = 1; j <= target.Length; j++)
                {
                    matrix[i, j] = Math.Min(matrix[i, j - 1] + 1, Math.Min(
                        matrix[i - 1, j] + 1, matrix[i - 1, j - 1] + (source[i - 1] != target[j - 1] ? 1 : 0)));
                }
            }

            return matrix[source.Length, target.Length];
        }

        private static int[,] CreateMatrix(string source, string target)
        {
            var matrix = new int[source.Length + 1, target.Length + 1];

            if (source.Length < target.Length)
            {
                var tempSrc = source;
                source = target;
                target = tempSrc;
            }

            for (int i = 0; i <= source.Length; i++)
            {
                matrix[i, 0] = i;

                if (i <= target.Length)
                {
                    matrix[0, i] = i;
                }
            }

            return matrix;
        }
    }
}
