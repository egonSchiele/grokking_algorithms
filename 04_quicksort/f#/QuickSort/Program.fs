// Learn more about F# at http://fsharp.org

open System

[<EntryPoint>]
let main argv =
    let numbers = [|3; 9; 10; 1; 4; 2; 6; 5; 8; 7|]

    let rec quickSort(arr: int[]) =
        if arr.Length < 2
            then arr
        else
            let pivot = arr.[0]
            let arrExcpetPivot = arr |> Seq.skip(1) |> Seq.toArray
            let lessElements = quickSort arrExcpetPivot |> Seq.filter(fun n -> n <= pivot) |> Seq.toArray
            let greaterElements = quickSort arrExcpetPivot |> Seq.filter(fun n -> n > pivot) |> Seq.toArray
            
            Seq.append (Seq.append lessElements [|pivot|]) greaterElements |> Seq.toArray

    let sorted = quickSort(numbers)
    0
