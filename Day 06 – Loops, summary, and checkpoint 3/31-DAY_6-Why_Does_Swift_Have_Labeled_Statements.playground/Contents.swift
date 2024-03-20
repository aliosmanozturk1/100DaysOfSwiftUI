import Cocoa

/// # Why does Swift have labeled statements?
/// # Swift'in neden etiketli ifadeleri var?

/// Swift’s labeled statements allow us to name certain parts of our code, and it’s most commonly used for breaking out of nested loops.
/// Swift'in etiketli ifadeleri, kodumuzun belirli bölümlerini adlandırmamıza olanak tanır ve en yaygın olarak iç içe geçmiş döngülerden çıkmak için kullanılır.

/// To demonstrate them, let’s look at an example where we’re trying to figure out the correct combination of movements to unlock a safe. We might start by defining an array of all possible movements:
/// Bunları göstermek için, bir kasanın kilidini açmak için doğru hareket kombinasyonunu bulmaya çalıştığımız bir örneğe bakalım. Tüm olası hareketlerin bir dizisini tanımlayarak başlayabiliriz:

let options = ["up", "down", "left", "right"]

/// Test amacıyla, işte tahmin etmeye çalıştığımız gizli kombinasyon:
let secretCombination = ["up", "up", "right"]


/// Bunu gerçekleştirmek için, aşağıdaki gibi biri diğerinin içine yerleştirilmiş üç döngü yazabiliriz:
for option1 in options {
    for option2 in options {
        for option3 in options {
            print("In loop")
            let attempt = [option1, option2, option3]

            if attempt == secretCombination {
                print("The combination is \(attempt)!")
            }
        }
    }
}
/// That goes over the same items multiple times to create an attempt array, and prints out a message if its attempt matches the secret combination.
/// Bu, bir deneme dizisi oluşturmak için aynı öğelerin üzerinden birden çok kez geçer ve denemesi gizli kombinasyonla eşleşirse bir mesaj yazdırır.

/// But that code has a problem: as soon as we find the combination we’re done with the loops, so why do they carry on running? What we really want to say is “as soon as the combination is found, exit all the loops at once” – and that’s where labeled statements come in. They let us write this:
/// Ancak bu kodun bir sorunu var: kombinasyonu bulduğumuz anda döngülerle işimiz bitiyor, öyleyse neden çalışmaya devam ediyorlar? Aslında söylemek istediğimiz şey "kombinasyon bulunur bulunmaz, tüm döngülerden bir kerede çık" - ve işte burada etiketli ifadeler devreye giriyor. Bunu yazmamıza izin verirler:

outerLoop: for option1 in options {
    for option2 in options {
        for option3 in options {
            print("In loop")
            let attempt = [option1, option2, option3]

            if attempt == secretCombination {
                print("The combination is \(attempt)!")
                break outerLoop
            }
        }
    }
}
/// Bu küçük değişiklikle, kombinasyon bulunur bulunmaz bu üç döngü çalışmayı durdurur. Bu önemsiz durumda bir performans farkı yaratması pek olası değildir, ancak öğeleriniz yüzlerce hatta binlerce öğeye sahipse ne olur? Bu gibi işleri kaydetmek iyi bir fikirdir ve kendi kodunuz için hatırlamaya değer.

