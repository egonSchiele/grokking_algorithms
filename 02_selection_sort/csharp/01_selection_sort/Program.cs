using System;
using System.Collections.Generic;

namespace ConsoleApplication
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var arr = new List<int> { 5, 3, 6, 2, 10 };
            Console.WriteLine(string.Join(", ", SelectionSort(arr)));
        }

        private static int[] SelectionSort(List<int> arr)
        {
            var newArr = new int[arr.Count];
            for (int i = 0; i < newArr.Length; i++)
            {
                var smallest = FindSmallest(arr);
                newArr[i] = arr[smallest];
                arr.RemoveAt(smallest);
            }
            return newArr;
        }

        private static int FindSmallest(List<int> arr)
        {
            var smallest = arr[0];
            var smallest_index = 0;
            for (int i = 0; i < arr.Count; i++)
            {
                if (arr[i] < smallest)
                {
                    smallest = arr[i];
                    smallest_index = i;
                }
            }
            return smallest_index;
        }
    }
}
