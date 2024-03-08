import Cocoa

/// # What’s the point of access control?
/// # Erişim kontrolünün amacı nedir?

/**
    Swift’s access control keywords let us restrict how different parts of our code can be accessed, but a lot of the time it’s just obeying the rules we put into place – we could remove them if we wanted and bypass the restrictions, so what’s the point?
    Swift'in erişim kontrolü anahtar sözcükleri, kodumuzun farklı bölümlerine nasıl erişilebileceğini kısıtlamamıza izin verir, ancak çoğu zaman sadece koyduğumuz kurallara itaat eder - istersek bunları kaldırabilir ve kısıtlamaları atlayabiliriz, öyleyse ne anlamı var?

    There are a few answers to that, but one is particularly easy so I’ll start there: sometimes access control is used in code you don’t own, so you can’t remove the restriction. This is common when you’re building apps with Apple’s APIs, for example: they place restrictions about what you can and cannot do, and you need to abide by those restrictions.
    Bunun birkaç cevabı var, ancak bir tanesi özellikle kolay, bu yüzden oradan başlayacağım: bazen erişim kontrolü sahip olmadığınız kodda kullanılır, bu nedenle kısıtlamayı kaldıramazsınız. Örneğin Apple'ın API'leriyle uygulama geliştirirken bu yaygındır: Yapabilecekleriniz ve yapamayacaklarınızla ilgili kısıtlamalar koyarlar ve bu kısıtlamalara uymanız gerekir.

    In your own code, yes of course you can remove any access control restrictions you put in place, but that doesn’t make it pointless. Access control lets us determine how a value should be used, so that if something needs to accessed very carefully then you must follow the rules.
    Kendi kodunuzda, evet elbette koyduğunuz herhangi bir erişim kontrolü kısıtlamasını kaldırabilirsiniz, ancak bu onu anlamsız kılmaz. Erişim kontrolü bir değerin nasıl kullanılması gerektiğini belirlememizi sağlar, böylece bir şeye çok dikkatli bir şekilde erişilmesi gerekiyorsa kurallara uymanız gerekir.

    Previously I’ve mentioned Unwrap, my Swift learning app, and I want to use another example from there. When users learn different parts of Swift, I store the name of the thing they learned in a private Set inside a User struct, declared like this:
    Daha önce Swift öğrenme uygulamam Unwrap'ten bahsetmiştim ve oradan başka bir örnek kullanmak istiyorum. Kullanıcılar Swift'in farklı bölümlerini öğrendiklerinde, öğrendikleri şeyin adını aşağıdaki gibi bildirilen bir User struct içindeki özel bir Set'te saklıyorum:
*/

private var learnedSections = Set<String>()

/**
 It’s private, which means no one can read or write to it directly. Instead, I provide public methods for reading or writing values that should be used instead. That’s intentional, because learning a section needs to do more than just insert a string into that set – it needs to update the user interface to reflect the change, and needs to save the new information so the app remembers it was learned.
 Özeldir, yani kimse doğrudan okuyamaz veya yazamaz. Bunun yerine, kullanılması gereken değerleri okumak veya yazmak için genel yöntemler sağlıyorum. Bu kasıtlı, çünkü bir bölümü öğrenmenin o kümeye bir dize eklemekten daha fazlasını yapması gerekiyor - değişikliği yansıtmak için kullanıcı arayüzünü güncellemesi ve uygulamanın öğrenildiğini hatırlaması için yeni bilgileri kaydetmesi gerekiyor.

 If I hadn’t made the learnedSections property private, it’s possible I might forget and write things to it directly. That would result in my UI being inconsistent with its data, and also not saving the change – bad all around!
 Eğer learnedSections özelliğini private yapmamış olsaydım, unutup doğrudan buraya bir şeyler yazabilirdim. Bu, kullanıcı arayüzümün verileriyle tutarsız olmasına ve ayrıca değişikliği kaydetmemesine neden olur - her yönden kötü!

 So, by using private here I’m asking Swift to enforce the rules for me: don’t let me read or write this property from anywhere outside the User struct.
 Yani, burada private kullanarak Swift'ten kuralları benim için uygulamasını istiyorum: bu özelliği User yapısının dışındaki herhangi bir yerden okumama veya yazmama izin vermeyin.

 One other advantage to access control is that it lets us control how other people see our code – known as its “surface area”. Think about it: if I gave you a struct to use and it had 30 public properties and methods, you might not be sure which ones are there for you to use and which ones are really just for internal use. On the other hand, if I mark 25 of those as private then it’s immediately clear that you shouldn’t be using them externally.
 Erişim kontrolünün bir diğer avantajı da başkalarının kodumuzu nasıl göreceğini kontrol etmemize olanak sağlamasıdır - kodun "yüzey alanı" olarak bilinir. Bir düşünün: size kullanmanız için bir struct versem ve bunun 30 public özelliği ve yöntemi olsa, hangilerinin kullanmanız için orada olduğundan ve hangilerinin gerçekten sadece dahili kullanım için olduğundan emin olamayabilirsiniz. Öte yandan, bunlardan 25 tanesini özel olarak işaretlersem, bunları harici olarak kullanmamanız gerektiği hemen anlaşılır.

 Access control can be quite a thorny issue, particularly when you take into account external code. So, it’s not a surprise Apple’s own documentation on it is quite long – you can find it here: https://docs.swift.org/swift-book/LanguageGuide/AccessControl.html
 Erişim denetimi, özellikle de harici kodları hesaba kattığınızda oldukça çetrefilli bir konu olabilir. Bu nedenle, Apple'ın bu konudaki kendi belgelerinin oldukça uzun olması şaşırtıcı değil - burada bulabilirsiniz: https://docs.swift.org/swift-book/LanguageGuide/AccessControl.html


 */
