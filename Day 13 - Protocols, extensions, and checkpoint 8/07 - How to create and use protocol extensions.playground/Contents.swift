import Cocoa

/// # How to create and use protocol extensions

// TAM ANLAMADIM

/**
    Protocols let us define contracts that conforming types must adhere to, and extensions let us add functionality to existing types. But what would happen if we could write extensions on protocols?
    Protokoller, uyumlu tiplerin uyması gereken sözleşmeleri tanımlamamızı sağlar ve uzantılar mevcut tiplere işlevsellik eklememize izin verir. Peki protokoller üzerine uzantılar yazabilseydik ne olurdu?


    Well, wonder no more because Swift supports exactly this using the aptly named protocol extensions: we can extend a whole protocol to add method implementations, meaning that any types conforming to that protocol get those methods.
    Artık merak etmeyin çünkü Swift, protokol uzantılarını kullanarak tam olarak bunu destekler: yöntem uygulamaları eklemek için tüm bir protokolü genişletebiliriz, yani bu protokole uyan herhangi bir tür bu yöntemleri alır.


    Let’s start with a trivial example. It’s very common to write a condition checking whether an array has any values in, like this:
    Önemsiz bir örnekle başlayalım. Bir dizinin içinde herhangi bir değer olup olmadığını kontrol eden bir koşul yazmak çok yaygındır, bunun gibi:
*/

let guests = ["Mario", "Luigi", "Peach"]

if guests.isEmpty == false {
    print("Guest count: \(guests.count)")
}

/**
    Some people prefer to use the Boolean ! operator, like this:
    Bazı insanlar Boolean ! operatörünü kullanmayı tercih eder, bunun gibi:
*/

if !guests.isEmpty {
    print("Guest count: \(guests.count)")
}

/**
    I’m not really a big fan of either of those approaches, because they just don’t read naturally to me “if not some array is empty”?
    Bu iki yaklaşımın da büyük bir hayranı değilim, çünkü bana doğal gelmiyorlar "eğer bazı diziler boş değilse"?

    We can fix this with a really simple extension for Array, like this:
    Bunu Array için aşağıdaki gibi gerçekten basit bir uzantı ile düzeltebiliriz:
 */

extension Array {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

/**
    Tip: Xcode’s playgrounds run their code from top to bottom, so make sure you put that extension before where it’s used.
    İpucu: Xcode'un oyun alanları kodlarını yukarıdan aşağıya doğru çalıştırır, bu nedenle bu uzantıyı kullanıldığı yerden önce koyduğunuzdan emin olun.

    Now we can write code that I think is easier to understand:
    Artık anlaşılması daha kolay olduğunu düşündüğüm bir kod yazabiliriz:
 */

if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}

/**
    But we can do better. You see, we just added isNotEmpty to arrays, but what about sets and dictionaries? Sure, we could repeat ourself and copy the code into extensions for those, but there’s a better solution: Array, Set, and Dictionary all conform to a built-in protocol called Collection, through which they get functionality such as contains(), sorted(), reversed(), and more.
    Ama daha iyisini yapabiliriz. Görüyorsunuz, az önce isNotEmpty'yi dizilere ekledik, peki ya kümeler ve sözlükler? Elbette, kendimizi tekrar edebilir ve kodu bunlar için uzantılara kopyalayabiliriz, ancak daha iyi bir çözüm var: Array, Set ve Dictionary'nin tümü Collection adı verilen yerleşik bir protokole uygundur ve bu protokol aracılığıyla contains(), sorted(), reversed() ve daha fazlası gibi işlevlere sahip olurlar.

    This is important, because Collection is also what requires the isEmpty property to exist. So, if we write an extension on Collection, we can still access isEmpty because it’s required. This means we can change Array to Collection in our code to get this:
    Bu önemlidir, çünkü Collection aynı zamanda isEmpty özelliğinin var olmasını gerektiren şeydir. Dolayısıyla, Collection üzerine bir uzantı yazarsak, isEmpty özelliğine erişmeye devam edebiliriz çünkü bu özellik gereklidir. Bu, bunu elde etmek için kodumuzda Array'i Collection olarak değiştirebileceğimiz anlamına gelir:
*/

extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

/**
    With that one word change in place, we can now use isNotEmpty on arrays, sets, and dictionaries, as well as any other types that conform to Collection. Believe it or not, that tiny extension exists in thousands of Swift projects because so many other people find it easier to read.
    Bu tek kelimelik değişiklikle artık isNotEmpty'yi diziler, kümeler ve sözlüklerin yanı sıra Collection'a uyan diğer türlerde de kullanabiliyoruz. İster inanın ister inanmayın, bu küçük uzantı binlerce Swift projesinde var çünkü diğer pek çok kişi bunu okumayı daha kolay buluyor.

    More importantly, by extending the protocol we’re adding functionality that would otherwise need to be done inside individual structs. This is really powerful, and leads to a technique Apple calls protocol-oriented programming – we can list some required methods in a protocol, then add default implementations of those inside a protocol extension. All conforming types then get to use those default implementations, or provide their own as needed.
    Daha da önemlisi, protokolü genişleterek, aksi takdirde tek tek yapıların içinde yapılması gereken işlevleri ekliyoruz. Bu gerçekten güçlüdür ve Apple'ın protokol odaklı programlama olarak adlandırdığı bir tekniğe yol açar - bir protokolde bazı gerekli yöntemleri listeleyebilir, ardından bunların varsayılan uygulamalarını bir protokol uzantısının içine ekleyebiliriz. Tüm uyumlu tipler daha sonra bu varsayılan uygulamaları kullanabilir veya gerektiğinde kendi uygulamalarını sağlayabilir.

    For example, if we had a protocol like this one:
    Örneğin, bunun gibi bir protokolümüz olsaydı:
*/

protocol Person {
    var name: String { get }
    func sayHello()
}

/**
    That means all conforming types must add a sayHello() method, but we can also add a default implementation of that as an extension like this:
    Bu, tüm uyumlu türlerin bir sayHello() yöntemi eklemesi gerektiği anlamına gelir, ancak bunun varsayılan bir uygulamasını da aşağıdaki gibi bir uzantı olarak ekleyebiliriz:
 */

extension Person {
    func sayHello() {
        print("Hi, I'm \(name)")
    }
}

/**
    And now conforming types can add their own sayHello() method if they want, but they don’t need to – they can always rely on the one provided inside our protocol extension.
    Ve artık uyumlu türler isterlerse kendi sayHello() yöntemlerini ekleyebilirler, ancak buna gerek yoktur - her zaman protokol uzantımızın içinde sağlanan yönteme güvenebilirler.

    So, we could create an employee without the sayHello() method:
    Böylece, sayHello() yöntemi olmadan bir çalışan oluşturabiliriz:
*/

struct Employee: Person {
    let name: String
}

/**
    But because it conforms to Person, we could use the default implementation we provided in our extension:
    Ancak Person ile uyumlu olduğu için, uzantımızda sağladığımız varsayılan uygulamayı kullanabiliriz:
 */

let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()

/**
    Swift uses protocol extensions a lot, but honestly you don’t need to understand them in great detail just yet – you can build fantastic apps without ever using a protocol extension. At this point you know they exist and that’s enough!
    Swift protokol uzantılarını çok kullanır, ancak dürüst olmak gerekirse henüz bunları çok ayrıntılı olarak anlamanıza gerek yok - bir protokol uzantısı kullanmadan harika uygulamalar oluşturabilirsiniz. Bu noktada var olduklarını biliyorsunuz ve bu yeterli!
*/
