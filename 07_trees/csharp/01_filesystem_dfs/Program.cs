using System;
using System.IO;
using System.Linq;

namespace ConsoleApplication
{
    public class Program
    {
        public static void Main(string[] args)
        {
            string dir = Path.Combine(Directory.GetCurrentDirectory(), "pics");
            
            PrintNames(dir);
        }

        private static void PrintNames(string dir)
        {
            var filesAndDirs = Directory.GetFileSystemEntries(dir).OrderBy(f => f, StringComparer.OrdinalIgnoreCase);

            // loop through every file and folder in the current folder
            foreach (var path in filesAndDirs)
            {
                if (File.Exists(path))
                { 
                    // if it is a file, print out the name
                    Console.WriteLine(Path.GetFileName(path));
                }
                else
                { 
                    // if it is a folder, call this function recursively on it
                    // to look for files and folders
                    PrintNames(path);
                }
            }
        }
    }
}