import Cocoa

/// # Why does Swift need protocols?

/**
    Protocols let us define how structs, classes, and enums ought to work: what methods they should have, and what properties they should have. Swift will enforce these rules for us, so that when we say a type conforms to a protocol Swift will make sure it has all the methods and properties required by that protocol.
    Protokoller yapıların, sınıfların ve enumların nasıl çalışması gerektiğini tanımlamamızı sağlar: hangi yöntemlere sahip olmaları ve hangi özelliklere sahip olmaları gerektiğini. Swift bu kuralları bizim için uygulayacaktır, böylece bir tipin bir protokole uygun olduğunu söylediğimizde Swift, o protokolün gerektirdiği tüm yöntemlere ve özelliklere sahip olduğundan emin olacaktır.

    In practice, what protocols allow us to do is treat our data in more general terms. So, rather than saying “this buy() method must accept a Book object,” we can say “this method can accept anything that conforms to the Purchaseable protocol. That might be a book, but it might also be a movie, a car, some coffee, and so on – it makes our simple method more flexible, while ensuring that Swift enforces the rules for us.
    Pratikte, protokollerin yapmamıza izin verdiği şey, verilerimizi daha genel terimlerle ele almaktır. Yani, "bu buy() metodu bir Book nesnesini kabul etmelidir" demek yerine, "bu metot Purchaseable protokolüne uyan her şeyi kabul edebilir" diyebiliriz. Bu bir kitap olabilir, ancak aynı zamanda bir film, bir araba, biraz kahve vb. de olabilir - Swift'in bizim için kuralları uygulamasını sağlarken basit yöntemimizi daha esnek hale getirir.

    In code terms, our simple buy() method that works only with books would look like this:
    Kod açısından, yalnızca kitaplarla çalışan basit buy() yöntemimiz şu şekilde görünecektir:
*/

struct Book2 {
    var name: String
}

func buy(_ book: Book2) {
    print("I'm buying \(book.name)")
}

/**
    To create a more flexible, protocol-based approach we would first create a protocol that declares the basic functionality we need. This might be many methods and properties, but here we’re just going to say that we need a name string:
    Daha esnek, protokol tabanlı bir yaklaşım oluşturmak için öncelikle ihtiyacımız olan temel işlevselliği bildiren bir protokol oluşturacağız. Bu birçok yöntem ve özellik olabilir, ancak burada sadece bir isim dizesine ihtiyacımız olduğunu söyleyeceğiz:
*/

protocol Purchaseable {
    var name: String { get set }
}

/**
    Now we can go ahead and define as many structs as we need, with each one conforming to that protocol by having a name string:
    Şimdi devam edebilir ve istediğimiz kadar yapı tanımlayabiliriz, her biri bir isim dizesine sahip olarak bu protokole uyar:
*/

struct Book: Purchaseable {
    var name: String
    var author: String
}

struct Movie: Purchaseable {
    var name: String
    var actors: [String]
}

struct Car: Purchaseable {
    var name: String
    var manufacturer: String
}

struct Coffee: Purchaseable {
    var name: String
    var strength: Int
}

/**
    You’ll notice each one of those types has a different property that wasn’t declared in the protocol, and that’s okay – protocols determine the minimum required functionality, but we can always add more.
    Bu türlerin her birinin protokolde bildirilmemiş farklı bir özelliği olduğunu fark edeceksiniz ve bu sorun değil - protokoller gerekli minimum işlevselliği belirler, ancak her zaman daha fazlasını ekleyebiliriz.

    Finally, we can rewrite the buy() function so that it accepts any kind of Purchaseable item:
    Son olarak, buy() fonksiyonunu her türlü Purchaseable öğesini kabul edecek şekilde yeniden yazabiliriz:
*/

func buy(_ item: Purchaseable) {
    print("I'm buying \(item.name)")
}

/**
    Inside that method we can use the name property of our item safely, because Swift will guarantee that each Purchaseable item has a name property. It doesn’t guarantee that any of the other properties we defined will exist, only the ones that are specifically declared in the protocol.
    Bu yöntemin içinde öğemizin name özelliğini güvenle kullanabiliriz, çünkü Swift her Purchaseable öğesinin bir name özelliğine sahip olduğunu garanti eder. Tanımladığımız diğer özelliklerden herhangi birinin var olacağını garanti etmez, yalnızca protokolde özel olarak bildirilenlerin var olacağını garanti eder.

    So, protocols let us create blueprints of how our types share functionality, then use those blueprints in our functions to let them work on a wider variety of data.
    Dolayısıyla protokoller, türlerimizin işlevselliği nasıl paylaştığına dair planlar oluşturmamıza ve ardından bu planları işlevlerimizde kullanarak daha geniş bir veri çeşitliliği üzerinde çalışmalarına izin vermemize olanak tanır.
*/
