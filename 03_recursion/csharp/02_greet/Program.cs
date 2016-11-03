using System;

namespace ConsoleApplication
{
    public class Program
    {
        public static void Main(string[] args)
        {
            Greet("adit");
        }

        private static void Greet(string name)
        {
            Console.WriteLine($"hello, {name}!");
            Greet2(name);
            Console.WriteLine("getting ready to say bye...");
            Bye();
        }

        private static void Greet2(string name)
        {
            Console.WriteLine($"how are you, {name}?");
        }

        private static void Bye()
        {
            Console.WriteLine("ok bye!");
        }
    }
}
