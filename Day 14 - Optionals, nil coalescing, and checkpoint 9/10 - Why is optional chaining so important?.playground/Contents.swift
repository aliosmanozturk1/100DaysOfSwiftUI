import Cocoa

/// # Why is optional chaining so important?

/**
    Swift’s optional chaining lets us dig through several layers of optionals in a single line of code, and if any one of those layers is nil then the whole line becomes nil.
    Swift'in opsiyonel zincirleme özelliği, tek bir kod satırında birkaç opsiyonel katmanı incelememizi sağlar ve bu katmanlardan herhangi biri nil ise tüm satır nil olur.

    As a simple example, we might have a list of names and want to find where they should be placed based on the first letter of their surname:
    Basit bir örnek olarak, elimizde bir isim listesi olabilir ve soyadlarının ilk harfine göre nereye yerleştirilmeleri gerektiğini bulmak isteyebiliriz:
*/

let names = ["Vincent": "van Gogh", "Pablo": "Picasso", "Claude": "Monet"]
let surnameLetter = names["Vincent"]?.first?.uppercased()

/**
    There we use optional chaining with the dictionary value because names["Vincent"] might not exist, and again when reading the first character from the surname, because it’s possible the string could be empty.
    Burada, names["Vincent"] mevcut olmayabileceği için sözlük değeriyle opsiyonel zincirleme kullanırız ve yine soyadından ilk karakteri okurken, dizenin boş olma olasılığı nedeniyle.

    Optional chaining makes for a very good companion to nil coalescing, because it allows you to dig through layers of optionals while also providing a sensible fall back if any of the optionals are nil.
    Opsiyonel zincirleme, nil birleştirme için çok iyi bir arkadaştır, çünkü opsiyonellerin katmanlarını kazmanıza izin verirken, opsiyonellerden herhangi birinin nil olması durumunda mantıklı bir geri dönüş sağlar.

    Returning to our surname example, we could automatically return “?” if we were unable to read the first letter of someone’s surname:
    Soyadı örneğimize dönecek olursak, birinin soyadının ilk harfini okuyamadığımızda otomatik olarak "?" döndürebiliriz:
*/

let surnameLetter2 = names["Vincent"]?.first?.uppercased() ?? "?"

/**
    For more information on optional chaining, I can recommend this blog post from Andy Bargh: https://andybargh.com/optional-chaining/
    İsteğe bağlı zincirleme hakkında daha fazla bilgi için Andy Bargh'ın şu blog yazısını tavsiye edebilirim: https://andybargh.com/optional-chaining/
 */
