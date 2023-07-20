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
            var smallestIndex = 0;
            for (int i = 0; i < arr.Count; i++)
            {
                if (arr[i] < smallest)
                {
                    smallest = arr[i];
                    smallestIndex = i;
                }
            }
            return smallestIndex;
        }
        
        public static int[] SelectionSort(int[] unorderedArray)
        {
            for (var i = 0; i < unorderedArray.Length; i++)
            {
                var smallestIndex = i;

                for (var remainingIndex = i + 1; remainingIndex < unorderedArray.Length; remainingIndex++)
                {
                    if (unorderedArray[remainingIndex] < unorderedArray[smallestIndex])
                    {
                        smallestIndex = remainingIndex;
                    }
                }
                (unorderedArray[i], unorderedArray[smallestIndex]) = (unorderedArray[smallestIndex], unorderedArray[i]);
            }

            return unorderedArray;
        }
    }
}