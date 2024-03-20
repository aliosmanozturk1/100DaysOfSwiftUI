import Cocoa

/**
 Swift handles these with if statements, which let us check a condition and run some code if the condition is true. They look like this:
 Swift bir koşulu kontrol etmemizi ve koşul doğruysa bazı kodları çalıştırmamızı sağlayan if deyimleriyle ele alır. Şuna benzerler:
 */

let score = 85

if score > 80 {
    print("Great Job")
}

/**
 score > 80 is our condition.
 That > symbol is a comparison operator,
 */

// ************************************************************************************************
let speed = 88
let percentage = 85
let age = 18

if speed >= 88 {
    print("Where we're going we don't need roads.")
}

if percentage < 85 {
    print("Sorry, you failed the test.")
}

if age >= 18 {
    print("You're eligible to vote")
}

// ************************************************************************************************
// Alfabetik olarak karşılaştırıyor.
let ourName = "Dave Lister"
let friendName = "Arnold Rimmer"

if ourName < friendName {
    print("It's \(ourName) vs \(friendName)")
}

if ourName > friendName {
    print("It's \(friendName) vs \(ourName)")
}

// ************************************************************************************************
// Make an array of 3 numbers
var numbers = [1, 2, 3]

// Add a 4th
numbers.append(4)

// If we have over 3 items
if numbers.count > 3 {
    // Remove the oldest number
    numbers.remove(at: 0)
}

// Display the result
print(numbers)

// ************************************************************************************************
// == --> is equal to
let country = "Canada"

if country == "Australia" {
    print("G'day!")
}

// != --> is not equal to
let name = "Taylor Swift"

if name != "Anonymous" {
    print("Welcome, \(name)")
}

// ************************************************************************************************
// Kullanıcı tarafından girilen kullanıcı adının boş olup olmadığını kontrol etmek istiyoruz

// Create the username variable
var username = "taylorswift13"

// If `username` contains an empty string
if username == "" {
    // Make it equal to "Anonymous"
    username = "Anonymous"
}

// Now print a welcome message
print("Welcome, \(username)!")

// Bu kontrolü yapmanın başka yolları da var
// İlk olarak, string'in sayısını - kaç harf olduğunu - 0 ile karşılaştırabiliriz, bunun gibi:

if username.count == 0 {
    username = "Anonymous"
}

/**
 Comparing one string against another isn’t very fast in any language, so we’ve replaced the string comparison with an integer comparison: does the number of letters in the string equal 0?
 Bir dizeyi diğeriyle karşılaştırmak hiçbir dilde çok hızlı değildir, bu nedenle dize karşılaştırmasını bir tamsayı karşılaştırmasıyla değiştirdik: dizedeki harf sayısı 0'a eşit mi?

 Bu da pek mantıklı değildir, bir string'e sayımını sormanın Swift'in tüm harfleri tek tek saymasına neden olmasıdır
 
 As a result, Swift adds a second piece of functionality to all its strings, arrays, dictionaries, and sets: isEmpty. This will send back true if the thing you’re checking has nothing inside, and we can use it to fix our condition like this:
 Sonuç olarak, Swift tüm stringlerine, dizilerine, sözlüklerine ve setlerine ikinci bir işlevsellik ekler: isEmpty. Bu, kontrol ettiğiniz şeyin içinde hiçbir şey yoksa true değerini geri gönderir ve koşulumuzu şu şekilde düzeltmek için kullanabiliriz:
 */

if username.isEmpty == true {
    username = "Anonymous"
}

/**
 Bu daha iyi, ama bir adım daha ileri gidebiliriz. Gördüğünüz gibi, sonuçta önemli olan koşulunuzun doğru ya da yanlış olması gerektiğidir; Swift başka bir şeye izin vermez. Bizim durumumuzda, username.isEmpty zaten bir Boolean, yani doğru veya yanlış olacak, böylece kodumuzu daha da basitleştirebiliriz:
 */

if username.isEmpty {
    username = "Anonymous"
}

// If isEmpty is true the condition passes and username gets set to Anonymous, otherwise the condition fails.
// isEmpty doğruysa koşul geçer ve kullanıcı adı Anonymous olarak ayarlanır, aksi takdirde koşul başarısız olur.




