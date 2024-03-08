import Cocoa

/// # Summary: Protocols and extensions

/**
    In these chapters we’ve covered some complex but powerful features of Swift, but don’t feel bad if you struggled a bit – these really are hard to grasp at first, and they’ll only really sink in once you’ve had time to try them out in your own code.
    Bu bölümlerde Swift'in bazı karmaşık ama güçlü özelliklerini ele aldık, ancak biraz zorlandıysanız kendinizi kötü hissetmeyin - bunları ilk başta kavramak gerçekten zor ve ancak kendi kodunuzda denemek için zamanınız olduğunda gerçekten anlayacaksınız.

    Let’s recap what we learned:
    Öğrendiklerimizi özetleyelim:

    - Protocols are like contracts for code: we specify the functions and methods that we required, and conforming types must implement them.
    - Protokoller kod sözleşmeleri gibidir: ihtiyaç duyduğumuz işlevleri ve yöntemleri belirtiriz ve uyumlu türler bunları uygulamalıdır.

    - Opaque return types let us hide some information in our code. That might mean we want to retain flexibility to change in the future, but also means we don’t need to write out gigantic return types.
    - Opak geri dönüş türleri kodumuzdaki bazı bilgileri gizlememizi sağlar. Bu, gelecekte değişiklik yapma esnekliğini korumak istediğimiz anlamına gelebilir, ancak aynı zamanda devasa geri dönüş türleri yazmamız gerekmediği anlamına da gelir.

    - Extensions let us add functionality to our own custom types, or to Swift’s built-in types. This might mean adding a method, but we can also add computed properties.
    - Uzantılar, kendi özel tiplerimize veya Swift'in yerleşik tiplerine işlevsellik eklememizi sağlar. Bu, bir yöntem eklemek anlamına gelebilir, ancak hesaplanmış özellikler de ekleyebiliriz.

    - Protocol extensions let us add functionality to many types all at once – we can add properties and methods to a protocol, and all conforming types get access to them.
    - Protokol uzantıları birçok türe aynı anda işlevsellik eklememizi sağlar - bir protokole özellikler ve yöntemler ekleyebiliriz ve tüm uyumlu türler bunlara erişebilir.

    When we boil it down to that these features seem easy, but they aren’t. You need to know about them, to know that they exist, but you need to use them only superficially in order to continue your learning journey.
    Özetleyecek olursak, bu özellikler kolay gibi görünse de öyle değildir. Bunları bilmeniz, var olduklarını bilmeniz gerekir, ancak öğrenme yolculuğunuza devam etmek için bunları yalnızca yüzeysel olarak kullanmanız gerekir.
*/
