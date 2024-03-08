import Cocoa

/// # Why does Swift have trailing closure syntax?
/// # Swift'te neden sonda closure sözdizimi var?

/**
    Trailing closure syntax is designed to make Swift code easier to read, although some prefer to avoid it.
    Bazıları bundan kaçınmayı tercih etse de, sondaki closure sözdizimi Swift kodunun okunmasını kolaylaştırmak için tasarlanmıştır.



    Let’s start with a simple example first. Here’s a function that accepts a Double then a closure full of changes to make:
    Önce basit bir örnekle başlayalım. Burada bir Double ve ardından yapılacak değişikliklerle dolu bir closure kabul eden bir fonksiyon var:
*/

func animate(duration: Double, animations: () -> Void) {
    print("Starting a \(duration) second animation…")
    animations()
}

/**
    (In case you were wondering, that’s a simplified version of a real and very common UIKit function!)
    (Merak ediyorsanız, bu gerçek ve çok yaygın bir UIKit fonksiyonunun basitleştirilmiş bir versiyonudur!)

    We can call that function without a trailing closure like this:
    Bu fonksiyonu aşağıdaki gibi sonda bir kapanış olmadan çağırabiliriz:
*/

animate(duration: 3, animations: {
    print("Fade out the image")
})

/**
    That’s very common. Many people don’t use trailing closures, and that’s OK. But many more Swift developers look at the }) at the end and wince a little – it isn’t pleasant.
    Bu çok yaygındır. Birçok kişi sondaki closure'ları kullanmaz ve bu sorun değildir. Ancak çok daha fazla Swift geliştiricisi sondaki })'ye bakar ve biraz irkilir - bu hoş değildir.

    Trailing closures allow us to clean that up, while also removing the animations parameter label. That same function call becomes this:
    Sondaki closure'lar bunu temizlememizi sağlarken, animations parametre etiketini de kaldırır. Aynı fonksiyon çağrısı şu hale gelir:
*/

animate(duration: 3) {
    print("Fade out the image")
}

/**
    Trailing closures work best when their meaning is directly attached to the name of the function – you can see what the closure is doing because the function is called animate().
    Sondaki closure'lar, anlamları doğrudan fonksiyonun adına bağlı olduğunda en iyi şekilde çalışır - closure'ın ne yaptığını görebilirsiniz çünkü fonksiyonun adı animate()'dir.

    If you’re not sure whether to use trailing closures or not, my advice is to start using them everywhere. Once you’ve given them a month or two you’ll have enough usage to look back and decide more clearly, but hopefully you get used to them because they are really common in Swift!
    Sondaki closure'ları kullanıp kullanmayacağınızdan emin değilseniz, tavsiyem onları her yerde kullanmaya başlamanızdır. Bir ya da iki ay kullandıktan sonra geriye dönüp daha net karar vermek için yeterli kullanım süresine sahip olacaksınız, ancak umarım onlara alışırsınız çünkü Swift'te gerçekten çok yaygınlar!
*/
