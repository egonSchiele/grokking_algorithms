using System;
using System.Collections.Generic;
using System.Linq;

namespace ConsoleApplication
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var statesNeeded = new HashSet<string> { "mt", "wa", "or", "id", "nv", "ut", "ca", "az" };
            var stations = new Dictionary<string, HashSet<string>>();
            stations.Add("kone", new HashSet<string> { "id", "nv", "ut" });
            stations.Add("ktwo", new HashSet<string> { "wa", "id", "mt" });
            stations.Add("kthree", new HashSet<string> { "or", "nv", "ca" });
            stations.Add("kfour", new HashSet<string> { "nv", "ut" });
            stations.Add("kfive", new HashSet<string> { "ca", "az" });
            var finalStations = new HashSet<string>();
            while (statesNeeded.Any())
            {
                string bestStation = null;
                var statesCovered = new HashSet<string>();
                foreach (var station in stations)
                {
                    var covered = new HashSet<string>(statesNeeded.Intersect(station.Value));
                    if (covered.Count > statesCovered.Count){
                        bestStation = station.Key;
                        statesCovered = covered;
                    }
                }
                statesNeeded.RemoveWhere(s => statesCovered.Contains(s));
                finalStations.Add(bestStation);
            }
            Console.WriteLine(string.Join(", ", finalStations));
        }
    }
}
