using System;
using System.Collections.Generic;
using System.Linq;

namespace SelectionSort
{
	class Program
	{
		static void Main(string[] args)
		{
			var numbers = new int[] { 4, 5, 1, 3, 10, 9, 6, 8, 7, 2 };
			var sortedArr = SelectionSort(numbers);

			Console.WriteLine(string.Join(',', sortedArr));
		}

		private static int[] SelectionSort(int[] array) 
			=> SelectionSort(new LinkedList<int>(array)).ToArray();

		private static IEnumerable<int> SelectionSort(LinkedList<int> list)
		{
			var minList = new LinkedList<int>();
			var maxList = new LinkedList<int>();

			while (list.Count != 0)
			{
				var min = list.Min();
				list.Remove(min);
				minList.AddLast(min);

				var max = list.Max();
				list.Remove(max);
				maxList.AddFirst(max);
			}

			return minList.Union(maxList);
		}
	}
}
