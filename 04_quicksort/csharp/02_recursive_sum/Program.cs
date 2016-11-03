using System;
using System.Collections.Generic;
using System.Linq;

namespace ConsoleApplication
{
    public class Program
    {
        public static void Main(string[] args)
        {
            Console.WriteLine(Sum(new[] { 1, 2, 3, 4 }));
        }

        private static int Sum(IEnumerable<int> list)
        {
            if (!list.Any()) return 0;

            return list.Take(1).First() + Sum(list.Skip(1));
        }
    }
}
