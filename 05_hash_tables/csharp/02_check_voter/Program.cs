using System;
using System.Collections.Generic;

namespace ConsoleApplication
{
    public class Program
    {
        private static Dictionary<string, bool> _voted = new Dictionary<string, bool>();
        public static void Main(string[] args)
        {
            CheckVoter("tom");
            CheckVoter("mike");
            CheckVoter("mike");
        }

        private static void CheckVoter(string name)
        {
            if (_voted.ContainsKey(name))
            {
                Console.WriteLine("kick them out!");
            }
            else
            {
                _voted.Add(name, true);
                Console.WriteLine("let them vote!");
            }
        }
    }
}
