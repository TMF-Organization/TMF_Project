// A Swift Tour
// https://docs.swift.org/swift-book/GuidedTour/GuidedTour.html

// Prints "Hello, World!"
// print("Hello, world!")

// Simple Values
var myVariable = 42  // 変数
myVariable = 50
let myConstant = 42  // 定数

// C/V must have the same type as the value you want to assign to it
let implicitInteger = 70
let implicitDouble = 70.0

// if the initial value doesn`t provide enough information,
// specify the type by writing it after the C/V by a colon(:).
let explicitDouble: Double = 70
let explicitFloat: Float = 4

// values are never implicitly converted to another type.
let label = "The width is "
let width = 94
let widthLabel = label + String(width)

// simplar way to include values in Strings
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."


// Strings that takeup multiple lines
// write  \"  if you want to use double quotation in Strings
let quotation = """
Even though there's whitespace to the left,
the actual lines aren't indented.
Except for this line.
Double quotes (\") can appear without being escaped.
I still have \(apples + oranges) pieces of fruit.
"""

print(quotation)
