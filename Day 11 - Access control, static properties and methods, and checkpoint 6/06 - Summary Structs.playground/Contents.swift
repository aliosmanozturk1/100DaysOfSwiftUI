import Cocoa

/// # Summary: Structs

/**
    Structs are used almost everywhere in Swift: String, Int, Double, Array and even Bool are all implemented as structs, and now you can recognize that a function such as isMultiple(of:) is really a method belonging to Int.

    Let’s recap what else we learned:

    You can create your own structs by writing struct, giving it a name, then placing the struct’s code inside braces.
    Structs can have variable and constants (known as properties) and functions (known as methods)
    If a method tries to modify properties of its struct, you must mark it as mutating.
    You can store properties in memory, or create computed properties that calculate a value every time they are accessed.
    We can attach didSet and willSet property observers to properties inside a struct, which is helpful when we need to be sure that some code is always executed when the property changes.
    Initializers are a bit like specialized functions, and Swift generates one for all structs using their property names.
    You can create your own custom initializers if you want, but you must always make sure all properties in your struct have a value by the time the initializer finishes, and before you call any other methods.
    We can use access to mark any properties and methods as being available or unavailable externally, as needed.
    It’s possible to attach a property or methods directly to a struct, so you can use them without creating an instance of the struct.
*/

/**
    Struct'lar Swift'te neredeyse her yerde kullanılır: String, Int, Double, Array ve hatta Bool bile struct olarak uygulanır ve artık isMultiple(of:) gibi bir fonksiyonun gerçekten Int'e ait bir metot olduğunu anlayabilirsiniz.

    Başka neler öğrendiğimizi özetleyelim:

    struct yazarak, ona bir isim vererek ve ardından struct'ın kodunu parantezler içine yerleştirerek kendi struct'larınızı oluşturabilirsiniz.
    Struct'lar değişken ve sabitlere (özellikler olarak bilinir) ve fonksiyonlara (metotlar olarak bilinir) sahip olabilir
    Bir yöntem kendi yapısının özelliklerini değiştirmeye çalışırsa, bunu mutasyona uğrayan olarak işaretlemeniz gerekir.
    Özellikleri bellekte saklayabilir veya her erişildiklerinde bir değer hesaplayan hesaplanmış özellikler oluşturabilirsiniz.
    Bir struct içindeki özelliklere didSet ve willSet özellik gözlemcileri ekleyebiliriz; bu, özellik değiştiğinde her zaman bazı kodların yürütüldüğünden emin olmamız gerektiğinde yararlıdır.
    Başlatıcılar biraz özelleşmiş fonksiyonlar gibidir ve Swift, özellik adlarını kullanarak tüm yapılar için bir tane oluşturur.
    İsterseniz kendi özel başlatıcılarınızı oluşturabilirsiniz, ancak başlatıcı bittiğinde ve diğer yöntemleri çağırmadan önce yapınızdaki tüm özelliklerin bir değere sahip olduğundan her zaman emin olmalısınız.
    Herhangi bir özelliği ve yöntemi gerektiğinde harici olarak kullanılabilir veya kullanılamaz olarak işaretlemek için erişimi kullanabiliriz.
    Bir özelliği veya yöntemleri doğrudan bir struct'a eklemek mümkündür, böylece struct'ın bir örneğini oluşturmadan bunları kullanabilirsiniz.
 */
