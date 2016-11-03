using System;

namespace ConsoleApplication
{
    public class Program
    {
        public static void Main(string[] args)
        {
            Console.WriteLine(Fact(5));
        }

        private static int Fact(int x)
        {
            if (x <= 1) return 1;

            return x * Fact(x - 1);
        }
    }
}
