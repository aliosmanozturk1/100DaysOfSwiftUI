import Cocoa

/// # Why do classes have deinitializers and structs don’t?

/**
    One small but important feature of classes is that they can have a deinitializer function – a counterpart to init() that gets run when the class instance gets destroyed. Structs don’t have deinitializers, which means we can’t tell when they are destroyed.
    Sınıfların küçük ama önemli bir özelliği deinitializer fonksiyonuna sahip olabilmeleridir. init() fonksiyonunun karşılığı olan bu fonksiyon, sınıf örneği yok edildiğinde çalıştırılır. Yapıların deinitializer'ları yoktur, bu da ne zaman yok edildiklerini söyleyemeyeceğimiz anlamına gelir.

    The job of deinitializers is to tell us when a class instance was destroyed. For structs this is fairly simple: the struct is destroyed when whatever owns it no longer exists. So, if we create a struct inside a method and the methods ends, the struct is destroyed.
    Deinitializer'ların görevi, bir sınıf örneğinin ne zaman yok edildiğini bize söylemektir. Struct'lar için bu oldukça basittir: struct, ona sahip olan şey artık var olmadığında yok edilir. Yani, bir yöntemin içinde bir struct oluşturursak ve yöntem sona ererse, struct yok edilir.

    However, classes have complex copying behavior that means several copies of the class can exist in various parts of your program. All the copies point to the same underlying data, and so it’s now much harder to tell when the actual class instance is destroyed – when the final variable pointing to it has gone away.
    Ancak, sınıflar karmaşık kopyalama davranışına sahiptir, bu da programınızın çeşitli bölümlerinde sınıfın birkaç kopyasının bulunabileceği anlamına gelir. Tüm kopyalar aynı temel veriye işaret eder ve bu nedenle gerçek sınıf örneğinin ne zaman yok edildiğini söylemek artık çok daha zordur - ona işaret eden son değişken ortadan kalktığında.

    Behind the scenes Swift performs something called automatic reference counting, or ARC. ARC tracks how many copies of each class instance exists: every time you take a copy of a class instance Swift adds 1 to its reference count, and every time a copy is destroyed Swift subtracts 1 from its reference count. When the count reaches 0 it means no one refers to the class any more, and Swift will call its deinitializer and destroy the object.
    Swift, perde arkasında otomatik referans sayımı veya ARC adı verilen bir işlem gerçekleştirir. ARC, her sınıf örneğinin kaç kopyası olduğunu izler: bir sınıf örneğinin her kopyasını aldığınızda Swift referans sayısına 1 ekler ve bir kopya her yok edildiğinde Swift referans sayısından 1 çıkarır. Sayı 0'a ulaştığında, artık kimse sınıfa atıfta bulunmuyor demektir ve Swift deinitializer'ını çağırarak nesneyi yok eder.

    So, the simple reason for why structs don’t have deinitializers is because they don’t need them: each struct has its own copy of its data, so nothing special needs to happen when it is destroyed.
    Dolayısıyla, struct'ların deinitializer'larının olmamasının basit nedeni, bunlara ihtiyaç duymamalarıdır: her struct, verilerinin kendi kopyasına sahiptir, bu nedenle yok edildiğinde özel bir şey olması gerekmez.

    You can put your deinitializer anywhere you want in your code, but I love this quote from Anne Cahalan: “Code should read like sentences, which makes me think my classes should read like chapters. So the deinitializer goes at the end, it's the ~fin~ of the class!”
    Deinitializer'ınızı kodunuzda istediğiniz yere koyabilirsiniz, ancak Anne Cahalan'ın şu sözünü çok seviyorum: "Kod cümleler gibi okunmalı, bu da bana sınıflarımın bölümler gibi okunması gerektiğini düşündürüyor. Bu yüzden deinitializer en sona gider, sınıfın ~fin~'idir!"
*/

