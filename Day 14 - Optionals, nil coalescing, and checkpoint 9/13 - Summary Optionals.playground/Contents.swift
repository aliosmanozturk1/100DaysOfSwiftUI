import Cocoa

/// # Summary: Optionals

/**
    In these chapters we’ve covered one of Swift’s most important features, and although most people find optionals hard to understand at first almost everyone agrees they are useful in practice.
    Bu bölümlerde Swift'in en önemli özelliklerinden birini ele aldık ve çoğu insan opsiyonelleri ilk başta anlamakta zorlansa da neredeyse herkes pratikte yararlı olduklarını kabul ediyor.

    Let’s recap what we learned:
    Öğrendiklerimizi özetleyelim:
    - Optionals let us represent the absence of data, which means we’re able to say “this integer has no value” – that’s different from a fixed number such as 0.
    - Opsiyonlar veri yokluğunu temsil etmemize izin verir, yani "bu tamsayının değeri yok" diyebiliriz - bu 0 gibi sabit bir sayıdan farklıdır.

    - As a result, everything that isn’t optional definitely has a value inside, even if that’s just an empty string.
    - Sonuç olarak, opsiyonel olmayan her şeyin içinde kesinlikle bir değer vardır, bu sadece boş bir string olsa bile.

    - Unwrapping an optional is the process of looking inside a box to see what it contains: if there’s a value inside it’s sent back for use, otherwise there will be nil inside.
    - Bir opsiyonun ambalajını açmak, ne içerdiğini görmek için bir kutunun içine bakma işlemidir: içinde bir değer varsa kullanım için geri gönderilir, aksi takdirde içinde nil olacaktır.

    - We can use if let to run some code if the optional has a value, or guard let to run some code if the optional doesn’t have a value – but with guard we must always exit the function afterwards.
    - optional bir değere sahipse bazı kodları çalıştırmak için if let veya optional bir değere sahip değilse bazı kodları çalıştırmak için guard let kullanabiliriz - ancak guard ile her zaman daha sonra fonksiyondan çıkmalıyız.

    - The nil coalescing operator, ??, unwraps and returns an optional’s value, or uses a default value instead.
    - nil birleştirme işleci, ??, bir opsiyonel değeri açar ve döndürür veya bunun yerine varsayılan bir değer kullanır.

    - Optional chaining lets us read an optional inside another optional with a convenient syntax.
    - Opsiyonel zincirleme, uygun bir sözdizimiyle bir opsiyoneli başka bir opsiyonelin içinde okumamızı sağlar.

    - If a function might throw errors, you can convert it into an optional using try? – you’ll either get back the function’s return value, or nil if an error is thrown.
    - Bir fonksiyon hata verebilirse, try? kullanarak onu opsiyonel hale dönüştürebilirsiniz. - fonksiyonun geri dönüş değerini ya da bir hata atılırsa nil değerini geri alırsınız.

    Optionals are second only to closures when it comes to language features folks struggle to learn, but I promise after a few months you’ll wonder how you could live without them!
    Opsiyonlar, insanların öğrenmekte zorlandığı dil özellikleri söz konusu olduğunda kapanışlardan sonra ikinci sıradadır, ancak birkaç ay sonra onlar olmadan nasıl yaşayabileceğinizi merak edeceğinize söz veriyorum!
*/
