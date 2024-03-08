import Cocoa

/// # How to unwrap optionals with nil coalescing

/**
    Wait… Swift has a third way of unwrapping optionals? Yep! And it’s really useful, too: it’s called the nil coalescing operator and it lets us unwrap an optional and provide a default value if the optional was empty.
    Bekle... Swift'in opsiyonelleri açmak için üçüncü bir yolu mu var? Evet! Ve gerçekten de kullanışlıdır: nil birleştirme operatörü olarak adlandırılır ve bir opsiyonu açmamızı ve opsiyon boşsa varsayılan bir değer sağlamamızı sağlar.

    Let’s rewind a bit:
    Biraz geri saralım:
*/

let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

let new = captains["Serenity"]

/**
    That reads a non-existent key in our captains dictionary, which means new will be an optional string to set to nil.
    Bu, kaptanlar sözlüğümüzde var olmayan bir anahtarı okur, bu da new'nin nil olarak ayarlanacak isteğe bağlı bir dize olacağı anlamına gelir.

    With the nil coalescing operator, written ??, we can provide a default value for any optional, like this:
    ?? şeklinde yazılan nil birleştirme operatörü ile herhangi bir opsiyonel için varsayılan bir değer sağlayabiliriz, bunun gibi:
*/

let new2 = captains["Serenity"] ?? "N/A"

/**
    That will read the value from the captains dictionary and attempt to unwrap it. If the optional has a value inside it will be sent back and stored in new, but if it doesn’t then “N/A” will be used instead.
    Bu, değeri kaptanlar sözlüğünden okuyacak ve onu açmaya çalışacaktır. Opsiyonel içinde bir değer varsa geri gönderilecek ve new'de saklanacaktır, ancak yoksa bunun yerine "N/A" kullanılacaktır.

    This means no matter what the optional contains – a value or nil – the end result is that new will be a real string, not an optional one. That might be the string from inside the captains value, or it might be “N/A”.
    Bu, optional'ın ne içerdiğine bakılmaksızın - bir değer veya nil - sonuçta new'in optional değil gerçek bir string olacağı anlamına gelir. Bu, captains değerinin içindeki dize olabilir veya "N/A" olabilir.

    Now, I know what you’re thinking: can’t we just specify a default value when reading from the dictionary? If you’re thinking that you’re absolutely correct:
    Şimdi ne düşündüğünüzü biliyorum: sözlükten okurken varsayılan bir değer belirleyemez miyiz? Eğer böyle düşünüyorsanız kesinlikle haklısınız:
*/

let new3 = captains["Serenity", default: "N/A"]

/**
    That produces exactly the same result, which might make it seem like the nil coalescing operator is pointless. However, not only does the nil coalescing operator work with dictionaries, but it works with any optionals.
    Bu tamamen aynı sonucu üretir, bu da nil birleştirme işlecinin anlamsız olduğunu düşündürebilir. Ancak, nil birleştirme işleci yalnızca sözlüklerle değil, aynı zamanda tüm optional'larla da çalışır.

    For example, the randomElement() method on arrays returns one random item from the array, but it returns an optional because you might be calling it on an empty array. So, we can use nil coalescing to provide a default:
    Örneğin, dizilerdeki randomElement() yöntemi diziden rastgele bir öğe döndürür, ancak boş bir dizi üzerinde çağırıyor olabileceğiniz için optional bir öğe döndürür. Bu nedenle, bir varsayılan sağlamak için nil birleştirme kullanabiliriz:
*/

let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"

/**
    Or perhaps you have a struct with an optional property, and want to provide a sensible default for when it’s missing:
    Ya da belki de opsiyonel bir özelliğe sahip bir struct'ınız vardır ve eksik olduğu durumlar için mantıklı bir varsayılan değer sağlamak istiyorsunuzdur:
*/

struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"
print(author)

/**
    It’s even useful if you create an integer from a string, where you actually get back an optional Int? because the conversion might have failed – you might have provided an invalid integer, such as “Hello”. Here we can use nil coalescing to provide a default value, like this:
    Bir dizeden bir tamsayı oluşturduğunuzda bile kullanışlıdır, burada aslında opsiyonel bir Int? geri alırsınız çünkü dönüştürme başarısız olmuş olabilir - "Merhaba" gibi geçersiz bir tamsayı sağlamış olabilirsiniz. Burada, varsayılan bir değer sağlamak için nil birleştirmeyi kullanabiliriz, bunun gibi:
 */

let input = ""
let number = Int(input) ?? 0
print(number)

/**
    As you can see, the nil coalescing operator is useful anywhere you have an optional and want to use the value inside or provide a default value if it’s missing.
    Gördüğünüz gibi, nil birleştirme operatörü, optional bir seçeneğiniz olan ve içindeki değeri kullanmak veya eksikse varsayılan bir değer sağlamak istediğiniz her yerde kullanışlıdır.
*/
