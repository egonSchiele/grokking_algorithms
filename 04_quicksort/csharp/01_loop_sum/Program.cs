using System;
using System.Collections.Generic;

namespace ConsoleApplication
{
    public class Program
    {
        public static void Main(string[] args)
        {
            Console.WriteLine(Sum(new[] { 1, 2, 3, 4 }));
        }

        private static int Sum(IEnumerable<int> arr)
        {
            var total = 0;
            foreach (var x in arr)
            {
                total += x;
            }
            return total;
        }
    }
}
