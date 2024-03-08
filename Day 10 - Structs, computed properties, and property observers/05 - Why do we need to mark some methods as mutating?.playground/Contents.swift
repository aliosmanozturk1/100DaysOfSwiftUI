import Cocoa

/// # Why do we need to mark some methods as mutating?
/// # Neden bazı yöntemleri mutasyona uğruyor olarak işaretlememiz gerekiyor?

/**
    It’s possible to modify the properties of a struct, but only if that struct is created as a variable. Of course, inside your struct there’s no way of telling whether you’ll be working with a variable struct or a constant struct, so Swift has a simple solution: any time a struct’s method tries to change any properties, you must mark it as mutating.
    Bir struct'ın özelliklerini değiştirmek mümkündür, ancak yalnızca bu struct bir değişken olarak oluşturulmuşsa. Elbette, struct'ınızın içinde değişken bir struct ile mi yoksa sabit bir struct ile mi çalışacağınızı söylemenin bir yolu yoktur, bu nedenle Swift'in basit bir çözümü vardır: bir struct'ın yöntemi herhangi bir özelliği değiştirmeye çalıştığında, bunu mutating olarak işaretlemelisiniz.

    You don’t need to do anything else other than mark the method as mutating, but doing that gives Swift enough information to stop that method from being used with constant struct instances.
    Yöntemi mutasyona uğrayan olarak işaretlemekten başka bir şey yapmanıza gerek yoktur, ancak bunu yapmak Swift'e bu yöntemin sabit struct örnekleriyle kullanılmasını engellemek için yeterli bilgi verir.

    There are two important details you’ll find useful:
    Yararlı bulacağınız iki önemli ayrıntı var:
    - Marking methods as mutating will stop the method from being called on constant structs, even if the method itself doesn’t actually change any properties. If you say it changes stuff, Swift believes you!
    - Yöntemleri mutasyona uğrayan olarak işaretlemek, yöntemin kendisi aslında herhangi bir özelliği değiştirmese bile, yöntemin sabit yapılar üzerinde çağrılmasını durduracaktır. Bir şeyleri değiştirdiğini söylerseniz, Swift size inanır! (YANİ BENCE BURDA DİYORKİ STRUCT'TAKİ FONKSİYONU MUTATİNG OLARAK BELİRTİRSEN O STRUCT'U LET DEĞİŞKENE ATAYAMAN DİYOR)

    - A method that is not marked as mutating cannot call a mutating function – you must mark them both as mutating.
    - Mutasyonlu olarak işaretlenmemiş bir yöntem mutasyonlu bir işlevi çağıramaz; her ikisini de mutasyonlu olarak işaretlemeniz gerekir.
*/

