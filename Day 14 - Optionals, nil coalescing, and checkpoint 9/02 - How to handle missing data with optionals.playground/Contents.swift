import Cocoa

/// # How to handle missing data with optionals
/// # Opsiyonellerle eksik veriler nasıl işlenir

/**
 Swift likes to be predictable, which means as much as possible it encourages us to write code that is safe and will work the way we expect. You’ve already met throwing functions, but Swift has another important way of ensuring predictability called optionals – a word meaning “this thing might have a value or might not.”
 Swift öngörülebilir olmayı sever, yani bizi mümkün olduğunca güvenli ve beklediğimiz şekilde çalışacak kod yazmaya teşvik eder. Fırlatma fonksiyonlarıyla zaten tanıştınız, ancak Swift'in öngörülebilirliği sağlamak için optionals adı verilen başka bir önemli yolu daha var - "bu şeyin bir değeri olabilir veya olmayabilir" anlamına gelen bir kelime.
 
 To see optionals in action, think about the following code:
 Opsiyonelleri iş başında görmek için aşağıdaki kodu düşünün:
*/

let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

let peachOpposite = opposites["Peach"]

/**
    There we create a [String: String] dictionary with two keys: Mario and Luigi. We then attempt to read the value attached to the key “Peach”, which doesn’t exist, and we haven’t provided a default value to send back in place of missing data.
    Burada iki anahtarlı bir [String: String] sözlüğü oluşturuyoruz: Mario ve Luigi. Daha sonra, mevcut olmayan "Peach" anahtarına bağlı değeri okumaya çalışırız ve eksik verilerin yerine geri gönderilecek varsayılan bir değer sağlamadık.

    What will peachOpposite be after that code runs? This is a [String: String] dictionary, which means the keys are strings and the values are strings, but we just tried to read a key that doesn’t exist – it wouldn’t make sense to get a string back if there isn’t a value there.
    Bu kod çalıştıktan sonra peachOpposite ne olacak? Bu bir [String: String] sözlüğüdür, yani anahtarlar string ve değerler string'tir, ancak az önce var olmayan bir anahtarı okumaya çalıştık - orada bir değer yoksa bir string'i geri almak mantıklı olmaz.

    Swift’s solution is called optionals, which means data that might be present or might not. They are primarily represented by placing a question mark after your data type, so in this case peachOpposite would be a String? rather than a String.
    Swift'in çözümü optionals olarak adlandırılır, bu da mevcut olabilecek veya olmayabilecek veriler anlamına gelir. Bunlar öncelikle veri türünüzden sonra bir soru işareti koyarak temsil edilir, yani bu durumda peachOpposite bir String yerine bir String? olacaktır.

    Optionals are like a box that may or may not have something inside. So, a String? means there might be a string waiting inside for us, or there might be nothing at all – a special value called nil, that means “no value”. Any kind of data can be optional, including Int, Double, and Bool, as well as instances of enums, structs, and classes.
    Seçenekler, içinde bir şey olabilecek veya olmayabilecek bir kutu gibidir. Yani, bir String? kutusunun içinde bizi bekleyen bir string olabilir ya da hiçbir şey olmayabilir - nil adı verilen ve "değer yok" anlamına gelen özel bir değer. Int, Double ve Bool'un yanı sıra enum, struct ve sınıf örnekleri de dahil olmak üzere her türlü veri isteğe bağlı olabilir.

    You’re probably thinking “so… what has actually changed here? Before we had a String, and now we have a String?, but how does that actually change the code we write?”
    Muhtemelen "peki... burada aslında ne değişti? Daha önce bir String'imiz vardı ve şimdi bir String?'imiz var, ama bu yazdığımız kodu nasıl değiştiriyor?"

    Well, here’s the clincher: Swift likes our code to be predictable, which means it won’t let us use data that might not be there. In the case of optionals, that means we need to unwrap the optional in order to use it – we need to look inside the box to see if there’s a value, and, if there is, take it out and use it.
    İşte işin can alıcı noktası: Swift kodumuzun tahmin edilebilir olmasını ister, bu da orada olmayan verileri kullanmamıza izin vermeyeceği anlamına gelir. Opsiyonlar söz konusu olduğunda, bu, opsiyonu kullanmak için onu açmamız gerektiği anlamına gelir - bir değer olup olmadığını görmek için kutunun içine bakmamız ve varsa, onu çıkarıp kullanmamız gerekir.

    Swift gives us two primary ways of unwrapping optionals, but the one you’ll see the most looks like this:
    Swift bize opsiyonelleri açmak için iki temel yol sunar, ancak en çok göreceğiniz yol şuna benzer:
*/

if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}

/**
    This if let syntax is very common in Swift, and combines creating a condition (if) with creating a constant (let). Together, it does three things:
    Bu if let sözdizimi Swift'te çok yaygındır ve bir koşul (if) ile bir sabit (let) oluşturmayı birleştirir. Birlikte üç şey yapar:

    - It reads the optional value from the dictionary.
    - Sözlükten opsiyonel değeri okur.

    - If the optional has a string inside, it gets unwrapped – that means the string inside gets placed into the marioOpposite constant.
    - Eğer opsiyonun içinde bir string varsa, çözülür - bu da içindeki stringin marioOpposite sabitine yerleştirileceği anlamına gelir.

    - The condition has succeeded – we were able to unwrap the optional – so the condition’s body is run.
    - Koşul başarılı oldu - opsiyonel olanı açabildik - bu nedenle koşulun gövdesi çalıştırıldı

    The condition’s body will only be run if the optional had a value inside. Of course, if you want to add an else block you can – it’s just a normal condition, so this kind of code is fine:
    Koşulun gövdesi yalnızca opsiyonel içinde bir değer varsa çalıştırılacaktır. Elbette, bir else bloğu eklemek istiyorsanız ekleyebilirsiniz - bu sadece normal bir koşuldur, bu nedenle bu tür bir kodda sorun yoktur:
*/

var username: String? = nil

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.")
}

/**
    Think of optionals a bit like Schrödinger’s data type: there might be a value inside the box or there might not be, but the only way to find out is to check.
    Opsiyonelleri biraz Schrödinger'in veri tipi gibi düşünün: kutunun içinde bir değer olabilir veya olmayabilir, ancak bunu öğrenmenin tek yolu kontrol etmektir.

    This might seem rather academic so far, but optionals really are critical for helping us produce better software. You see, in the same way optionals mean data may or may not be present, non-optionals – regular strings, integers, etc – mean data must be available.
    Buraya kadar anlattıklarımız oldukça akademik görünebilir, ancak opsiyoneller daha iyi yazılımlar üretmemize yardımcı olmak için gerçekten kritik öneme sahiptir. Gördüğünüz gibi, opsiyoneller verilerin mevcut olabileceği veya olmayabileceği anlamına gelirken, opsiyonel olmayanlar - normal dizeler, tamsayılar, vb - verilerin mevcut olması gerektiği anlamına gelir.

    Think about it: if we have a non-optional Int it means there is definitely a number inside, always. It might be something like 1 million or 0, but it’s still a number and is guaranteed to be present. In comparison, an optional Int set to nil has no value at all – it’s not 0 or any other number, it’s nothing at all.
    Şöyle düşünün: eğer opsiyonel olmayan bir Int'imiz varsa, içinde kesinlikle bir sayı var demektir, her zaman. Bu sayı 1 milyon veya 0 gibi bir şey olabilir, ancak yine de bir sayıdır ve mevcut olması garantidir. Buna karşılık, nil olarak ayarlanmış isteğe bağlı bir Int'in hiçbir değeri yoktur - 0 veya başka bir sayı değil, hiçbir şeydir.

    Similarly, if we have a non-optional String it means there is definitely a string in there: it might be something like “Hello” or an empty string, but both of those are different from an optional string set to nil.
    Benzer şekilde, eğer opsiyonel olmayan bir String'imiz varsa, bu orada kesinlikle bir string olduğu anlamına gelir: "Hello" gibi bir şey veya boş bir string olabilir, ancak bunların her ikisi de nil olarak ayarlanmış opsiyonel bir string'ten farklıdır.

    Every data type can be optional if needed, including collections such as Array and Dictionary. Again, an array of integers might contain one or more numbers, or perhaps no numbers at all, but both of those are different from optional arrays set to nil.
    Array ve Dictionary gibi koleksiyonlar da dahil olmak üzere, gerektiğinde her veri türü opsiyonel olabilir. Yine, tamsayılardan oluşan bir dizi bir veya daha fazla sayı içerebilir veya belki de hiç sayı içermeyebilir, ancak bunların her ikisi de nil olarak ayarlanmış isteğe bağlı dizilerden farklıdır.

    To be clear, an optional integer set to nil is not the same as a non-optional integer holding 0, an optional string set to nil is not the same as a non-optional string that is currently set to an empty string, and an optional array set to nil is not the same as a non-optional array that currently has no items – we’re talking about the absence of any data at all, empty or otherwise.
    Açık olmak gerekirse, nil olarak ayarlanmış opsiyonel bir tamsayı, 0 değerine sahip opsiyonel olmayan bir tamsayı ile aynı değildir; nil olarak ayarlanmış opsiyonel bir dize, şu anda boş bir dizeye ayarlanmış opsiyonel olmayan bir dize ile aynı değildir ve nil olarak ayarlanmış opsiyonel bir dizi, şu anda hiçbir öğesi olmayan opsiyonel olmayan bir dizi ile aynı değildir - boş veya başka türlü herhangi bir verinin yokluğundan bahsediyoruz.

    As Zev Eisenberg said, “Swift didn’t introduce optionals. It introduced non-optionals.”
    Zev Eisenberg'in dediği gibi, "Swift opsiyonelleri tanıtmadı. Opsiyonel olmayanları tanıttı."

    You can see this in action if you try to pass an optional integer into a function that requires a non-optional integer, like this:
    Optional olmayan bir tamsayı gerektiren bir işleve optional bir tamsayı geçirmeye çalışırsanız bunu görebilirsiniz:
 
    func square(number: Int) -> Int {
        number * number
    }

    var number: Int? = nil
    print(square(number: number))
 
 Swift will refuse to build that code, because the optional integer needs to be unwrapped – we can’t use an optional value where a non-optional is needed, because if there were no value inside we’d hit a problem.
 Swift bu kodu oluşturmayı reddedecektir, çünkü opsiyonel tamsayının paketinin açılması gerekir - opsiyonel olmayan bir değerin gerekli olduğu yerde opsiyonel bir değer kullanamayız, çünkü içinde değer olmasaydı bir sorunla karşılaşırdık.

 So, to use the optional we must first unwrap it like this:
 Dolayısıyla, opsiyonel olanı kullanmak için önce onu bu şekilde açmalıyız:
*/

func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil

if let unwrappedNumber = number {
    print(square(number: unwrappedNumber))
}

/**
    This style is a bit confusing when you first read it, because now it feels like quantum physics – can number really be both optional and non-optional at the same time? Well, no.
    Bu tarz ilk okuduğunuzda biraz kafa karıştırıcıdır, çünkü şimdi kuantum fiziği gibi hissettiriyor - sayı gerçekten aynı anda hem optional hem de non-optional olabilir mi? Şey, hayır.

    What’s happening here is that we’re temporarily creating a second constant of the same name, available only inside the condition’s body. This is called shadowing, and it’s mainly used with optional unwraps like you can see above.
    Burada olan şey, geçici olarak aynı isimde, yalnızca koşulun gövdesinde kullanılabilen ikinci bir sabit oluşturmamızdır. Buna gölgeleme denir ve esas olarak yukarıda gördüğünüz gibi opsiyonel unwraps ile kullanılır.

    So, inside the condition’s body we have an unwrapped value to work with – a real Int rather than an optional Int? – but outside we still have the optional.
    Yani, koşulun gövdesi içinde çalışmak için sarılmamış bir değerimiz var - optional bir Int yerine gerçek bir Int? - ancak dışarıda hala optional değerimiz var.
*/


