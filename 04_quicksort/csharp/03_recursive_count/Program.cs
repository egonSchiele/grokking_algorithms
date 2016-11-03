using System;
using System.Collections.Generic;
using System.Linq;

namespace ConsoleApplication
{
    public class Program
    {
        public static void Main(string[] args)
        {
            Console.WriteLine(Count(new[] { 1, 2, 3, 4 }));
        }

        private static int Count(IEnumerable<int> list)
        {
            if(!list.Any()) return 0;

            return 1 + Count(list.Skip(1));
        }
    }
}
