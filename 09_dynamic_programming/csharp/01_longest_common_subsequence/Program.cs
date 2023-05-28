using System;

namespace ConsoleApplication
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var array = LongestCommom("hish", "fish");
            //print array
            PrintArrayLogestCommom(array);
            
            
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
            }
        }
    }
}
