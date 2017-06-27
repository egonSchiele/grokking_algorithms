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
            
            var list = new LinkedList<int>(arr);
            Console.WriteLine(string.Join(", ", SelectionSort(list)));
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
        
        private static int[] SelectionSort(LinkedList<int> list)
        {
            var newArr = new int[list.Count];
            for (int i = 0; i < newArr.Length; i++)
            {
                LinkedListNode<int> smallestNode = FindSmallestNode(list);
                newArr[i] = smallestNode.Value;
                list.Remove(smallestNode);
            }
            return newArr;
        }

        private static LinkedListNode<int> FindSmallestNode(LinkedList<int> list)
        {
            LinkedListNode<int> smallestNode = list.First;
            for (LinkedListNode<int> node = list.First; node != null; node = node.Next)
            {
                if (node.Value < smallestNode.Value)
                {
                    smallestNode = node;
                }
            }
            return smallestNode;
        }
    }
}
