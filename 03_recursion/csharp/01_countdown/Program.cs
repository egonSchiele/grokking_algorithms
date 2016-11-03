using System;

namespace ConsoleApplication
{
    public class Program
    {
        public static void Main(string[] args)
        {
            Countdown(5);
        }

        private static void Countdown(int i)
        {
            Console.WriteLine(i);
            
            // base case
            if (i <= 0) return;

            // recursive case
            Countdown(i - 1);
        }
    }
}
