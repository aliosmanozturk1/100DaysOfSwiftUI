import Cocoa

/// # Why do copies of a class share their data?
/// # Bir sınıfın kopyaları neden verilerini paylaşır?

/**
 One feature of Swift that is truly confusing at first is how the behaviors of its classes and structs differ when they are copied: copies of the same class share their underlying data, meaning that changing one changes them all, whereas structs always have their own unique data, and changing a copy does not affect the others.
 Swift'in ilk başta gerçekten kafa karıştırıcı olan bir özelliği, kopyalandıklarında sınıflarının ve yapılarının davranışlarının nasıl farklılaştığıdır: aynı sınıfın kopyaları temel verilerini paylaşır, yani birini değiştirmek hepsini değiştirir, oysa yapılar her zaman kendi benzersiz verilerine sahiptir ve bir kopyayı değiştirmek diğerlerini etkilemez.

 The technical term for this distinction is “value types vs reference types.” Structs are value types, which means they hold simple values such as the number 5 or the string “hello”. It doesn’t matter how many properties or methods your struct has, it’s still considered one simple value like a number. On the other hand, classes are reference types, which means they refer to a value somewhere else.
 Bu ayrım için kullanılan teknik terim "değer tiplerine karşı referans tipleri "dir. Yapılar değer türleridir, yani 5 sayısı veya "hello" dizesi gibi basit değerleri tutarlar. Yapınızın kaç tane özelliği veya yöntemi olduğu önemli değildir, yine de sayı gibi basit bir değer olarak kabul edilir. Öte yandan, sınıflar referans türleridir, yani başka bir yerdeki bir değere atıfta bulunurlar.

 For value types, this is easy enough to understand that it’s self-evident. For example, look at this code:
 Değer türleri için, bu durum kendiliğinden anlaşılacak kadar kolaydır. Örneğin, şu koda bakın:
*/

var message = "Welcome"
var greeting = message
greeting = "Hello"
print(message)
print(greeting)

/**
    When that code runs, message will still be set to “Welcome”, but greeting will be set to “Hello”. As Chris Eidhof says, “this is so natural it seems like stating the obvious.” (https://chris.eidhof.nl/post/structs-and-mutation-in-swift/) But that’s how structs behave: their value are wholly contained inside their variable, and not somehow shared with other values. This means all their data is stored directly in each variable, so when you copy it you get a deep copy of all the data.
    Bu kod çalıştığında, message hala "Welcome" olarak ayarlanacaktır, ancak greeting "Hello" olarak ayarlanacaktır. Chris Eidhof'un dediği gibi, "bu o kadar doğal ki, bariz olanı ifade etmek gibi görünüyor." (https://chris.eidhof.nl/post/structs-and-mutation-in-swift/) Ancak struct'lar bu şekilde davranır: değerleri tamamen değişkenlerinin içinde bulunur ve bir şekilde diğer değerlerle paylaşılmaz. Bu, tüm verilerinin doğrudan her değişkende depolandığı anlamına gelir, bu nedenle kopyaladığınızda tüm verilerin derin bir kopyasını alırsınız.

    In contrast, the best way to think about a reference type is that it’s like a signpost pointing to some data. If we create an instance of a class, it will take up some memory on your iPhone, and the variable that stores the instance is really just a signpost to the actual memory where the object lives. If you take a copy of the object, you get a new signpost but it still points to the memory where the original object lives. This is why changing one instance of a class changes them all: all copies of the object are signposts pointing to the same piece of memory.
    Buna karşılık, referans tipi hakkında düşünmenin en iyi yolu, bazı verilere işaret eden bir tabela gibi olmasıdır. Bir sınıfın örneğini oluşturursak, iPhone'unuzda bir miktar bellek kaplar ve örneği depolayan değişken aslında nesnenin yaşadığı gerçek belleğe giden bir işaret tabelasıdır. Nesnenin bir kopyasını alırsanız, yeni bir tabela elde edersiniz ancak bu tabela hala orijinal nesnenin bulunduğu belleği işaret eder. Bir sınıfın bir örneğini değiştirmenin hepsini değiştirmesinin nedeni budur: nesnenin tüm kopyaları aynı bellek parçasına işaret eden tabelalardır.

    It’s hard to overestimate how important this difference is in Swift development. Previously I mentioned that Swift developers prefer to use structs for their custom types, and this copy behavior is a big reason. Imagine if you had a big app and wanted to share a User object in various places – what would happen if one of those places changed your user? If you were using a class, all the other places that used your user would have their data changed without realizing it, and you might end up with problems. But if you were using a struct, every part of your app has its own copy of the data and it can’t be changed by surprise.
    Bu farkın Swift geliştirmede ne kadar önemli olduğunu tahmin etmek zor. Daha önce Swift geliştiricilerinin özel tipleri için struct kullanmayı tercih ettiklerinden bahsetmiştim ve bu kopyalama davranışı bunun büyük bir nedenidir. Büyük bir uygulamanız olduğunu ve bir Kullanıcı nesnesini çeşitli yerlerde paylaşmak istediğinizi düşünün - bu yerlerden biri kullanıcınızı değiştirirse ne olur? Bir sınıf kullanıyor olsaydınız, kullanıcınızı kullanan diğer tüm yerlerin verileri farkına varmadan değişirdi ve sonunda sorun yaşayabilirdiniz. Ancak bir struct kullanıyor olsaydınız, uygulamanızın her parçası verilerin kendi kopyasına sahip olurdu ve bu veriler sürpriz bir şekilde değiştirilemezdi.

    As with many things in programming, the choices you make should help convey a little of your reasoning. In this case, using a class rather than a struct sends a strong message that you want the data to be shared somehow, rather than having lots of distinct copies.
    Programlamadaki pek çok şeyde olduğu gibi, yaptığınız seçimler mantığınızı biraz olsun aktarmanıza yardımcı olmalıdır. Bu durumda, bir struct yerine bir sınıf kullanmak, çok sayıda farklı kopyaya sahip olmak yerine verilerin bir şekilde paylaşılmasını istediğinize dair güçlü bir mesaj gönderir.
*/
