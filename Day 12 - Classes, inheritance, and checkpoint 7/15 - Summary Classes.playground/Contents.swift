import Cocoa

/// # Summary: Classes

/**
    Classes aren’t quite as commonly used as structs, but they serve an invaluable purpose for sharing data, and if you ever choose to learn Apple’s older UIKit framework you’ll find yourself using them extensively.
    Sınıflar struct'lar kadar yaygın olarak kullanılmazlar, ancak veri paylaşımı için çok değerli bir amaca hizmet ederler ve Apple'ın eski UIKit çerçevesini öğrenmeyi seçerseniz, kendinizi bunları kapsamlı bir şekilde kullanırken bulacaksınız.
    Let’s recap what we learned:
    Öğrendiklerimizi özetleyelim:
    - Classes have lots of things in common with structs, including the ability to have properties and methods, but there are five key differences between classes and structs.
    - Sınıfların, özellik ve yöntemlere sahip olma becerisi de dahil olmak üzere yapılarla birçok ortak noktası vardır, ancak sınıflar ve yapılar arasında beş temel fark vardır.

    - First, classes can inherit from other classes, which means they get access to the properties and methods of their parent class. You can optionally override methods in child classes if you want, or mark a class as being final to stop others subclassing it.
    - İlk olarak, sınıflar diğer sınıflardan miras alabilir, bu da ana sınıflarının özelliklerine ve yöntemlerine erişebilecekleri anlamına gelir. İsterseniz alt sınıflardaki yöntemleri geçersiz kılabilir veya başkalarının alt sınıf oluşturmasını engellemek için bir sınıfı nihai olarak işaretleyebilirsiniz.

    - Second, Swift doesn’t generate a memberwise initializer for classes, so you need to do it yourself. If a subclass has its own initializer, it must always call the parent class’s initializer at some point.
    - İkinci olarak, Swift sınıflar için üye bazında bir ilklendirici oluşturmaz, bu yüzden bunu kendiniz yapmanız gerekir. Bir alt sınıfın kendi ilklendiricisi varsa, her zaman bir noktada ana sınıfın ilklendiricisini çağırmalıdır.

    - Third, if you create a class instance then take copies of it, all those copies point back to the same instance. This means changing some data in one of the copies changes them all.
    - Üçüncü olarak, bir sınıf örneği oluşturup kopyalarını alırsanız, tüm bu kopyalar aynı örneğe geri döner. Bu, kopyalardan birindeki bazı verilerin değiştirilmesinin hepsini değiştirdiği anlamına gelir.

    - Fourth, classes can have deinitializers that run when the last copy of one instance is destroyed.
    - Dördüncü olarak, sınıflar bir örneğin son kopyası yok edildiğinde çalışan deinitializer'lara sahip olabilir.

    - Finally, variable properties inside class instances can be changed regardless of whether the instance itself was created as variable.
    - Son olarak, sınıf örneklerinin içindeki değişken özellikleri, örneğin kendisinin değişken olarak oluşturulup oluşturulmadığına bakılmaksızın değiştirilebilir.
*/
