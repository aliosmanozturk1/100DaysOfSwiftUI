import Cocoa

/// # How to create and use extensions

/**
    Extensions let us add functionality to any type, whether we created it or someone else created it – even one of Apple’s own types.
    Uzantılar, ister biz yaratmış olalım ister başkası, hatta Apple'ın kendi türlerinden biri olsun, herhangi bir türe işlevsellik eklememize olanak tanır.

    To demonstrate this, I want to introduce you to a useful method on strings, called trimmingCharacters(in:). This removes certain kinds of characters from the start or end of a string, such as alphanumeric letters, decimal digits, or, most commonly, whitespace and new lines.
    Bunu göstermek için, size dizeler üzerinde trimmingCharacters(in:) adı verilen yararlı bir yöntemi tanıtmak istiyorum. Bu, alfanümerik harfler, ondalık basamaklar veya en yaygın olarak boşluk ve yeni satırlar gibi belirli karakter türlerini bir dizenin başından veya sonundan kaldırır.

    Whitespace is the general term of the space character, the tab character, and a variety of other variants on those two. New lines are line breaks in text, which might sound simple but in practice of course there is no single one way of making them, so when we ask to trim new lines it will automatically take care of all the variants for us.
    Beyaz boşluk, boşluk karakteri, sekme karakteri ve bu ikisinin çeşitli diğer varyantları için kullanılan genel bir terimdir. Yeni satırlar metindeki satır sonlarıdır, kulağa basit gelebilir ancak pratikte elbette bunları yapmanın tek bir yolu yoktur, bu nedenle yeni satırları kırpmak istediğimizde bizim için otomatik olarak tüm varyantlarla ilgilenecektir.

    For example, here’s a string that has whitespace on either side:
    Örneğin, burada her iki tarafında da boşluk olan bir dize var:
*/

var quote = "   The truth is rarely pure and never simple   "

/**
    If we wanted to trim the whitespace and newlines on either side, we could do so like this:
    Her iki taraftaki boşlukları ve yeni satırları kırpmak istersek, bunu şu şekilde yapabiliriz:
*/

let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)

/**
 The .whitespacesAndNewlines value comes from Apple’s Foundation API, and actually so does trimmingCharacters(in:) – like I said way back at the beginning of this course, Foundation is really packed with useful code!
 .whitespacesAndNewlines değeri Apple'ın Foundation API'sinden geliyor ve aslında trimmingCharacters(in:) da öyle - bu kursun başında da söylediğim gibi, Foundation gerçekten faydalı kodlarla dolu!
 
 Having to call trimmingCharacters(in:) every time is a bit wordy, so let’s write an extension to make it shorter:
 Her seferinde trimmingCharacters(in:) ifadesini çağırmak biraz kelime kalabalığı yaratıyor, bu yüzden bunu daha kısa hale getirmek için bir uzantı yazalım:
*/

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

/**
 Let’s break that down:
 Bunu biraz açalım:
 - We start with the extension keyword, which tells Swift we want to add functionality to an existing type.
 - Swift'e mevcut bir türe işlevsellik eklemek istediğimizi söyleyen extension anahtar sözcüğü ile başlıyoruz.

 - Which type? Well, that comes next: we want to add functionality to String.
 - Hangi tür? Sırada bu var: String'e işlevsellik eklemek istiyoruz.
 
 - Now we open a brace, and all the code until the final closing brace is there to be added to strings.
 - Şimdi bir parantez açıyoruz ve son kapanış parantezine kadar tüm kod dizelere eklenmek üzere orada.

 - We’re adding a new method called trimmed(), which returns a new string.
 - Yeni bir dize döndüren trimmed() adlı yeni bir yöntem ekliyoruz.

 - Inside there we call the same method as before: trimmingCharacters(in:), sending back its result.
 - İçeride daha önce olduğu gibi aynı yöntemi çağırıyoruz: trimmingCharacters(in:), sonucu geri gönderiyor.

 - Notice how we can use self here – that automatically refers to the current string. This is possible because we’re currently in a string extension.
 - Burada self'i nasıl kullanabildiğimize dikkat edin - bu otomatik olarak geçerli dizgiyi ifade eder. Bu mümkün çünkü şu anda bir string uzantısındayız.
 
 - And now everywhere we want to remove whitespace and newlines we can just write the following:
 - Ve şimdi boşlukları ve satırsonlarını kaldırmak istediğimiz her yerde aşağıdakileri yazabiliriz:
*/

let trimmed2 = quote.trimmed()

/**
    Much easier!
    Çok daha kolay!

    That’s saved some typing, but is it that much better than a regular function?
    Bu biraz yazım tasarrufu sağladı, ancak normal bir fonksiyondan çok daha iyi mi?

    Well, the truth is that we could have written a function like this:
    Gerçek şu ki, bu şekilde bir fonksiyon yazabilirdik:
*/

func trim(_ string: String) -> String {
    string.trimmingCharacters(in: .whitespacesAndNewlines)
}

/**
    Then used it like this:
    Sonra bu şekilde kullandım:
*/

let trimmed3 = trim(quote)

/**
 That’s less code than using an extension, both in terms of making the function and using it. This kind of function is called a global function, because it’s available everywhere in our project.
 Bu, hem işlevi oluşturma hem de kullanma açısından bir uzantı kullanmaktan daha az koddur. Bu tür bir fonksiyona global fonksiyon denir, çünkü projemizin her yerinde kullanılabilir.
 
 However, the extension has a number of benefits over the global function, including:
 Bununla birlikte, uzantının global fonksiyona göre aşağıdakiler de dahil olmak üzere bir dizi avantajı vardır:
 - When you type quote. Xcode brings up a list of methods on the string, including all the ones we add in extensions. This makes our extra functionality easy to find.
 - Quote yazdığınızda. Xcode, uzantılara eklediklerimiz de dahil olmak üzere string üzerindeki metotların bir listesini getirir. Bu, ekstra işlevselliğimizin bulunmasını kolaylaştırır.
 
 - Writing global functions makes your code rather messy – they are hard to organize and hard to keep track of. On the other hand, extensions are naturally grouped by the data type they are extending.
 - Global fonksiyonlar yazmak kodunuzu oldukça dağınık hale getirir - organize edilmesi ve takip edilmesi zordur. Öte yandan, uzantılar doğal olarak genişlettikleri veri türüne göre gruplandırılır.
 
 - Because your extension methods are a full part of the original type, they get full access to the type’s internal data. That means they can use properties and methods marked with private access control, for example.
 - Uzantı metotlarınız orijinal türün tam bir parçası olduğu için, türün dahili verilerine tam erişime sahip olurlar. Bu, örneğin özel erişim denetimi ile işaretlenmiş özellikleri ve metotları kullanabilecekleri anlamına gelir.

 What’s more, extensions make it easier to modify values in place – i.e., to change a value directly, rather than return a new value.
 Dahası, uzantılar değerleri yerinde değiştirmeyi, yani yeni bir değer döndürmek yerine bir değeri doğrudan değiştirmeyi kolaylaştırır.
 
 For example, earlier we wrote a trimmed() method that returns a new string with whitespace and newlines removed, but if we wanted to modify the string directly we could add this to the extension:
 Örneğin, daha önce boşlukları ve yeni satırları kaldırılmış yeni bir dize döndüren bir trimmed() metodu yazmıştık, ancak dizeyi doğrudan değiştirmek istersek bunu uzantıya ekleyebiliriz:
 */

print(quote)

extension String {
    mutating func trim() {
        self = self.trimmed()
    }
}

/**
    Because the quote string was created as a variable, we can trim it in place like this:
    Örneğin, daha önce boşlukları ve yeni satırları kaldırılmış yeni bir dize döndüren bir trimmed() metodu yazmıştık, ancak dizeyi doğrudan değiştirmek istersek bunu uzantıya ekleyebiliriz:
*/

quote.trim()
print(quote)

/**
 Notice how the method has slightly different naming now: when we return a new value we used trimmed(), but when we modified the string directly we used trim(). This is intentional, and is part of Swift’s design guidelines: if you’re returning a new value rather than changing it in place, you should use word endings like ed or ing, like reversed().
 Yöntemin şimdi nasıl biraz farklı adlandırıldığına dikkat edin: yeni bir değer döndürdüğümüzde trimmed() kullandık, ancak dizeyi doğrudan değiştirdiğimizde trim() kullandık. Bu kasıtlıdır ve Swift'in tasarım yönergelerinin bir parçasıdır: eğer yeni bir değeri değiştirmek yerine geri döndürüyorsanız, reversed() gibi ed veya ing gibi kelime sonları kullanmalısınız.

 Tip: Previously I introduced you to the sorted() method on arrays. Now you know this rule, you should realize that if you create a variable array you can use sort() on it to sort the array in place rather than returning a new copy.
 İpucu: Daha önce size diziler üzerinde sorted() yöntemini tanıtmıştım. Artık bu kuralı bildiğinize göre, değişken bir dizi oluşturduğunuzda, yeni bir kopya döndürmek yerine diziyi yerinde sıralamak için sort() yöntemini kullanabileceğinizi anlamış olmalısınız.
 
 You can also use extensions to add properties to types, but there is one rule: they must only be computed properties, not stored properties. The reason for this is that adding new stored properties would affect the actual size of the data types – if we added a bunch of stored properties to an integer then every integer everywhere would need to take up more space in memory, which would cause all sorts of problems.
 Türlere özellikler eklemek için uzantıları da kullanabilirsiniz, ancak bir kural vardır: bunlar yalnızca hesaplanan özellikler olmalıdır, depolanan özellikler değil. Bunun nedeni, yeni depolanmış özellikler eklemenin veri türlerinin gerçek boyutunu etkileyecek olmasıdır - bir tamsayıya bir grup depolanmış özellik eklersek, her yerdeki her tamsayının bellekte daha fazla yer kaplaması gerekir ve bu da her türlü soruna neden olur.

 Fortunately, we can still get a lot done using computed properties. For example, one property I like to add to strings is called lines, which breaks the string up into an array of individual lines. This wraps another string method called components(separatedBy:), which breaks the string up into a string array by splitting it on a boundary of our choosing. In this case we’d want that boundary to be new lines, so we’d add this to our string extension:
 Neyse ki, hesaplanmış özellikleri kullanarak hala çok şey yapabiliriz. Örneğin, dizelere eklemeyi sevdiğim bir özellik, dizeyi tek tek satırlardan oluşan bir diziye ayıran lines adlı özelliktir. Bu, dizeyi seçtiğimiz bir sınırda bölerek bir dize dizisine ayıran components(separatedBy:) adlı başka bir dize yöntemini sarar. Bu durumda, bu sınırın yeni satırlar olmasını isteriz, bu yüzden bunu string uzantımıza ekleriz:
 */

extension String {
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

/**
    With that in place we can now read the lines property of any string, like so:
    Bunu uyguladıktan sonra artık herhangi bir dizenin lines özelliğini aşağıdaki gibi okuyabiliriz:
*/

let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""

print(lyrics.lines.count)

/**
    Whether they are single lines or complex pieces of functionality, extensions always have the same goal: to make your code easier to write, easier to read, and easier to maintain in the long term.
    İster tek satır ister karmaşık işlevsellik parçaları olsun, uzantıların amacı her zaman aynıdır: kodunuzu daha kolay yazmak, daha kolay okumak ve uzun vadede bakımını daha kolay yapmak.

    Before we’re done, I want to show you one really useful trick when working with extensions. You’ve seen previously how Swift automatically generates a memberwise initializer for structs, like this:
    Bitirmeden önce, uzantılarla çalışırken size gerçekten yararlı bir numara göstermek istiyorum. Daha önce Swift'in struct'lar için nasıl otomatik olarak üye bazında initializer oluşturduğunu görmüştünüz:
 */

struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
}

let lotr = Book(title: "Lord of the Rings", pageCount: 1178, readingHours: 24)

/**
 I also mentioned how creating your own initializer means that Swift will no longer provide the memberwise one for us. This is intentional, because a custom initializer means we want to assign data based on some custom logic, like this:
 Kendi başlatıcınızı oluşturmanın Swift'in artık bizim için üye bazında bir başlatıcı sağlamayacağı anlamına geldiğinden de bahsetmiştim. Bu kasıtlıdır, çünkü özel bir başlatıcı, verileri bunun gibi bazı özel mantığa dayalı olarak atamak istediğimiz anlamına gelir:
*/

struct Book2 {
    let title: String
    let pageCount: Int
    let readingHours: Int

    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

/**
    If Swift were to keep the memberwise initializer in this instance, it would skip our logic for calculating the approximate reading time.
    Swift bu örnekte üyeye göre başlatıcıyı korusaydı, yaklaşık okuma süresini hesaplama mantığımızı atlayacaktı.

    However, sometimes you want both – you want the ability to use a custom initializer, but also retain Swift’s automatic memberwise initializer. In this situation it’s worth knowing exactly what Swift is doing: if we implement a custom initializer inside our struct, then Swift disables the automatic memberwise initializer.
    Bununla birlikte, bazen her ikisini de istersiniz - özel bir başlatıcı kullanma yeteneğine sahip olmak, ancak aynı zamanda Swift'in otomatik üyeli başlatıcısını korumak istersiniz. Bu durumda Swift'in tam olarak ne yaptığını bilmek önemlidir: struct'ımızın içine özel bir ilklendirici uygularsak, Swift otomatik üyeli ilklendiriciyi devre dışı bırakır.

    That extra little detail might give you a hint on what’s coming next: if we implement a custom initializer inside an extension, then Swift won’t disable the automatic memberwise initializer. This makes sense if you think about it: if adding a new initializer inside an extension also disabled the default initializer, one small change from us could break all sorts of other Swift code.
    Bu ekstra küçük ayrıntı size bir sonraki adımda ne olacağına dair bir ipucu verebilir: bir uzantı içinde özel bir başlatıcı uygularsak, Swift otomatik üyeli başlatıcıyı devre dışı bırakmaz. Düşündüğünüzde bu mantıklı: eğer bir uzantının içine yeni bir başlatıcı eklemek varsayılan başlatıcıyı da devre dışı bırakırsa, bizim yapacağımız küçük bir değişiklik diğer tüm Swift kodlarını bozabilir.

    So, if we wanted our Book struct to have the default memberwise initializer as well as our custom initializer, we’d place the custom one in an extension, like this:
    Bu nedenle, Book yapımızın varsayılan üyeli başlatıcının yanı sıra özel başlatıcımıza da sahip olmasını istiyorsak, özel olanı aşağıdaki gibi bir uzantıya yerleştiririz:
*/

extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}
