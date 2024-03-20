import Cocoa

// Boolean --> True veya False tutan veri tipidir.

let goodDogs = true
let isFull = false

let isMultiple = 120.isMultiple(of: 3)

// ! işareti ile boolean'ın değerini terse çevirebiliriz.
var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)
isAuthenticated = !isAuthenticated
print(isAuthenticated)

// Boolean metodları
var gameOver = false
print(gameOver)

gameOver.toggle()
print(gameOver)
