using System;
using System.Collections.Generic;
using System.Linq;

namespace GCD
{
    public class Program
    {
        static void Main(string[] args)
        {
            var lst = new List<int> { 32, 696, 40, 50 };
            var GCD = GetGCD(640, 1680);
            var GCDList = GetGCDList(lst);

            Console.WriteLine(GCD);
            Console.WriteLine(GCDList);
        }

        //Get great Comman Divisor
        public static int GetGCD(int firstNumber, int secondNumber)
            => secondNumber == default ? firstNumber : GetGCD(secondNumber, firstNumber % secondNumber);

        //Get great Comman Divisor of list
        public static int GetGCDList(IEnumerable<int> lst)
        {
            var result = lst.FirstOrDefault();

            if (lst.Count() > 2)
            {
                result = GetGCD(result, GetGCDList(lst.Skip(1)));
            }
            else
            {
                result = GetGCD(result, lst.Skip((1)).FirstOrDefault());
            }

            return result;
        }
    }
}