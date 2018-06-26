import Foundation

var book = [String: Double]()
// an apple costs 67 cents
book["apple"] = 0.67
//# milk costs $1.49
book["milk"] = 1.49
book["avacado"] = 1.49
print(book) // => ["avacado": 1.49, "apple": 0.67000000000000004, "milk": 1.49]

// Qustion: Why is "apple" is 0.67000000000000004 instead of 0.67?
// Answer: Double cannot store the value 0.67 exactly. Swift uses (like many other languages) binary floating point numbers according to the IEEE 754 standard.
// This topic is not related to Algorithms, but you can play with .description and .debugDescription for making workarounds 
print(book["apple"]?.description ?? "Not exist") // => 0.67
print(book["apple"]?.debugDescription ?? "Not exist") // => 0.67000000000000004



