import Cocoa

/// # How to create your own classes

/**
    Swift uses structs for storing most of its data types, including String, Int, Double, and Array, but there is another way to create custom data types called classes. These have many things in common with structs, but are different in key places.
    Swift, String, Int, Double ve Array gibi veri türlerinin çoğunu saklamak için struct'ları kullanır, ancak sınıf adı verilen özel veri türleri oluşturmanın başka bir yolu daha vardır. Bunların struct'larla birçok ortak noktası vardır, ancak önemli yerlerde farklıdırlar.

    First, the things that classes and structs have in common include:
    İlk olarak, class ve struct'ların ortak yönleri şunlardır:
    - You get to create and name them.
    - Onları siz yaratır ve isimlendirirsiniz.

    - You can add properties and methods, including property observers and access control.
    - Özellik gözlemcileri ve erişim kontrolü dahil olmak üzere özellikler ve yöntemler ekleyebilirsiniz.

    - You can create custom initializers to configure new instances however you want.
    - Yeni örnekleri istediğiniz gibi yapılandırmak için özel başlatıcılar oluşturabilirsiniz.

    However, classes differ from structs in five key places:
    Ancak, class'lar struct'lardan beş temel noktada ayrılır:
    - You can make one class build upon functionality in another class, gaining all its properties and methods as a starting point. If you want to selectively override some methods, you can do that too.
    - Bir sınıfı başka bir sınıftaki işlevsellik üzerine inşa edebilir, tüm özelliklerini ve metotlarını başlangıç noktası olarak alabilirsiniz. Bazı yöntemleri seçerek geçersiz kılmak istiyorsanız, bunu da yapabilirsiniz.

    - Because of that first point, Swift won’t automatically generate a memberwise initializer for classes. This means you either need to write your own initializer, or assign default values to all your properties.
    - Bu ilk nokta nedeniyle, Swift sınıflar için otomatik olarak üye bazında bir ilklendirici oluşturmaz. Bu da ya kendi initializer'ınızı yazmanız ya da tüm özelliklerinize varsayılan değerler atamanız gerektiği anlamına gelir.

    - When you copy an instance of a class, both copies share the same data – if you change one copy, the other one also changes.
    - Bir sınıfın bir örneğini kopyaladığınızda, her iki kopya da aynı verileri paylaşır - bir kopyayı değiştirirseniz, diğeri de değişir.

    - When the final copy of a class instance is destroyed, Swift can optionally run a special function called a deinitializer.
    - Bir sınıf örneğinin son kopyası yok edildiğinde, Swift isteğe bağlı olarak deinitializer adı verilen özel bir işlev çalıştırabilir.

    - Even if you make a class constant, you can still change its properties as long as they are variables.
    - Bir sınıfı sabit yapsanız bile, değişken oldukları sürece özelliklerini değiştirebilirsiniz.

    On the surface those probably seem fairly random, and there’s a good chance you’re probably wondering why classes are even needed when we already have structs.
    Görünüşte bunlar muhtemelen oldukça rastgele görünüyor ve büyük olasılıkla zaten struct'larımız varken sınıflara neden ihtiyaç duyulduğunu merak ediyorsunuz.

    However, SwiftUI uses classes extensively, mainly for point 3: all copies of a class share the same data. This means many parts of your app can share the same information, so that if the user changed their name in one screen all the other screens would automatically update to reflect that change.
    Ancak SwiftUI, sınıfları özellikle 3. madde için yoğun olarak kullanır: bir sınıfın tüm kopyaları aynı verileri paylaşır. Bu, uygulamanızın birçok bölümünün aynı bilgileri paylaşabileceği anlamına gelir; böylece kullanıcı bir ekranda adını değiştirirse, diğer tüm ekranlar bu değişikliği yansıtacak şekilde otomatik olarak güncellenir.

    The other points matter, but are of varying use:
    Diğer noktalar önemlidir, ancak farklı kullanım alanları vardır:
    - Being able to build one class based on another is really important in Apple’s older UI framework, UIKit, but is much less common in SwiftUI apps. In UIKit it was common to have long class hierarchies, where class A was built on class B, which was built on class C, which was built on class D, etc.
    Bir sınıfı diğerinin üzerine inşa edebilmek, Apple'ın eski UI çerçevesi UIKit'te gerçekten önemlidir, ancak SwiftUI uygulamalarında çok daha az yaygındır. UIKit'te, A sınıfının B sınıfı üzerine inşa edildiği, bunun da C sınıfı üzerine inşa edildiği, bunun da D sınıfı üzerine inşa edildiği vb. uzun sınıf hiyerarşilerine sahip olmak yaygındı.

    - Lacking a memberwise initializer is annoying, but hopefully you can see why it would be tricky to implement given that one class can be based upon another – if class C added an extra property it would break all the initializers for C, B, and A.
    - Üye bazında başlatıcı olmaması can sıkıcıdır, ancak bir sınıfın diğerine dayalı olabileceği düşünüldüğünde bunun uygulanmasının neden zor olacağını umarım anlayabilirsiniz - eğer C sınıfı ekstra bir özellik eklerse, C, B ve A için tüm başlatıcıları bozar.

    - Being able to change a constant class’s variables links in to the multiple copy behavior of classes: a constant class means we can’t change what pot our copy points to, but if the properties are variable we can still change the data inside the pot. This is different from structs, where each copy of a struct is unique and holds its own data.
    - Sabit bir sınıfın değişkenlerini değiştirebilmek, sınıfların çoklu kopya davranışıyla bağlantılıdır: sabit bir sınıf, kopyamızın işaret ettiği potu değiştiremeyeceğimiz anlamına gelir, ancak özellikler değişkense potun içindeki verileri yine de değiştirebiliriz. Bu, bir struct'ın her kopyasının benzersiz olduğu ve kendi verilerini tuttuğu struct'lardan farklıdır.

    - Because one instance of a class can be referenced in several places, it becomes important to know when the final copy has been destroyed. That’s where the deinitializer comes in: it allows us to clean up any special resources we allocated when that last copy goes away.
    - Bir sınıfın bir örneğine birçok yerde başvurulabildiğinden, son kopyanın ne zaman yok edildiğini bilmek önemli hale gelir. İşte burada deinitializer devreye girer: son kopya yok olduğunda ayırdığımız özel kaynakları temizlememizi sağlar.


    Before we’re done, let’s look at just a tiny slice of code that creates and uses a class:
    İşimizi bitirmeden önce, bir sınıf oluşturan ve kullanan küçük bir kod parçasına bakalım:
*/

class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10

/**
    Yes, the only difference between that and a struct is that it was created using class rather than struct – everything else is identical. That might make classes seem redundant, but trust me: all five of their differences are important.
    Evet, bununla bir struct arasındaki tek fark struct yerine class kullanılarak oluşturulmuş olmasıdır - diğer her şey aynıdır. Bu, sınıfları gereksiz gibi gösterebilir, ancak bana güvenin: aralarındaki beş farkın hepsi önemlidir.

    I’ll be going into more detail on the five differences between classes and structs in the following chapters, but right now the most important thing to know is this: structs are important, and so are classes – you will need both when using SwiftUI.
    İlerleyen bölümlerde sınıflar ve struct'lar arasındaki beş fark hakkında daha fazla ayrıntıya gireceğim, ancak şu anda bilmeniz gereken en önemli şey şudur: struct'lar önemlidir, sınıflar da öyle - SwiftUI kullanırken her ikisine de ihtiyacınız olacak.
*/
