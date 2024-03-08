import Cocoa

/// # When should you use optional try?

/**
    We can run throwing functions using do, try, and catch in Swift, but an alternative is to use try? to convert a throwing function call into an optional. If the function succeeds, its return value will be an optional containing whatever you would normally have received back, and if it fails the return value will be an optional set to nil.
    Swift'te do, try ve catch kullanarak fırlatan fonksiyonları çalıştırabiliriz, ancak bir alternatif de fırlatan bir fonksiyon çağrısını bir opsiyona dönüştürmek için try? kullanmaktır. Fonksiyon başarılı olursa, geri dönüş değeri normalde geri alacağınız şeyi içeren bir optional olacaktır ve başarısız olursa, geri dönüş değeri nil olarak ayarlanmış bir optional olacaktır.

    There are advantages and disadvantages to using optional try, but it mostly centers around how important the error is to you. If you want to run a function and care only that it succeeds or fails – you don’t need to distinguish between the various reasons why it might fail – then using optional try is a great fit, because you can boil the whole thing down to “did it work?”
    Optional try kullanmanın avantajları ve dezavantajları vardır, ancak çoğunlukla hatanın sizin için ne kadar önemli olduğuna odaklanır. Bir fonksiyonu çalıştırmak istiyorsanız ve sadece başarılı ya da başarısız olmasını önemsiyorsanız - başarısız olmasının çeşitli nedenleri arasında ayrım yapmanız gerekmiyorsa - o zaman optional try kullanmak harika bir seçimdir, çünkü her şeyi "çalıştı mı?" sorusuna indirgeyebilirsiniz.

    So, rather than writing this:
    Yani, bunu yazmak yerine:
*/

do {
    let result = try runRiskyFunction()
    print(result)
} catch {
    // it failed!
}

/**
    You can instead write this:
    Bunun yerine şunu yazabilirsiniz:
*/

if let result = try? runRiskyFunction() {
    print(result)
}

/**
    If that’s what you wanted to do then you could just make runRiskyFunction() return an optional rather than throwing an error, but throwing and using optional try does give us the flexibility to change our mind later. That is, if we write a function that throws errors then at the call site we can either use try/catch or use optional try based on what we need at that point.
    Eğer yapmak istediğiniz buysa, runRiskyFunction() fonksiyonunun hata vermek yerine bir opsiyonel döndürmesini sağlayabilirsiniz, ancak hata vermek ve opsiyonel try kullanmak bize daha sonra fikrimizi değiştirme esnekliği sağlar. Yani, hata veren bir fonksiyon yazarsak, çağrı yerinde o anda neye ihtiyacımız olduğuna bağlı olarak try/catch ya da isteğe bağlı try kullanabiliriz.

    For what it’s worth, I use optional try a heck of a lot in my own code, because it does wonders for letting me focus on the problem at hand.
    Ne olursa olsun, kendi kodumda optional try'ı çok kullanıyorum, çünkü elimdeki soruna odaklanmamı sağlamak için harikalar yaratıyor.
*/
