import Cocoa

/// # When to use default parameters for functions
/// # İşlevler için varsayılan parametreler ne zaman kullanılır?

/**
 Default parameters let us make functions easier to call by letting us provide common defaults for parameters. So, when we want to call that function using those default values we can just ignore the parameters entirely – as if they didn’t exist – and our function will just do the right thing. Of course, when we want something custom it’s there for us to change.
 Varsayılan parametreler, parametreler için ortak varsayılanlar sağlamamıza izin vererek fonksiyonların çağrılmasını kolaylaştırır. Böylece, bu varsayılan değerleri kullanarak bu fonksiyonu çağırmak istediğimizde, parametreleri tamamen yok sayabiliriz - sanki hiç yoklarmış gibi - ve fonksiyonumuz doğru şeyi yapacaktır. Tabii ki, özel bir şey istediğimizde değiştirmemiz için oradadır.

 Swift developers use default parameters very commonly, because they let us focus on the important parts that do need to change regularly. This can really help simplify complex function, and make your code easier to write.
 Varsayılan parametreler, parametreler için ortak varsayılanlar sağlamamıza izin vererek fonksiyonların çağrılmasını kolaylaştırır. Böylece, bu varsayılan değerleri kullanarak bu fonksiyonu çağırmak istediğimizde, parametreleri tamamen yok sayabiliriz - sanki hiç yoklarmış gibi - ve fonksiyonumuz doğru şeyi yapacaktır. Tabii ki, özel bir şey istediğimizde değiştirmemiz için oradadır.
 */

/// Örneğin, aşağıdaki gibi bir rota bulma kodu hayal edin:
func findDirections(from: String, to: String, route: String = "fastest", avoidHighways: Bool = false) {
    // code here
}

/// Bu, insanların çoğu zaman iki konum arasında otoyollardan kaçınmadan en hızlı rotadan gitmek istediklerini varsayar - çoğu zaman işe yaraması muhtemel olan mantıklı varsayılanlar, gerektiğinde özel değerler sağlama kapsamını bize verir.
/// Sonuç olarak, aynı işlevi üç yoldan herhangi biriyle çağırabiliriz:

findDirections(from: "London", to: "Glasgow")
findDirections(from: "London", to: "Glasgow", route: "scenic")
findDirections(from: "London", to: "Glasgow", route: "scenic", avoidHighways: true)

/// Shorter, simpler code most of the time, but flexibility when we need it – perfect.
/// Çoğu zaman daha kısa, daha basit kod, ancak ihtiyaç duyduğumuzda esneklik - mükemmel.





