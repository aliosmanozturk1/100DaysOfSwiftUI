import Cocoa

/// # How to handle errors in functions
/// # Fonksiyonlardaki hatalar nasıl ele alınır

///

/**
    Okumak istediğiniz dosyanın mevcut olmaması veya indirmeye çalıştığınız verinin ağ çöktüğü için başarısız olması gibi işler her zaman ters gider. Hataları zarif bir şekilde ele almazsak kodumuz çöker, bu nedenle Swift hataları ele almamızı veya en azından ne zaman olabileceğini kabul etmemizi sağlar.
 
    Bu üç adımdan oluşur:
        - Telling Swift about the possible errors that can happen.
        - Swift'e meydana gelebilecek olası hatalar hakkında bilgi vermek.
 
        - Writing a function that can flag up errors if they happen.
        - Hata oluştuğunda bunu işaretleyebilecek bir fonksiyon yazmak.
 
        - Calling that function, and handling any errors that might happen.
        - Bu işlevin çağrılması ve oluşabilecek hataların ele alınması.
 */

/// Tam bir örnek üzerinde çalışalım: Kullanıcı bizden şifresinin ne kadar güçlü olduğunu kontrol etmemizi isterse, şifre çok kısaysa veya açıksa ciddi bir hatayı işaretleyeceğiz.
/// Bu nedenle, meydana gelebilecek olası hataları tanımlayarak başlamamız gerekir. Bu, Swift'in mevcut Error türünü temel alan yeni bir enum oluşturmak anlamına gelir:

enum PasswordError: Error {
    case short, obvious
}

/// Bu, parola ile ilgili iki olası hata olduğunu söylüyor: kısa ve açık. Bunların ne anlama geldiğini tanımlamıyor, sadece var olduklarını söylüyor.

/// Step two is to write a function that will trigger one of those errors. When an error is triggered – or thrown in Swift – we’re saying something fatal went wrong with the function, and instead of continuing as normal it immediately terminates without sending back any value.
/// İkinci adım, bu hatalardan birini tetikleyecek bir fonksiyon yazmaktır. Bir hata tetiklendiğinde - ya da Swift'te fırlatıldığında - fonksiyonda ölümcül bir şeylerin yanlış gittiğini ve normal şekilde devam etmek yerine herhangi bir değer göndermeden hemen sonlandığını söylüyoruz.

/// In our case, we’re going to write a function that checks the strength of a password: if it’s really bad – fewer than 5 characters or is extremely well known – then we’ll throw an error immediately, but for all other strings we’ll return either “OK”, “Good”, or “Excellent” ratings.
/// Bizim durumumuzda, bir parolanın gücünü kontrol eden bir fonksiyon yazacağız: eğer gerçekten kötüyse - 5 karakterden az veya son derece iyi biliniyorsa - o zaman hemen bir hata vereceğiz, ancak diğer tüm string'ler için "Tamam", "İyi" veya "Mükemmel" derecelendirmelerini döndüreceğiz.

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }

    if password == "12345" {
        throw PasswordError.obvious
    }

    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

/**
    Bunu biraz açalım:
    - If a function is able to throw errors without handling them itself, you must mark the function as throws before the return type.
    - Eğer bir fonksiyon kendisi işlem yapmadan hata atabiliyorsa, dönüş tipinden önce fonksiyonu throws olarak işaretlemeniz gerekir.
 
    - We don’t specify exactly what kind of error is thrown by the function, just that it can throw errors.
    - Fonksiyon tarafından tam olarak ne tür bir hata atılacağını belirtmeyiz, sadece hata atabileceğini belirtiriz.
 
    - Being marked with throws does not mean the function must throw errors, only that it might.
    - "Throws" ile işaretlenmiş olması, fonksiyonun hata vermesi gerektiği anlamına gelmez, sadece hata verebileceği anlamına gelir.
 
    - When it comes time to throw an error, we write throw followed by one of our PasswordError cases. This immediately exits the function, meaning that it won’t return a string.
    - Bir hata atma zamanı geldiğinde, throw ve ardından PasswordError durumlarımızdan birini yazıyoruz. Bu, fonksiyondan hemen çıkılmasını sağlar, yani bir string döndürmez.
 
    - If no errors are thrown, the function must behave like normal – it needs to return a string.
    - Herhangi bir hata atılmazsa, fonksiyon normal şekilde davranmalıdır - bir string döndürmesi gerekir.
 
 */

/**
    That completes the second step of throwing errors: we defined the errors that might happen, then wrote a function using those errors.
    Bu, hata atmanın ikinci adımını tamamlar: meydana gelebilecek hataları tanımladık, ardından bu hataları kullanan bir işlev yazdık.

    The final step is to run the function and handle any errors that might happen. Swift Playgrounds are pretty lax about error handling because they are mostly meant for learning, but when it comes to working with real Swift projects you’ll find there are three steps:
    Son adım ise fonksiyonu çalıştırmak ve oluşabilecek hataları ele almaktır. Swift Playgrounds, çoğunlukla öğrenme amaçlı olduğu için hata işleme konusunda oldukça gevşektir, ancak gerçek Swift projeleriyle çalışmak söz konusu olduğunda üç adım olduğunu göreceksiniz:
        
    - Starting a block of work that might throw errors, using do.
    - do kullanarak hata fırlatabilecek bir iş bloğu başlatma.
 
    - Calling one or more throwing functions, using try.
    - try kullanarak bir veya daha fazla fırlatma fonksiyonunu çağırma.
 
    - Handling any thrown errors using catch.
    - catch kullanarak fırlatılan hataları işleme.
 */

/**
    Sözde kod olarak şöyle görünür:
    do {
        try someRiskyWork()
    } catch {
        print("Handle errors here")
    }
*/

/// Eğer mevcut checkPassword() fonksiyonumuzu kullanarak bunu denemek isteseydik, şunu yazabilirdik:

let string = "12345"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch {
    print("There was an error.")
}

/**
    If the checkPassword() function works correctly, it will return a value into result, which is then printed out. But if any errors are thrown (which in this case there will be), the password rating message will never be printed – execution will immediately jump to the catch block.
    checkPassword() işlevi doğru çalışırsa, result içine bir değer döndürür ve bu değer yazdırılır. Ancak herhangi bir hata oluşursa (ki bu durumda oluşacaktır), parola değerlendirme mesajı asla yazdırılmayacaktır - yürütme hemen catch bloğuna atlayacaktır.

    There are a few different parts of that code that deserve discussion, but I want to focus on the most important one: try. This must be written before calling all functions that might throw errors, and is a visual signal to developers that regular code execution will be interrupted if an error happens.
    Bu kodun tartışılmayı hak eden birkaç farklı bölümü var, ancak ben en önemlisine odaklanmak istiyorum: try. Bu kod, hata verebilecek tüm fonksiyonlar çağrılmadan önce yazılmalıdır ve geliştiricilere, bir hata oluşması durumunda normal kod yürütmesinin kesintiye uğrayacağına dair görsel bir işarettir.

    When you use try, you need to be inside a do block, and make sure you have one or more catch blocks able to handle any errors. In some circumstances you can use an alternative written as try! which does not require do and catch, but will crash your code if an error is thrown – you should use this rarely, and only if you’re absolutely sure an error cannot be thrown.
    try kullandığınızda, bir do bloğunun içinde olmanız ve herhangi bir hatayı ele alabilecek bir veya daha fazla catch bloğuna sahip olduğunuzdan emin olmanız gerekir. Bazı durumlarda, do ve catch gerektirmeyen, ancak bir hata atılırsa kodunuzu çökertecek olan try! şeklinde yazılmış bir alternatif kullanabilirsiniz - bunu nadiren ve yalnızca bir hata atılamayacağından kesinlikle eminseniz kullanmalısınız.

    When it comes to catching errors, you must always have a catch block that is able to handle every kind of error. However, you can also catch specific errors as well, if you want:
    Hataları yakalamak söz konusu olduğunda, her zaman her tür hatayı ele alabilecek bir catch bloğuna sahip olmalısınız. Ancak, isterseniz belirli hataları da yakalayabilirsiniz:
*/

let string2 = "12345"

do {
    let result = try checkPassword(string2)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error.")
}

/**
    As you progress you’ll see how throwing functions are baked into many of Apple’s own frameworks, so even though you might not create them yourself much you will at least need to know how to use them safely.
    İlerledikçe, fırlatma işlevlerinin Apple'ın kendi çerçevelerinin çoğunda nasıl yer aldığını göreceksiniz, bu nedenle bunları kendiniz oluşturmasanız bile en azından nasıl güvenli bir şekilde kullanacağınızı bilmeniz gerekecektir.

    Tip: Most errors thrown by Apple provide a meaningful message that you can present to your user if needed. Swift makes this available using an error value that’s automatically provided inside your catch block, and it’s common to read error.localizedDescription to see exactly what happened.
    İpucu: Apple tarafından atılan çoğu hata, gerektiğinde kullanıcınıza sunabileceğiniz anlamlı bir mesaj sağlar. Swift, catch bloğunuzun içinde otomatik olarak sağlanan bir hata değeri kullanarak bunu kullanılabilir hale getirir ve tam olarak ne olduğunu görmek için error.localizedDescription dosyasını okumak yaygındır.
 */
