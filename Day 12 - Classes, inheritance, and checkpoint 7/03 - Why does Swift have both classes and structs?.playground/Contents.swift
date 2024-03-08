import Cocoa

/// # Why does Swift have both classes and structs?

/**
    Classes and structs give Swift developers the ability to create custom, complex types with properties and methods, but they have five important differences:
    Sınıflar ve yapılar, Swift geliştiricilerine özellikleri ve yöntemleri olan özel, karmaşık türler oluşturma olanağı verir, ancak beş önemli farkları vardır:
    - Classes do not come with synthesized memberwise initializers.
    - Sınıflar sentezlenmiş üye bazında başlatıcılarla birlikte gelmez.

    - One class can be built upon (“inherit from”) another class, gaining its properties and methods.
    - Bir sınıf başka bir sınıf üzerine inşa edilebilir ("miras alınabilir"), özelliklerini ve yöntemlerini kazanabilir.

    - Copies of structs are always unique, whereas copies of classes actually point to the same shared data.
    - Yapıların kopyaları her zaman benzersizdir, oysa sınıfların kopyaları aslında aynı paylaşılan verilere işaret eder.

    - Classes have deinitializers, which are methods that are called when an instance of the class is destroyed, but structs do not.
    - Sınıflar, sınıfın bir örneği yok edildiğinde çağrılan yöntemler olan deinitializer'lara sahiptir, ancak struct'lar sahip değildir.

    - Variable properties in constant classes can be modified freely, but variable properties in constant structs cannot.
    - Sabit sınıflardaki değişken özellikler serbestçe değiştirilebilir, ancak sabit yapılardaki değişken özellikler değiştirilemez.

    I’ll explain these differences in more detail soon, but the point is that they exist and that they matter. Most Swift developers prefer to use structs rather than classes when possible, which means when you choose a class over a struct you’re doing so because you want one of the above behaviors.
    Bu farklılıkları yakında daha ayrıntılı olarak açıklayacağım, ancak asıl önemli olan bunların var olduğu ve önemli olduklarıdır. Çoğu Swift geliştiricisi mümkün olduğunda sınıflar yerine struct'ları kullanmayı tercih eder, bu da bir struct yerine bir sınıf seçtiğinizde bunu yukarıdaki davranışlardan birini istediğiniz için yaptığınız anlamına gelir.
*/


