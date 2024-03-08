import Cocoa

/// # Checkpoint 5

/**
    You’ve already met sorted(), filter(), map(), so I’d like you to put them together in a chain – call one, then the other, then the other back to back without using temporary variables.
    sorted(), filter(), map() ile zaten tanıştınız, bu yüzden bunları bir zincir halinde bir araya getirmenizi istiyorum - birini, sonra diğerini, sonra diğerini geçici değişkenler kullanmadan arka arkaya çağırın.
 
    Your input is this:
    let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

    Your job is to:
    - Filter out any numbers that are even
    - Çift olan tüm sayıları filtreleyin

    - Sort the array in ascending order
    - Diziyi artan sırada sıralayın
 
    - Map them to strings in the format “7 is a lucky number”
    - Bunları "7 şanslı bir sayıdır" biçiminde dizelerle eşleyin
 
    - Print the resulting array, one item per line
    - Ortaya çıkan diziyi, her satırda bir öğe olacak şekilde yazdırın
 
    So, your output should be as follows:
    Yani, çıktınız aşağıdaki gibi olmalıdır:

    7 is a lucky number
    15 is a lucky number
    21 is a lucky number
    31 is a lucky number
    33 is a lucky number
    49 is a lucky number
*/

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

// ÇÖZÜM 1
let _ = luckyNumbers
    .filter { !$0.isMultiple(of: 2) }   // filter out even numbers
    .sorted()                           // sort the odd numbers
    .map { print("\($0) is a lucky number.") } // map to strings

// ÇÖZÜM 2
let isOdd = { $0 % 2 != 0 }

for number in luckyNumbers.sorted() where isOdd(number) {
  print("\(number) is a lucky number")
}

// ÇÖZÜM 3
let oddStrings = luckyNumbers.filter({ $0 % 2 != 0 }).sorted().map({ "\($0) is a lucky number" })
for str in oddStrings {
    print(str)
}

// ÇÖZÜM 4
luckyNumbers.filter { $0 % 2 != 0 ? true : false }.sorted().map { "\($0) is a lucky number." }.forEach { print($0) }

// ÇÖZÜM 5
let solution = { (numbers:[Int]) in
    numbers.sorted()
    .filter {!$0.isMultiple(of:2)}
    .map {print("\($0) is a lucky number.")}
}
solution(luckyNumbers)
