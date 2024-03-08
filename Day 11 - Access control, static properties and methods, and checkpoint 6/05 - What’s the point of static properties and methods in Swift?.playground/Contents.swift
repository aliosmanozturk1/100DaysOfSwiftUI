import Cocoa

/// # What’s the point of static properties and methods in Swift?
/// # Swift'te statik özelliklerin ve yöntemlerin amacı nedir?

/**
    Most people learning Swift immediately see the value of regular properties and methods, but struggle to understand why static properties and methods would be useful. It’s certainly true that they are less useful than regular properties and methods, but they are still fairly common in Swift code.
    Swift öğrenen çoğu kişi normal özelliklerin ve metotların değerini hemen anlar, ancak statik özelliklerin ve metotların neden yararlı olacağını anlamakta zorlanır. Normal özellik ve metotlara göre daha az kullanışlı oldukları kesinlikle doğrudur, ancak yine de Swift kodunda oldukça yaygındırlar.

    One common use for static properties and methods is to store common functionality you use across an entire app. For example, I make an app called Unwrap, which is a free iOS app for folks learning Swift. In the app I want to store some common information, such as the URL to the app on the App Store, so I can reference that anywhere the app needs it. So, I have code like this storing my data:
    Statik özellik ve metotların yaygın kullanım alanlarından biri, uygulamanın tamamında kullandığınız ortak işlevleri depolamaktır. Örneğin, Swift öğrenen kişiler için ücretsiz bir iOS uygulaması olan Unwrap adlı bir uygulama yapıyorum. Uygulamada, App Store'daki uygulamanın URL'si gibi bazı ortak bilgileri saklamak istiyorum, böylece uygulamanın ihtiyaç duyduğu her yerde buna başvurabilirim. Verilerimi saklayan şöyle bir kodum var:
*/

struct Unwrap {
    static let appURL = "https://itunes.apple.com/app/id1440611372"
}

/**
    That way I can write Unwrap.appURL when someone shares something from the app, which helps other folks discover the app. Without the static keyword I’d need to make a new instance of the Unwrap struct just to read the fixed app URL, which isn’t really necessary.
    Bu şekilde, birisi uygulamadan bir şey paylaştığında Unwrap.appURL yazabilirim, bu da diğer kişilerin uygulamayı keşfetmesine yardımcı olur. Statik anahtar kelime olmadan, sadece sabit uygulama URL'sini okumak için Unwrap yapısının yeni bir örneğini oluşturmam gerekirdi ki bu gerçekten gerekli değil.

    I also use both a static property and a static method to store some random entropy in the same struct, like this:
    Aynı yapıda bazı rastgele entropileri depolamak için hem statik bir özellik hem de statik bir metot kullanıyorum, bunun gibi:
*/

struct Unwrap2 {
    static var entropy = Int.random(in: 1...1000)

    static func getEntropy() -> Int {
        entropy += 1
        return entropy
    }
}

/**
    Random entropy is some randomness collected by software to make random number generation more effective, but I cheat a little in my app because I don’t want truly random data. The app is designed to give you various Swift tests in a random order, but if it were truly random then it’s likely you’d see the same question back to back sometimes. I don’t want that, so my entropy actually makes randomness less random so we get a fairer spread of questions. So, what my code does is store an entropy integer that starts off random, but increments by 1 every time getEntropy() is called.
    Rastgele entropi, rastgele sayı üretimini daha etkili hale getirmek için yazılım tarafından toplanan bazı rastgeleliklerdir, ancak uygulamamda biraz hile yapıyorum çünkü gerçekten rastgele veri istemiyorum. Uygulama size rastgele bir sırayla çeşitli Swift testleri vermek üzere tasarlanmıştır, ancak gerçekten rastgele olsaydı, bazen aynı soruyu arka arkaya görmeniz muhtemeldir. Ben bunu istemiyorum, bu yüzden entropim aslında rastgeleliği daha az rastgele hale getiriyor, böylece daha adil bir soru dağılımı elde ediyoruz. Kodumun yaptığı şey, rastgele başlayan ancak getEntropy() her çağrıldığında 1 artan bir entropi tamsayısı saklamaktır.

    This “fair random” entropy is used throughout the app so that duplicates won’t appear, so again they are shared statically by the Unwrap struct so everywhere can access them.
    Bu "adil rastgele" entropi, kopyaların görünmemesi için uygulama genelinde kullanılır, bu nedenle yine Unwrap yapısı tarafından statik olarak paylaşılırlar, böylece her yer onlara erişebilir.

    Before I move on, there are two more things I want to mention that might interest you.
    Devam etmeden önce, ilginizi çekebilecek iki şeyden daha bahsetmek istiyorum.

    First, my Unwrap struct doesn’t really need to be a struct at all – I could and in fact should declare it as an enum rather than a struct. This is because the enum doesn’t have any cases, so it’s a better choice than a struct here because I don’t ever want to create an instance of this type – there’s no reason to. Making an enum stops this from happening, which would help clarify my intent.
    İlk olarak, Unwrap struct'ımın aslında bir struct olmasına gerek yok - bunu bir struct yerine bir enum olarak bildirebilirim ve aslında bildirmeliyim. Bunun nedeni, enum'un herhangi bir durumu olmamasıdır, bu nedenle burada bir struct'tan daha iyi bir seçimdir çünkü bu türün bir örneğini oluşturmak istemiyorum - bunun için bir neden yok. Bir enum yapmak bunun olmasını engeller, bu da niyetimi netleştirmeye yardımcı olur.

    Second, because I have a dedicated getEntropy() method, I actually ask Swift to restrict access to the entropy so that I can’t access it from anywhere. This is called access control, and look like this in Swift:
    İkinci olarak, özel bir getEntropy() metodum olduğu için aslında Swift'ten entropiye erişimi kısıtlamasını istiyorum, böylece ona hiçbir yerden erişemiyorum. Buna erişim kontrolü denir ve Swift'te şöyle görünür:
*/

struct Unwrap3 {
    private static var entropy = Int.random(in: 1...1000)
}

/**
    We’ll be looking more at access control soon.
*/
