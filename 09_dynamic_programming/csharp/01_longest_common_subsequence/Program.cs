using System;

namespace ConsoleApplication
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var result = LongestCommonSubsequence("fish", "vistafh");
            Console.WriteLine($"{result.Item1}: {result.Item2}"); // ish: 3
        }

        public static (string, int) LongestCommonSubsequence(string word1, string word2)
        {
            if (string.IsNullOrEmpty(word1) || string.IsNullOrEmpty(word2))
                return ("", 0);

            string subSeq;
            var matrix = new int[word1.Length + 1, word2.Length + 1];

            for (int i = 1; i <= word1.Length; i++)
            {
                for (int j = 1; j <= word2.Length; j++)
                {
                    if (word1[i - 1] == word2[j - 1])
                    {
                        matrix[i, j] = matrix[i - 1, j - 1] + 1;
                    }
                    else
                    {
                        matrix[i, j] = Math.Max(matrix[i, j - 1], matrix[i - 1, j]);
                    }
                }
            }

            subSeq = Read(matrix, word1, word2);

            return (subSeq, subSeq.Length);
        }

        private static string Read(int[,] matrix, string word1, string word2)
        {
            string subSeq = null;
            int x = word1.Length;
            int y = word2.Length;

            while (x > 0 && y > 0)
            {
                if (word1[x - 1] == word2[y - 1])
                {
                    subSeq += word1[x - 1];
                    x--;
                    y--;
                }
                else if (matrix[x - 1, y] > matrix[x, y - 1])
                {
                    x--;
                }
                else
                {
                    y--;
                }
            }

            var charArray = subSeq.ToCharArray();
            Array.Reverse(charArray);
            subSeq = new string(charArray);

            return subSeq;
        }
    }
}
