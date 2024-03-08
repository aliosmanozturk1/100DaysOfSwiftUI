import Cocoa

/// # How to handle multiple optionals using optional chaining

/**
    Optional chaining is a simplified syntax for reading optionals inside optionals. That might sound like something you’d want to use rarely, but if I show you an example you’ll see why it’s helpful.
    Opsiyonel zincirleme, opsiyonellerin içindeki opsiyonelleri okumak için basitleştirilmiş bir sözdizimidir. Bu, nadiren kullanmak isteyeceğiniz bir şey gibi gelebilir, ancak size bir örnek gösterirsem neden yararlı olduğunu göreceksiniz.

    Take a look at this code:
    Şu koda bir bakın:
 */

let names = ["Arya", "Bran", "Robb", "Sansa"]

let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")

/**
    That uses two optional features at once: you’ve already seen how the nil coalescing operator helps provide a default value if an optional is empty, but before that you see optional chaining where we have a question mark followed by more code.
    Bu, iki opsiyonel özelliği aynı anda kullanır: nil birleştirme operatörünün bir opsiyonel boşsa varsayılan bir değer sağlamaya nasıl yardımcı olduğunu zaten gördünüz, ancak bundan önce bir soru işaretinin ardından daha fazla kodun geldiği opsiyonel zincirlemeyi gördünüz.

    Optional chaining allows us to say “if the optional has a value inside, unwrap it then…” and we can add more code. In our case we’re saying “if we managed to get a random element from the array, then uppercase it.” Remember, randomElement() returns an optional because the array might be empty.
    Opsiyonel zincirleme, "opsiyonel içinde bir değer varsa, onu aç ve sonra..." dememizi sağlar ve daha fazla kod ekleyebiliriz. Bizim durumumuzda "eğer diziden rastgele bir eleman almayı başardıysak, o zaman onu büyük harfle yaz" diyoruz. Unutmayın, randomElement() bir opsiyonel döndürür çünkü dizi boş olabilir.

    The magic of optional chaining is that it silently does nothing if the optional was empty – it will just send back the same optional you had before, still empty. This means the return value of an optional chain is always an optional, which is why we still need nil coalescing to provide a default value.
    Opsiyonel zincirlemenin sihri, opsiyonel boşsa sessizce hiçbir şey yapmamasıdır - sadece daha önce sahip olduğunuz aynı opsiyoneli, hala boş olarak geri gönderecektir. Bu, isteğe bağlı bir zincirin dönüş değerinin her zaman bir isteğe bağlı olduğu anlamına gelir, bu nedenle varsayılan bir değer sağlamak için hala nil birleştirmeye ihtiyacımız vardır.

    Optional chains can go as long as you want, and as soon as any part sends back nil the rest of the line of code is ignored and sends back nil.
    Optional zincirleri istediğiniz kadar uzun olabilir ve herhangi bir bölüm nil değerini geri gönderdiğinde kod satırının geri kalanı yok sayılır ve nil değerini geri gönderir.

    To give you an example that pushes optional chaining harder, imagine this: we want to place books in alphabetical order based on their author names. If we break this right down, then:
    Optional zincirlemeyi zorlayan bir örnek vermek gerekirse, şunu hayal edin: kitapları yazar adlarına göre alfabetik sıraya yerleştirmek istiyoruz. Eğer bunu tam olarak çözersek, o zaman:
    - We have an optional instance of a Book struct – we might have a book to sort, or we might not.
    - Bir Book yapısının opsiyonel bir örneğine sahibiz - sıralanacak bir kitabımız olabilir ya da olmayabilir.

    - The book might have an author, or might be anonymous.
    - Kitabın bir yazarı olabilir ya da anonim olabilir.

    - If it does have an author string present, it might be an empty string or have text, so we can’t always rely on the first letter being there.
    - Yazar string'i mevcutsa, boş bir dize olabilir veya metin içerebilir, bu nedenle her zaman ilk harfin orada olduğuna güvenemeyiz.

    - If the first letter is there, make sure it’s uppercase so that authors with lowercase names such as bell hooks are sorted correctly.
    - İlk harf varsa, büyük harf olduğundan emin olun, böylece bell hooks gibi küçük harfli isimleri olan yazarlar doğru şekilde sıralanır.

    Here’s how that would look:
    İşte böyle görünecek:
*/

struct Book {
    let title: String
    let author: String?
}

var book: Book? = nil
let author = book?.author?.first?.uppercased() ?? "A"
print(author)

/**
    So, it reads “if we have a book, and the book has an author, and the author has a first letter, then uppercase it and send it back, otherwise send back A”.
    Yani, "eğer elimizde bir kitap varsa, kitabın bir yazarı varsa ve yazarın bir ilk harfi varsa, o zaman büyük harfle yaz ve geri gönder, aksi takdirde A'yı geri gönder".

    Admittedly it’s unlikely you’ll ever dig that far through optionals, but I hope you can see how delightfully short the syntax is!
    Kuşkusuz, seçenekler arasında bu kadar ilerlemeniz pek olası değil, ancak sözdiziminin ne kadar keyifli bir şekilde kısa olduğunu görebileceğinizi umuyorum!
*/


