import Cocoa

// Int --> Tam sayı tutan veri tipidir.
let score = 10
let speed = -10
let reallyBig1 = 100000000

// Sayıları daha okunur hale getirmek için _ kullanabiliriz.
// _ kullanmak sayının değerini etkilemez.
let reallyBig2 = 100_000_000
let reallyBig3 = 1_00__00___00____00

// Sayılarla aritmetik operatörleri kullanabiliriz.
let lowerScore = score - 2
let higherScore = score + 10
let doubledScore = score * 2
let squaredScore = score * score
let halvedScore = score / 2
print(score)

// Daha önceki bir değişkeninin değerini arttırmak
var counter = 10
counter = counter + 5

// Bunun yerine, söz konusu tamsayıya doğrudan bir sayı ekleyen += kısaltma operatörünü kullanabilirsiniz:
counter += 5
print(counter)

// Bunlara bileşik atama operatörleri denir.
counter += 5
print(counter)
counter -= 10
print(counter)
counter *= 2
print(counter)
counter /= 2
print(counter)

// Int metodları
// isMultiple(of:) --> bir tamsayının başka bir tamsayının katı olup olmadığını öğrenme
let number = 120
print(number.isMultiple(of: 3))

print(150.isMultiple(of: 3))
