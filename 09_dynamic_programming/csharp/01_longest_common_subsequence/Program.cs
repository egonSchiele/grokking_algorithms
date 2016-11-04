using System;

namespace ConsoleApplication
{
    public class Program
    {
        public static void Main(string[] args)
        {

            if (word_a[i] == word_b[1])
            {
                cell[i][j] = cell[i - 1][j - 1] + 1;
            }
            else
            {
                cell[i][j] = Math.Max(cell[i - 1][j], cell[i][j - 1]);
            }
        }
    }
}
