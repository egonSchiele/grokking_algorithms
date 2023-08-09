using System;

namespace ConsoleApplication
{

    public class Program
    {
        public static void Main(string[] args)
        {

            var array = LongestCommom("hish", "fish");
            //print array
            PrintArrayLogest(array);
        }
        public static int[,] LongestCommom(String wordA, String wordB)
        {
            int[,] cell = new int[wordA.Length, wordB.Length];

            for (int i = 0; i < wordA.Length; i++)
            {
                for (int j = 0; j < wordB.Length; j++)
                {
                    // The letters match
                    if (wordA[i] == wordB[j])
                    {
                        if (i > 0 && j > 0)
                        {
                            cell[i, j] = cell[i - 1, j - 1] + 1;
                        }
                        else
                        {
                            cell[i, j] = 1;
                        }
                    }
                    else
                    {
                        // The letters don't match.
                        if (i == 0 && j > 0)
                        {
                            cell[i, j] = cell[i, j - 1];
                        }
                        else if (i > 0 && j == 0)
                        {
                            cell[i, j] = cell[i - 1, j];
                        }
                        else if (i > 0 && j > 0)
                        {
                            cell[i, j] = Math.Max(cell[i - 1, j], cell[i, j - 1]);
                        }
                        else
                        {
                            cell[i, j] = 0;
                        }
                    }
                }
            }
            return cell;
        }

        public static void PrintArrayLogest(int[,] array)
        {
            for (int i = 0; i < array.GetLength(0); i++)
            {
                for (int j = 0; j < array.GetLength(1); j++)
                {
                    Console.Write("{0} ", array[i, j]);
                }
                Console.WriteLine();

                var result = LongestCommonSubsequence("fish", "vistafh");
                Console.WriteLine($"{result.Item1}: {result.Item2}"); // ish: 3
            }



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
