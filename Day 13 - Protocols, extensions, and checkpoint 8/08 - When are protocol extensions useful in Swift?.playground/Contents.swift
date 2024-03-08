import Cocoa

/// # When are protocol extensions useful in Swift?
/// # Swift'te protokol uzantıları ne zaman kullanışlıdır?

/**
    Protocol extensions are used everywhere in Swift, which is why you’ll often see it described as a “protocol-oriented programming language.” We use them to add functionality directly to protocols, which means we don’t need to copy that functionality across many structs and classes.
    Protokol uzantıları Swift'in her yerinde kullanılır, bu yüzden Swift'in "protokol odaklı programlama dili" olarak tanımlandığını sık sık görürsünüz. Bunları doğrudan protokollere işlevsellik eklemek için kullanırız, bu da bu işlevselliği birçok yapı ve sınıfa kopyalamamız gerekmediği anlamına gelir.

    For example, Swift’s arrays have an allSatisfy() method that returns true if all the items in the array pass a test. So, we could create an array of numbers and check that they are all even:
    Örneğin, Swift'in dizileri, dizideki tüm öğeler bir testi geçerse true döndüren bir allSatisfy() yöntemine sahiptir. Böylece, bir sayı dizisi oluşturabilir ve hepsinin çift olup olmadığını kontrol edebiliriz:
*/

let numbers = [4, 8, 15, 16]
let allEven = numbers.allSatisfy { $0.isMultiple(of: 2) }

/**
    That’s really useful, but wouldn’t it be more useful if it also worked on sets? Sure it would, and that’s why it does:
    Bu gerçekten kullanışlı, ancak setlerde de çalışsaydı daha kullanışlı olmaz mıydı? Elbette olurdu ve bu yüzden çalışıyor:
*/

let numbers2 = Set([4, 8, 15, 16])
let allEven2 = numbers2.allSatisfy { $0.isMultiple(of: 2) }

/**
    The underlying principle is identical: pass each item in the array or set through a test you provide, and if that returns true for all items then the result of the method is true.
    Temel prensip aynıdır: dizi veya kümedeki her öğeyi sağladığınız bir testten geçirin ve bu test tüm öğeler için true döndürürse yöntemin sonucu true olur.

    How about dictionaries – can they use this too? Sure they can, and it works identically: each key/value pair gets passed into the closure, and you need to return either true or false. It looks like this:
    Peki ya sözlükler - onlar da bunu kullanabilir mi? Elbette kullanabilirler ve aynı şekilde çalışır: her anahtar/değer çifti closure'a aktarılır ve true ya da false döndürmeniz gerekir. Şuna benzer:
*/

let numbers3 = ["four": 4, "eight": 8, "fifteen": 15, "sixteen": 16]
let allEven3 = numbers3.allSatisfy { $0.value.isMultiple(of: 2) }

/**
    Of course, the Swift developers don’t want to write this same code again and again, so they used a protocol extension: they wrote a single allSatisfy() method that works on a protocol called Sequence, which all arrays, sets, and dictionaries conform to. This meant the allSatisfy() method immediately became available on all those types, sharing exactly the same code.
    Elbette Swift geliştiricileri aynı kodu tekrar tekrar yazmak istemedikleri için bir protokol uzantısı kullandılar: tüm dizilerin, kümelerin ve sözlüklerin uyduğu Sequence adlı bir protokol üzerinde çalışan tek bir allSatisfy() yöntemi yazdılar. Bu, allSatisfy() yönteminin tüm bu türlerde hemen kullanılabilir hale gelmesi ve tamamen aynı kodu paylaşması anlamına geliyordu.
*/

