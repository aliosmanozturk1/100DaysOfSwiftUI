import Cocoa

/// # How to handle function failure with optionals

/**
    When we call a function that might throw errors, we either call it using try and handle errors appropriately, or if we’re certain the function will not fail we use try! and accept that if we were wrong our code will crash. (Spoiler: you should use try! very rarely.)
    Hata verebilecek bir fonksiyon çağırdığımızda, ya try kullanarak çağırırız ve hataları uygun şekilde ele alırız ya da fonksiyonun başarısız olmayacağından eminsek try! kullanırız ve eğer yanılıyorsak kodumuzun çökeceğini kabul ederiz. (Spoiler: try!'yi çok nadir kullanmalısınız.)

    However, there is an alternative: if all we care about is whether the function succeeded or failed, we can use an optional try to have the function return an optional value. If the function ran without throwing any errors then the optional will contain the return value, but if any error was thrown the function will return nil. This means we don’t get to know exactly what error was thrown, but often that’s fine – we might just care if the function worked or not.
    Bununla birlikte, bir alternatif daha vardır: tek önemsediğimiz fonksiyonun başarılı ya da başarısız olmasıysa, fonksiyonun isteğe bağlı bir değer döndürmesini sağlamak için isteğe bağlı bir try kullanabiliriz. Fonksiyon herhangi bir hata vermeden çalıştıysa, isteğe bağlı değer geri dönüş değerini içerecektir, ancak herhangi bir hata verildiyse fonksiyon nil değeri döndürecektir. Bu, tam olarak hangi hatanın atıldığını bilemeyeceğimiz anlamına gelir, ancak genellikle bu sorun değildir - sadece fonksiyonun çalışıp çalışmadığını önemseyebiliriz.

    Here’s how it looks:
    İşte böyle görünüyor:
*/

enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}

/**
    The getUser() function will always throw a networkFailed error, which is fine for our testing purposes, but we don’t actually care what error was thrown – all we care about is whether the call sent back a user or not.
    getUser() işlevi her zaman bir networkFailed hatası atacaktır, bu da test amaçlarımız için iyidir, ancak aslında hangi hatanın atıldığı umurumuzda değil - tek önemsediğimiz çağrının bir kullanıcıyı geri gönderip göndermediğidir.

    This is where try? helps: it makes getUser() return an optional string, which will be nil if any errors are thrown. If you want to know exactly what error happened then this approach won’t be useful, but a lot of the time we just don’t care.
    Burada try? yardımcı olur: getUser() işlevinin optional bir string döndürmesini sağlar, bu string herhangi bir hata atılırsa nil olacaktır. Tam olarak hangi hatanın olduğunu bilmek istiyorsanız, bu yaklaşım yararlı olmayacaktır, ancak çoğu zaman umursamayız.

    If you want, you can combine try? with nil coalescing, which means “attempt to get the return value from this function, but if it fails use this default value instead.”
    İsterseniz, try? ile nil coalescing'i birleştirebilirsiniz, bu da "bu fonksiyondan geri dönüş değerini almaya çalışın, ancak başarısız olursa bunun yerine bu varsayılan değeri kullanın" anlamına gelir.

    Be careful, though: you need to add some parentheses before nil coalescing so that Swift understands exactly what you mean. For example, you’d write this:
    Yine de dikkatli olun: Swift'in tam olarak ne demek istediğinizi anlaması için nil birleştirmeden önce bazı parantezler eklemeniz gerekir. Örneğin, şunu yazabilirsiniz:
 */

let user = (try? getUser(id: 23)) ?? "Anonymous"
print(user)

/**
    You’ll find try? is mainly used in three places:
    Try? ifadesinin başlıca üç yerde kullanıldığını göreceksiniz:
    - In combination with guard let to exit the current function if the try? call returns nil.
    - try? çağrısı nil döndürürse geçerli işlevden çıkmak için guard let ile birlikte.

    - In combination with nil coalescing to attempt something or provide a default value on failure.
    - Bir şey denemek veya başarısızlık durumunda varsayılan bir değer sağlamak için nil birleştirme ile birlikte.

    - When calling any throwing function without a return value, when you genuinely don’t care if it succeeded or not – maybe you’re writing to a log file or sending analytics to a server, for example.
    - Dönüş değeri olmayan herhangi bir fırlatma işlevini çağırırken, başarılı olup olmamasını gerçekten önemsemediğinizde - örneğin bir günlük dosyasına yazıyor veya bir sunucuya analiz gönderiyor olabilirsiniz.
*/
