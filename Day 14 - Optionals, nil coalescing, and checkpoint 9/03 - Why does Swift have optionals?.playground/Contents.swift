import Cocoa

/// # Why does Swift have optionals?

/**
    Swift’s optionals are one of its most powerful features, while also being one of the most confusing. Their core job is simple: they allow us to represent the absence of some data – a string that isn’t just empty, but literally doesn’t exist.
    Swift'in opsiyonelleri en güçlü özelliklerinden biri olmakla birlikte aynı zamanda en kafa karıştırıcı özelliklerinden biridir. Temel görevleri basittir: bazı verilerin yokluğunu temsil etmemize izin verirler - sadece boş değil, kelimenin tam anlamıyla var olmayan bir dize.

    Any data type can be optional in Swift:
    Swift'te herhangi bir veri türü optional olabilir:
    - An integer might be 0, -1, 500, or any other range of numbers.
    - Bir tamsayı 0, -1, 500 veya başka herhangi bir sayı aralığı olabilir.

    - An optional integer might be all the regular integer values, but also might be nil – it might not exist.
    - Opsiyonel bir tamsayı, tüm normal tamsayı değerleri olabileceği gibi nil de olabilir - mevcut olmayabilir.

    - A string might be “Hello”, it might be the complete works of Shakespeare, or it might be “” – an empty string.
    - Bir dize "Merhaba" olabilir, Shakespeare'in tüm eserleri olabilir veya boş bir dize olan "" olabilir.

    - An optional string might be any regular string value, but also might be nil.
    - Optional bir string herhangi bir normal string değeri olabileceği gibi nil de olabilir.

    - A custom User struct could contain all sorts of properties that describe a user.
    - Özel bir Kullanıcı yapısı, bir kullanıcıyı tanımlayan her türlü özelliği içerebilir.

    - An optional User struct could contain all those same properties, or not exist at all.
    - Opsiyonel bir Kullanıcı yapısı tüm bu aynı özellikleri içerebilir veya hiç bulunmayabilir.

    Making that distinction between “it could be any possible value for that type” and “it could be nil” is the key to understanding optionals, and it’s not easy sometimes.
    "Bu tür için herhangi bir olası değer olabilir" ile "nil olabilir" arasındaki ayrımı yapmak opsiyonelleri anlamanın anahtarıdır ve bazen kolay değildir.

    For example, think about Booleans: they can be true or false. That means an optional Bool can be true, false, or neither – it can be nothing at all. That’s a little hard to grasp mentally, because surely something is always true or false at any given time?
    Örneğin, Boolean'ları düşünün: doğru veya yanlış olabilirler. Bu, opsiyonel bir Bool'un doğru, yanlış veya hiçbiri olabileceği anlamına gelir - hiçbir şey olmayabilir. Bunu zihinsel olarak kavramak biraz zordur, çünkü herhangi bir zamanda bir şey her zaman doğru veya yanlıştır?

    Well, answer me this: do I like chocolate? Unless you’re a friend of mine or perhaps follow me very closely on Twitter, you can’t say for sure – you can’t definitely say True (I like chocolate) or False (I don’t like chocolate), because you just don’t know. Sure, you could ask me and find out, but until you do so the only safe answer is “I don’t know”, which in this case could be represented by making the Boolean an optional with a nil value.
    Peki, bana şu sorunun cevabını verin: Çikolatayı sever miyim? Arkadaşım değilseniz ya da beni Twitter'da çok yakından takip etmiyorsanız, kesin olarak söyleyemezsiniz - kesinlikle Doğru (çikolata severim) ya da Yanlış (çikolata sevmem) diyemezsiniz, çünkü bilmiyorsunuz. Elbette, bana sorabilir ve öğrenebilirsiniz, ancak bunu yapana kadar tek güvenli cevap "Bilmiyorum" olacaktır, bu durumda Boolean'ı nil değerine sahip bir isteğe bağlı yaparak temsil edilebilir.

    This is also a bit confusing when you think about empty strings, “”. That string contains nothing, but that isn’t the same thing as nil – an empty string is still a string.
    Boş string'leri düşündüğünüzde de bu biraz kafa karıştırıcıdır, "". Bu string hiçbir şey içermez, ancak bu nil ile aynı şey değildir - boş bir string hala bir stringtir.

    When you’re learning, optionals can feel really painful – you might think Swift doesn’t need them, you might think they just get in the way, and you might grind your teeth every time you have to use them. But please trust me on this: after a few months they will make perfect sense, and you’ll wonder how you survived without them!
    Öğrenirken, opsiyonlar gerçekten acı verici gelebilir - Swift'in onlara ihtiyacı olmadığını düşünebilirsiniz, sadece yolunuza çıktıklarını düşünebilirsiniz ve onları her kullanmak zorunda kaldığınızda dişlerinizi gıcırdatabilirsiniz. Ama lütfen bu konuda bana güvenin: birkaç ay sonra mükemmel bir anlam ifade edecekler ve onlar olmadan nasıl hayatta kaldığınızı merak edeceksiniz!

    For another perspective on optionals, check out this video from Brian Voong: https://www.youtube.com/watch?v=7a7As0uNWOQ
    Opsiyonlar hakkında başka bir bakış açısı için Brian Voong'un şu videosuna göz atın:
*/
