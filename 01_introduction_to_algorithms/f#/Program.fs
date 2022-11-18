// Learn more about F# at http://fsharp.org

open System

[<EntryPoint>]
let main argv =
    let numbers = [|1; 2; 3; 4; 5; 6; 7; 8; 9; 10|]

    let rec binarySearch(arr: int[], number: int, startIndex: int, endIndex: int) : int
        = 
            let averageIndex = (startIndex + endIndex) / 2
            let middleElement = arr.[averageIndex]

            if (middleElement > number)
                then binarySearch(arr, number, startIndex, averageIndex)
            else if (middleElement < number)
                then binarySearch(arr, number, averageIndex, endIndex)
            else
                averageIndex

    let binarySearch(arr: int[], number: int)
        = binarySearch(arr, number, 0, arr.Length)

    let index = binarySearch(numbers, 7)
    Console.WriteLine(index);
    0
