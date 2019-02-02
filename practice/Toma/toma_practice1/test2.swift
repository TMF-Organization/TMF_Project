var numbers = [20, 19, 7, 12]

let sortedNumbers = numbers.sorted{value1, value2 in
   return value2 < value1
}
print(sortedNumbers)
print(numbers)
