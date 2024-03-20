import Cocoa

/// # How to use the ternary conditional operator for quick tests
/// # Hızlı testler için üçlü koşullu operatör nasıl kullanılır?

/**
 This option is called the ternary conditional operator. To understand why it has that name, you first need to know that +, -, ==, and so on are all called binary operators because they work with two pieces of input: 2 + 5, for example, works with 2 and 5.
 Bu seçenek üçlü koşul operatörü olarak adlandırılır. Neden bu isme sahip olduğunu anlamak için öncelikle +, -, == ve benzerlerinin hepsinin ikili işleçler olarak adlandırıldığını bilmeniz gerekir çünkü iki girdi parçasıyla çalışırlar: örneğin 2 + 5, 2 ve 5 ile çalışır.

 Ternary operators work with three pieces of input, and in fact because the ternary conditional operator is the only ternary operator in Swift, you’ll often hear it called just “the ternary operator.”
 Üçlü işleçler üç girdi parçasıyla çalışır ve aslında üçlü koşullu işleç Swift'teki tek üçlü işleç olduğu için, genellikle sadece "üçlü işleç" olarak adlandırıldığını duyarsınız.

 The ternary operator lets us check a condition and return one of two values: something if the condition is true, and something if it’s false.
 Üçlü işleç, bir koşulu kontrol etmemizi ve iki değerden birini döndürmemizi sağlar: koşul doğruysa bir şey, yanlışsa bir şey.
 */

let age = 18
let canVote = age >= 18 ? "Yes" : "No" /// Burada arada eşittir olduğu için sonucu canVote'e atar.
print(canVote)
/// As you can see, the ternary operator is split into three parts: a check (age >= 18), something for when the condition is true (“Yes”), and something for when the condition is false (“No”). That makes it exactly like a regular if and else block, in the same order.
let age2 = 15
let canVote2 = age2 >= 18 ? "Yes" : "No"
print(canVote2)



let hour = 23
print(hour < 12 ? "It's before noon" : "It's after noon")
/// Bunun sonucu nasıl herhangi bir yere atamadığına dikkat edin - doğru ya da yanlış durumu sadece hour değerine bağlı olarak yazdırılır.



let names = ["Jayne", "Kaylee", "Mal"]
let crewCount = names.isEmpty ? "No one" : "\(names.count) people"
print(crewCount)



enum Theme {
    case light, dark
}

let theme = Theme.dark

let background = theme == .dark ? "black" : "white"
print(background)



/// Ternary operatörü bir şeyleri daha kısa yazmak istediğimizde if yerine kullanırız. Tek satırda iş bitirir çünkü.
if hour < 12 {
    print("It's before noon")
} else {
    print("It's after noon")
}

print(hour < 12 ? "It's before noon" : "It's after noon")
