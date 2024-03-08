import Cocoa

/// # How to limit access to internal data using access control
/// # Erişim kontrolü kullanılarak dahili verilere erişim nasıl sınırlandırılır?

/**
    By default, Swift’s structs let us access their properties and methods freely, but often that isn’t what you want – sometimes you want to hide some data from external access. For example, maybe you have some logic you need to apply before touching your properties, or maybe you know that some methods need to be called in a certain way or order, and so shouldn’t be touched externally.
    Varsayılan olarak, Swift'in yapıları özelliklerine ve metotlarına serbestçe erişmemize izin verir, ancak genellikle istediğiniz bu değildir - bazen bazı verileri harici erişimden gizlemek istersiniz. Örneğin, belki özelliklerinize dokunmadan önce uygulamanız gereken bazı mantıklar vardır ya da bazı yöntemlerin belirli bir şekilde veya sırada çağrılması gerektiğini ve bu nedenle dışarıdan dokunulmaması gerektiğini biliyorsunuzdur.

    We can demonstrate the problem with an example struct:
    Sorunu örnek bir yapı ile gösterebiliriz:
*/

struct BankAccount {
    var funds = 0

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

/**
    Bir banka hesabına para yatırma ve hesaptan para çekme yöntemleri vardır ve bu şekilde kullanılmalıdır:
*/

var account = BankAccount()
account.deposit(amount: 100)
let success = account.withdraw(amount: 200)

if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}

/**
 But the funds property is just exposed to us externally, so what’s stopping us from touching it directly? The answer is nothing at all – this kind of code is allowed:
 Ancak funds özelliği bize dışarıdan gösteriliyor, peki bizi doğrudan ona dokunmaktan alıkoyan nedir? Cevap hiçbir şey değil - bu tür bir koda izin verilir:
*/

account.funds -= 1000

/**
    That completely bypasses the logic we put in place to stop people taking out more money than they have, and now our program could behave in weird ways.
    Bu, insanların sahip olduklarından daha fazla para çekmelerini önlemek için koyduğumuz mantığı tamamen atlar ve şimdi programımız garip şekillerde davranabilir.

    To solve this, we can tell Swift that funds should be accessible only inside the struct – by methods that belong to the struct, as well as any computed properties, property observers, and so on.
    Bunu çözmek için Swift'e fonların yalnızca struct içinde erişilebilir olması gerektiğini söyleyebiliriz - struct'a ait metotların yanı sıra hesaplanan özellikler, özellik gözlemleyicileri vb. tarafından.

    This takes only one extra word:
    Bu sadece fazladan bir kelime gerektirir:
*/

private var funds = 0

/**
    And now accessing funds from outside the struct isn’t possible, but it is possible inside both deposit() and withdraw(). If you try to read or write funds from outside the struct Swift will refuse to build your code.
    Ve şimdi struct’ın dışından funds'a erişmek mümkün değil, ancak hem deposit() hem de withdraw() içinde mümkün. Eğer struct dışından para okumaya veya yazmaya çalışırsanız Swift kodunuzu oluşturmayı reddedecektir.

    This is called access control, because it controls how a struct’s properties and methods can be accessed from outside the struct.
    Buna erişim kontrolü denir, çünkü bir struct'ın özelliklerine ve yöntemlerine struct dışından nasıl erişilebileceğini kontrol eder.

    Swift provides us with several options, but when you’re learning you’ll only need a handful:
    Swift bize birçok seçenek sunar, ancak öğrenirken yalnızca birkaçına ihtiyacınız olacaktır:

    - Use private for “don’t let anything outside the struct use this.”
    - "Yapının dışında hiçbir şeyin bunu kullanmasına izin verme" için private kullanın.

    - Use fileprivate for “don’t let anything outside the current file use this.”
    - "Geçerli dosya dışında hiçbir şeyin bunu kullanmasına izin verme" için fileprivate kullanın

    - Use public for “let anyone, anywhere use this.”
    - "Herkesin, her yerde bunu kullanmasına izin verin" için herkese açık kullanın.

    There’s one extra option that is sometimes useful for learners, which is this: private(set). This means “let anyone read this property, but only let my methods write it.” If we had used that with BankAccount, it would mean we could print account.funds outside of the struct, but only deposit() and withdraw() could actually change the value.
    Öğrenenler için bazen yararlı olan ekstra bir seçenek daha vardır, o da şudur: private(set). Bu, "bu özelliği herkesin okumasına izin ver, ancak yalnızca benim metotlarımın yazmasına izin ver" anlamına gelir. Bunu BankAccount ile kullanmış olsaydık, account.funds'u struct'un dışında yazdırabileceğimiz anlamına gelirdi, ancak yalnızca deposit() ve withdraw() değeri gerçekten değiştirebilirdi.

    In this case, I think private(set) is the best choice for funds: you can read the current bank account balance at any time, but you can’t change it without running through my logic.
    Bu durumda, private(set)'in funds için en iyi seçim olduğunu düşünüyorum: mevcut banka hesabı bakiyesini istediğiniz zaman okuyabilirsiniz, ancak mantığımdan geçmeden değiştiremezsiniz.

    If you think about it, access control is really about limiting what you and other developers on your team are able to do – and that’s sensible! If we can make Swift itself stop us from making mistakes, that’s always a smart move.
    Eğer düşünürseniz, erişim kontrolü aslında sizin ve ekibinizdeki diğer geliştiricilerin yapabileceklerini sınırlamakla ilgilidir - ve bu mantıklıdır! Swift'in kendisinin hata yapmamızı engellemesini sağlayabilirsek, bu her zaman akıllıca bir hareket olur.

    Important: If you use private access control for one or more properties, chances are you’ll need to create your own initializer.
    Önemli: Bir veya daha fazla özellik için özel erişim kontrolü kullanıyorsanız, büyük olasılıkla kendi başlatıcınızı oluşturmanız gerekecektir.
*/
