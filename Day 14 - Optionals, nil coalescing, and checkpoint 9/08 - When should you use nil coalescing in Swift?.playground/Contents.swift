import Cocoa

/// # When should you use nil coalescing in Swift?

/**
    Nil coalescing lets us attempt to unwrap an optional, but provide a default value if the optional contains nil. This is extraordinarily useful in Swift, because although optionals are a great feature it’s usually better to have a non-optional – to have a real string rather than a “might be a string, might be nil” – and nil coalescing is a great way to get that.
    Nil birleştirme, bir opsiyonu açmaya çalışmamıza izin verir, ancak opsiyon nil içeriyorsa varsayılan bir değer sağlar. Bu Swift'te olağanüstü kullanışlıdır, çünkü opsiyonlar harika bir özellik olmasına rağmen, opsiyonel olmayan bir değere sahip olmak genellikle daha iyidir - "string olabilir, nil olabilir" yerine gerçek bir stringe sahip olmak - ve nil birleştirme bunu elde etmenin harika bir yoludur.

    For example, if you were working on a chat app and wanted to load whatever message draft the user had saved, you might write code like this:
    Örneğin, bir sohbet uygulaması üzerinde çalışıyorsanız ve kullanıcının kaydettiği mesaj taslağını yüklemek istiyorsanız, aşağıdaki gibi bir kod yazabilirsiniz:

    let savedData = loadSavedMessage() ?? ""
*/

/**
    So, if loadSavedMessage() returns an optional with a string inside, it will be unwrapped and placed into savedData. But if the optional is nil then Swift will set savedData to be an empty string. Either way, savedData will end up being a String and not a String?.
    Yani, loadSavedMessage() içinde string olan bir optional döndürürse, bu optional çözülür ve savedData içine yerleştirilir. Ancak optional nil ise Swift savedData'yı boş bir string olarak ayarlayacaktır. Her iki durumda da, savedData bir String? değil, bir String olacaktır.

    You can chain nil coalescing if you want to, although I don’t think it’s common. So, this kind of code is valid if you wanted it:
    İsterseniz nil birleştirmeyi zincirleyebilirsiniz, ancak bunun yaygın olduğunu sanmıyorum. Yani, eğer isterseniz bu tür bir kod geçerlidir:
 
    let savedData = first() ?? second() ?? ""
*/

/**
    That will attempt to run first(), and if that returns nil attempt to run second(), and if that returns nil then it will use an empty string.
    Bu, first() işlevini çalıştırmayı deneyecek ve nil döndürürse second() işlevini çalıştırmayı deneyecek ve nil döndürürse boş bir string kullanacaktır.

    Remember, reading a dictionary key will always return an optional, so you might want to use nil coalescing here to ensure you get back a non-optional:
    Bir sözlük anahtarının okunmasının her zaman opsiyonel bir anahtar döndüreceğini unutmayın, bu nedenle opsiyonel olmayan bir anahtar döndürdüğünüzden emin olmak için burada nil birleştirme kullanmak isteyebilirsiniz:
*/

let scores = ["Picard": 800, "Data": 7000, "Troi": 900]
let crusherScore = scores["Crusher"] ?? 0

/**
    This is definitely a matter of taste, but dictionaries offer a slightly different approach that lets us specify the default value for when the key isn’t found:
    Bu kesinlikle bir zevk meselesidir, ancak sözlükler, anahtar bulunamadığında varsayılan değeri belirtmemize izin veren biraz farklı bir yaklaşım sunar:
*/

let crusherScore2 = scores["Crusher", default: 0]

/**
    You can choose whichever you prefer – when reading dictionary values there’s no real difference.
    Hangisini tercih ederseniz edebilirsiniz - sözlük değerlerini okurken gerçek bir fark yoktur.
*/
