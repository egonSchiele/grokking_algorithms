using System;
using System.Collections.Generic;
using System.Linq;

namespace ConsoleApplication
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var arr = new[] { 10, 5, 2, 3 };
            Console.WriteLine(string.Join(", ", QuickSort(arr)));
        }

        private static IEnumerable<int> QuickSort(IEnumerable<int> list)
        {
            if (list.Count() <= 1) return list;
            var pivot = list.First();
            var less = list.Skip(1).Where(i => i <= pivot);
            var greater = list.Skip(1).Where(i => i > pivot);
            return QuickSort(less).Union(new List<int> { pivot }).Union(QuickSort(greater));
        }
    }
}
