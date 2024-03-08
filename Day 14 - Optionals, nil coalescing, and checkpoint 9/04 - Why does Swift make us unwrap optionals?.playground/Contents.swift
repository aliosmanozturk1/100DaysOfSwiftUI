import Cocoa
import Foundation

/// # Why does Swift make us unwrap optionals?
/// # Swift neden opsiyonları açmamızı istiyor?

/**
     Swift’s optionals can either store a value, such as 5 or “Hello”, or they might be nothing at all. As you might imagine, trying to add two numbers together is only possible if the numbers are actually there, which is why Swift won’t let us try to use the values of optionals unless we unwrap them – unless we look inside the optional, check there’s actually a value there, then take the value out for us.
     Swift'in opsiyonelleri 5 veya "Merhaba" gibi bir değer saklayabilir ya da hiçbir şey olmayabilir. Tahmin edebileceğiniz gibi, iki sayıyı toplamaya çalışmak yalnızca sayılar gerçekten oradaysa mümkündür, bu yüzden Swift, onları açmadığımız sürece optional'ların değerlerini kullanmamıza izin vermez - optional'ın içine bakmadıkça, orada gerçekten bir değer olup olmadığını kontrol etmedikçe ve sonra değeri bizim için çıkarmadıkça.

     There are several ways of doing this in Swift, but one of the most common is if let, like this:
     Swift'te bunu yapmanın birkaç yolu vardır, ancak en yaygın olanlarından biri if let'tir, bunun gibi:
*/

func getUsername() -> String? {
    "Taylor"
}

if let username = getUsername() {
    print("Username is \(username)")
} else {
    print("No username")
}

/**
    The getUsername() function returns an optional string, which means it could be a string or it could be nil. I’ve made it always return a value here to make it easier to understand, but that doesn’t change what Swift thinks – it’s still an optional string.
    getUsername() fonksiyonu opsiyonel bir string döndürür, yani bir string olabileceği gibi nil de olabilir. Anlaşılmasını kolaylaştırmak için burada her zaman bir değer döndürmesini sağladım, ancak bu Swift'in ne düşündüğünü değiştirmiyor - hala isteğe bağlı bir string.

    That single if let line combines lots of functionality:
    Bu tek if let satırı birçok işlevi bir araya getiriyor:

    - It calls the getUsername() function.
    - getUsername() fonksiyonunu çağırır.

    - It receives the optional string back from there.
    - Opsiyonel string'i oradan geri alır.

    - It looks inside the optional string to see whether it has a value.
    - Bir değere sahip olup olmadığını görmek için opsiyonel stringin içine bakar.

    - As it does have a value (it’s “Taylor”), that value will be taken out of the optional and placed into a new username constant.
    - Bir değeri olduğu için ("Taylor"), bu değer opsiyonelden çıkarılacak ve yeni bir kullanıcı adı sabitine yerleştirilecektir.

    - The condition is then considered true, and it will print “Username is Taylor”.
    - Bu durumda koşul doğru kabul edilir ve "Kullanıcı adı Taylor" yazdırılır.

    So, if let is a fantastically concise way of working with optionals, taking care of checking and extracting values all at once.
    Yani, if let opsiyonellerle çalışmanın fevkalade özlü bir yoludur, değerleri tek seferde kontrol eder ve çıkarır.

    In fact, it’s so concise it even gives us a little shortcut. Rather than writing this:
    Aslında, o kadar kısa ve öz ki bize küçük bir kısayol bile veriyor. Bunu yazmak yerine:
*/

func square(number: Int) -> Int {
    number * number
}

var number: Int? = 5

if let number = number {
    print(square(number: number))
}

/**
    We can actually write this:
    Aslında bunu yazabiliriz:
*/

if let number {
    print(square(number: number))
}

/**
    It does exactly the same thing – it creates a shadowed copy of number that is unwrapped only inside that condition’s body, just with a bit less repetition.
    Tam olarak aynı şeyi yapar - sadece o koşulun gövdesi içinde çözülen sayının gölgeli bir kopyasını oluşturur, sadece biraz daha az tekrarla.

    The single most important feature of optionals is that Swift won’t let us use them without unwrapping them first. This provides a huge amount of protection for all our apps, because it puts a stop to uncertainty: when you’re handing a string you know it’s a valid string, when you call a function that returns an integer, you know it’s immediately safe to use. And when you do have optionals in your code, Swift will always make sure you handle them correctly – that you check and unwrap them, rather than just mixing unsafe values with known safe data.
    Opsiyonellerin en önemli özelliği, Swift'in önce onları açmadan kullanmamıza izin vermemesidir. Bu, tüm uygulamalarımız için büyük miktarda koruma sağlar, çünkü belirsizliğe son verir: bir dize verdiğinizde bunun geçerli bir dize olduğunu bilirsiniz, bir tamsayı döndüren bir işlevi çağırdığınızda, kullanımının hemen güvenli olduğunu bilirsiniz. Ve kodunuzda opsiyonlar olduğunda, Swift her zaman bunları doğru bir şekilde ele aldığınızdan emin olur - güvenli olmayan değerleri bilinen güvenli verilerle karıştırmak yerine bunları kontrol edip açarsınız.
*/
