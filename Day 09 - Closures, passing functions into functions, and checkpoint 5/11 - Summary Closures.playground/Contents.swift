import Cocoa

/// # Summary: Closures
/// # Özet: Closures

/**
    We’ve covered a lot about closures in the previous chapters, so let’s recap:
    Önceki bölümlerde kapanışlar hakkında çok şey anlattık, bu yüzden özetleyelim:
 
    - You can copy functions in Swift, and they work the same as the original except they lose their external parameter names.
    - Swift'te fonksiyonları kopyalayabilirsiniz ve harici parametre adlarını kaybetmeleri dışında orijinaliyle aynı şekilde çalışırlar.
 
    - All functions have types, just like other data types. This includes the parameters they receive along with their return type, which might be Void – also known as “nothing”.
    - Tüm fonksiyonların tıpkı diğer veri tipleri gibi tipleri vardır. Bu, aldıkları parametrelerin yanı sıra "hiçbir şey" olarak da bilinen Void olabilecek dönüş türlerini içerir.
 
    - You can create closures directly by assigning to a constant or variable.
    - Bir sabite veya değişkene atama yaparak doğrudan closure'lar oluşturabilirsiniz.

    - Closures that accept parameters or return a value must declare this inside their braces, followed by the keyword in.
    - Parametre kabul eden veya bir değer döndüren Closure'lar bunu parantez içinde ve ardından in anahtar sözcüğü ile bildirmelidir.

    - Functions are able to accept other functions as parameters. They must declare up front exactly what data those functions must use, and Swift will ensure the rules are followed.
    - Fonksiyonlar diğer fonksiyonları parametre olarak kabul edebilir. Bu fonksiyonların tam olarak hangi verileri kullanması gerektiğini önceden bildirmeleri gerekir ve Swift kurallara uyulmasını sağlayacaktır.
 
    - In this situation, instead of passing a dedicated function you can also pass a closure – you can make one directly. Swift allows both approaches to work.
    - Bu durumda, özel bir fonksiyon geçirmek yerine bir closure da geçirebilirsiniz - doğrudan bir tane yapabilirsiniz. Swift her iki yaklaşımın da çalışmasına izin verir.
 
    - When passing a closure as a function parameter, you don’t need to explicitly write out the types inside your closure if Swift can figure it out automatically. The same is true for the return value – if Swift can figure it out, you don’t need to specify it.
    - Bir closure'u fonksiyon parametresi olarak geçirirken, Swift bunu otomatik olarak çözebiliyorsa, closure'unuzun içindeki türleri açıkça yazmanıza gerek yoktur. Aynı şey geri dönüş değeri için de geçerlidir - Swift bunu anlayabiliyorsa, belirtmenize gerek yoktur.

    - If one or more of a function’s final parameters are functions, you can use trailing closure syntax.
    - Bir fonksiyonun son parametrelerinden biri veya daha fazlası fonksiyon ise, trailing closure sözdizimini kullanabilirsiniz.

    - You can also use shorthand parameter names such as $0 and $1, but I would recommend doing that only under some conditions.
    - Ayrıca $0 ve $1 gibi kısaltılmış parametre adları da kullanabilirsiniz, ancak bunu yalnızca bazı koşullar altında yapmanızı tavsiye ederim.

    - You can make your own functions that accept functions as parameters, although in practice it’s much more important to know how to use them than how to create them.
    - Fonksiyonları parametre olarak kabul eden kendi fonksiyonlarınızı oluşturabilirsiniz, ancak pratikte bunları nasıl oluşturacağınızdan ziyade nasıl kullanacağınızı bilmek çok daha önemlidir.

    Of all the various parts of the Swift language, I’d say closures are the single toughest thing to learn. Not only is the syntax a little hard on your eyes at first, but the very concept of passing a function into a function takes a little time to sink in.
    Swift dilinin çeşitli bölümleri arasında, closure'ların öğrenmesi en zor olan şey olduğunu söyleyebilirim. Sadece sözdizimi ilk başta gözünüzü biraz zorlamakla kalmıyor, aynı zamanda bir fonksiyonu bir fonksiyona geçirme kavramının yerleşmesi de biraz zaman alıyor.
 
    So, if you’ve read through these chapters and feel like your head is about to explode, that’s great – it means you’re half way to understanding closures!
    Eğer bu bölümleri okuduysanız ve kafanızın patlamak üzere olduğunu hissediyorsanız, bu harika - bu, closure'ları anlamanın yolunu yarıladığınız anlamına geliyor!
*/

