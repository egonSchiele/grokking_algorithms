//
//  main.swift
//  01_binary_search
//
//  Created by Anthony Marchenko on 3/13/17.
//  Copyright © 2017 Anthony Marchenko. All rights reserved.
//

import Foundation

func binarySearch <T: Comparable>(_ list: [T], item: T) -> Int? {
    // low and high keep track of which part of the list you'll search in.
    var low = 0
    var high = list.count - 1
    // While you haven't narrowed it down to one element ...
    while low <= high {
        //... check the middle element
        let mid = low + (high - low) / 2
        let guess = list[mid]
        // Found the item.
        if guess == item {
            return mid
        }
        // The guess was too high.
        if guess > item {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    
    return nil
    //'nil' means empty value in Swift. We use it to indicate that the item wasn't found.
}

let myList = [1, 3, 5, 7, 9]
print(binarySearch(myList, item: 3) ?? "Not Found") // => 1
print(binarySearch(myList, item: -1) ?? "Not Found") // => Not Found

