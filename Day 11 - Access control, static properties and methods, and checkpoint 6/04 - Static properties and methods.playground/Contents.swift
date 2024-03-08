import Cocoa

/// # Static properties and methods
/// # Erişim kontrolünün amacı nedir?

/**
 You’ve seen how we can attach properties and methods to structs, and how each struct has its own unique copy of those properties so that calling a method on the struct won’t read the properties of a different struct from the same type.
 Yapılara nasıl özellikler ve yöntemler ekleyebileceğimizi ve her yapının bu özelliklerin kendine özgü bir kopyasına sahip olduğunu gördünüz, böylece yapı üzerinde bir yöntem çağırmak aynı türden farklı bir yapının özelliklerini okumaz.

 Well, sometimes – only sometimes – you want to add a property or method to the struct itself, rather than to one particular instance of the struct, which allows you to use them directly. I use this technique a lot with SwiftUI for two things: creating example data, and storing fixed data that needs to be accessed in various places.
 Bazen - sadece bazen - bir özelliği veya yöntemi struct'ın belirli bir örneği yerine struct'ın kendisine eklemek istersiniz, bu da onları doğrudan kullanmanıza olanak tanır. Bu tekniği SwiftUI ile iki şey için çok kullanıyorum: örnek veriler oluşturmak ve çeşitli yerlerde erişilmesi gereken sabit verileri depolamak.

 First, let’s look at a simplified example of how to create and use static properties and methods:
 İlk olarak, statik özelliklerin ve yöntemlerin nasıl oluşturulacağı ve kullanılacağına ilişkin basitleştirilmiş bir örneğe bakalım:
*/

struct School {
    static var studentCount = 0

    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}

/**
 Notice the keyword static in there, which means both the studentCount property and add() method belong to the School struct itself, rather than to individual instances of the struct.
 Buradaki static anahtar kelimesine dikkat edin; bu da hem studentCount özelliğinin hem de add() yönteminin yapının tek tek örneklerine değil, School yapısının kendisine ait olduğu anlamına gelir.

 To use that code, we’d write the following:
 Bu kodu kullanmak için aşağıdakileri yazarız:
*/

School.add(student: "Taylor Swift")
print(School.studentCount)

/**
    I haven’t created an instance of School – we can literally use add() and studentCount directly on the struct. This is because those are both static, which means they don’t exist uniquely on instances of the struct.
    School'un bir örneğini oluşturmadım - add() ve studentCount'u doğrudan struct üzerinde kullanabiliriz. Çünkü bunların her ikisi de statiktir, yani struct'ın örneklerinde benzersiz olarak bulunmazlar.

    This should also explain why we’re able to modify the studentCount property without marking the method as mutating – that’s only needed with regular struct functions for times when an instance of struct was created as a constant, and there is no instance when calling add().
    Bu aynı zamanda studentCount özelliğini neden yöntemi mutasyon olarak işaretlemeden değiştirebildiğimizi de açıklar - bu yalnızca bir struct örneğinin sabit olarak oluşturulduğu zamanlar için normal struct işlevlerinde gereklidir ve add() çağrılırken bir örnek yoktur.

    If you want to mix and match static and non-static properties and methods, there are two rules:
    Statik ve statik olmayan özellikleri ve yöntemleri karıştırmak ve eşleştirmek istiyorsanız, iki kural vardır:

    - To access non-static code from static code… you’re out of luck: static properties and methods can’t refer to non-static properties and methods because it just doesn’t make sense – which instance of School would you be referring to?
    - Statik koddan statik olmayan koda erişmek için... şansınız yok: statik özellikler ve yöntemler statik olmayan özelliklere ve yöntemlere atıfta bulunamaz çünkü bu mantıklı değildir - hangi Okul örneğine atıfta bulunacaksınız?

    - To access static code from non-static code, always use your type’s name such as School.studentCount. You can also use Self to refer to the current type.
    - Statik olmayan koddan statik koda erişmek için her zaman School.studentCount gibi türünüzün adını kullanın. Geçerli türe başvurmak için Self'i de kullanabilirsiniz.

    Now we have self and Self, and they mean different things: self refers to the current value of the struct, and Self refers to the current type.
    Şimdi self ve Self var ve farklı anlamlara geliyorlar: self struct'ın mevcut değerini, Self ise mevcut türü ifade ediyor.

    Tip: It’s easy to forget the difference between self and Self, but if you think about it it’s just like the rest of Swift’s naming – we start all our data types with a capital letter (Int, Double, Bool, etc), so it makes sense for Self to start with a capital letter too.
    İpucu: self ve Self arasındaki farkı unutmak kolaydır, ancak düşünürseniz bu tıpkı Swift'in geri kalan isimlendirmesi gibidir - tüm veri türlerimizi büyük harfle başlatırız (Int, Double, Bool, vb.), bu nedenle Self'in de büyük harfle başlaması mantıklıdır.

    Now, that sound you can hear is a thousand other learners saying “why the heck is this needed?” And I get it – this can seem like a rather redundant feature at first. So, I want to show you the two main ways I use static data.
    Şimdi, duyabileceğiniz bu ses binlerce başka öğrencinin "buna neden ihtiyaç duyuluyor?" demesidir. Ve anlıyorum - bu ilk başta oldukça gereksiz bir özellik gibi görünebilir. Bu yüzden size statik verileri kullandığım iki ana yolu göstermek istiyorum.

    First, I use static properties to organize common data in my apps. For example, I might have a struct like AppData to store lots of shared values I use in many places:
    İlk olarak, uygulamalarımdaki ortak verileri düzenlemek için statik özellikler kullanıyorum. Örneğin, birçok yerde kullandığım çok sayıda paylaşılan değeri depolamak için AppData gibi bir yapıya sahip olabilirim:
*/

struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}

/**
    Using this approach, everywhere I need to check or display something like my app’s version number – an about screen, debug output, logging information, support emails, etc – I can read AppData.version.
    Bu yaklaşımı kullanarak, uygulamamın sürüm numarası gibi bir şeyi kontrol etmem veya görüntülemem gereken her yerde - hakkında ekranı, hata ayıklama çıktısı, günlük bilgileri, destek e-postaları, vb - AppData.version dosyasını okuyabilirim.

    The second reason I commonly use static data is to create examples of my structs. As you’ll see later on, SwiftUI works best when it can show previews of your app as you develop, and those previews often require sample data. For example, if you’re showing a screen that displays data on one employee, you’ll want to be able to show an example employee in the preview screen so you can check it all looks correct as you work.
    Statik verileri yaygın olarak kullanmamın ikinci nedeni, yapılarımın örneklerini oluşturmaktır. Daha sonra göreceğiniz gibi SwiftUI, siz geliştirirken uygulamanızın önizlemelerini gösterebildiğinde en iyi şekilde çalışır ve bu önizlemeler genellikle örnek veri gerektirir. Örneğin, bir çalışanla ilgili verileri gösteren bir ekran gösteriyorsanız, önizleme ekranında örnek bir çalışan gösterebilmek istersiniz, böylece çalışırken her şeyin doğru görünüp görünmediğini kontrol edebilirsiniz.

    This is best done using a static example property on the struct, like this:
    Bu en iyi şekilde, yapı üzerinde aşağıdaki gibi statik bir örnek özellik kullanılarak yapılır:
*/

struct Employee {
    let username: String
    let password: String

    static let example = Employee(username: "cfederighi", password: "hairforceone")
}

/**
    And now whenever you need an Employee instance to work with in your design previews, you can use Employee.example and you’re done.
    Ve artık tasarım önizlemelerinizde çalışmak için bir Employee örneğine ihtiyaç duyduğunuzda Employee.example'ı kullanabilirsiniz ve işiniz biter.

    Like I said at the beginning, there are only a handful of occasions when a static property or method makes sense, but they are still a useful tool to have around.
    Başta da söylediğim gibi, statik bir özellik veya yöntemin anlamlı olduğu durumlar çok azdır, ancak yine de kullanışlı bir araçtır.
*/
