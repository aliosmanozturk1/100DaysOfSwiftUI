import Cocoa

/// # Checkpoint 9

/**
    Your challenge is this: write a function that accepts an optional array of integers, and returns one randomly. If the array is missing or empty, return a random number in the range 1 through 100.
    Göreviniz şu: Opsiyonel bir tamsayı dizisini kabul eden ve rastgele bir tane döndüren bir fonksiyon yazın. Dizi eksik veya boşsa, 1 ile 100 aralığında rastgele bir sayı döndürün.

    If that sounds easy, it’s because I haven’t explained the catch yet: I want you to write your function in a single line of code. No, that doesn’t mean you should just write lots of code then remove all the line breaks – you should be able to write this whole thing in one line of code.
    Kulağa kolay geliyorsa, bunun nedeni henüz yakalamayı açıklamamış olmamdır: Fonksiyonunuzu tek bir kod satırında yazmanızı istiyorum. Hayır, bu sadece bir sürü kod yazıp sonra tüm satır sonlarını kaldırmanız gerektiği anlamına gelmiyor - tüm bu şeyi tek bir kod satırında yazabilmelisiniz.

    I’ll provide some hints in a moment, but first I recommend you go ahead and try it yourself.
    Birazdan bazı ipuçları vereceğim, ancak önce gidip kendiniz denemenizi tavsiye ederim.
 
    Still here? Okay, here are some hints:
    Hâlâ burada mısın? Tamam, işte bazı ipuçları:
    - Your function should accept an [Int]? – an array of integers that might be there, or might be nil.
    - Fonksiyonunuz bir [Int]? - orada olabilecek veya nil olabilecek bir tamsayı dizisi.

    - It needs to return a non-optional Int.
    - Opsiyonel olmayan bir Int döndürmesi gerekir.

    - You can use optional chaining to call randomElement() on the optional array, which will in turn return another optional.
    - Optional dizisi üzerinde randomElement() işlevini çağırmak için optional chaining kullanabilirsiniz, bu da başka bir optional döndürür.

    - Because you need to return a non-optional integer, you should use nil coalescing to pick a random number from 1 through 100.
    - Opsiyonel olmayan bir tamsayı döndürmeniz gerektiğinden, 1 ile 100 arasında rastgele bir sayı seçmek için nil birleştirme kullanmalısınız.
*/

// ÇÖZÜM 1
func mindBlown(_ input: [Int]?) -> Int { return input?.randomElement() ?? Int.random(in: 1...100) }
print(mindBlown(nil))       // This prints a random number.
print(mindBlown([0, 1]))    // This prints 0 or 1.
print(mindBlown([]))        // This prints a random number.


// ÇÖZÜM 2
let array: [Int]? = nil
let mindBlown = array?.randomElement() ?? Int.random(in: 1...100)
print(mindBlown) // Depending on whether the array is nil or not,
                 // prints a random number from the array or anything from 1 to 100.



// ÇÖZÜM 3
func randomSelector3(of array: [Int]?) -> Int {
    guard let array = array else {
        return Int.random(in: 1...100)
    }
    // return array.randomElement()! <- One option
    return array.randomElement() ?? 0
}

print (randomSelector3(of: []))
print (randomSelector3(of: [1,2,3,4]))
