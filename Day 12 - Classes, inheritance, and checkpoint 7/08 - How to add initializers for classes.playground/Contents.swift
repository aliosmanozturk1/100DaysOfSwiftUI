import Cocoa

/// # How to add initializers for classes
/// # Sınıflar için başlatıcılar nasıl eklenir

/**
    Class initializers in Swift are more complicated than struct initializers, but with a little cherrypicking we can focus on the part that really matters: if a child class has any custom initializers, it must always call the parent’s initializer after it has finished setting up its own properties, if it has any.
    Swift'teki sınıf ilklendiricileri struct ilklendiricilerinden daha karmaşıktır, ancak biraz seçme yaparak gerçekten önemli olan kısma odaklanabiliriz: bir alt sınıfın herhangi bir özel ilklendiricisi varsa, varsa kendi özelliklerini ayarlamayı bitirdikten sonra her zaman ebeveynin ilklendiricisini çağırmalıdır.

    Like I said previously, Swift won’t automatically generate a memberwise initializer for classes. This applies with or without inheritance happening – it will never generate a memberwise initializer for you. So, you either need to write your own initializer, or provide default values for all the properties of the class.
    Daha önce de söylediğim gibi, Swift sınıflar için otomatik olarak üye bazında bir ilklendirici oluşturmaz. Bu durum kalıtım olsa da olmasa da geçerlidir - sizin için asla üyelere yönelik bir ilklendirici oluşturmaz. Dolayısıyla, ya kendi ilklendiricinizi yazmanız ya da sınıfın tüm özellikleri için varsayılan değerler sağlamanız gerekir.

    Let’s start by defining a new class:
    Yeni bir sınıf tanımlamakla başlayalım:
*/

class Vehicle {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

/**
    That has a single Boolean property, plus an initializer to set the value for that property. Remember, using self here makes it clear we’re assigning the isElectric parameter to the property of the same name.
    Bunun tek bir Boolean özelliği ve bu özelliğin değerini ayarlamak için bir başlatıcısı vardır. Unutmayın, burada self kullanarak isElectric parametresini aynı isimli özelliğe atadığımızı açıkça belirtiyoruz.

    Now, let’s say we wanted to make a Car class inheriting from Vehicle – you might start out writing something like this:
    Şimdi, diyelim ki Vehicle'dan miras alan bir Car sınıfı yapmak istedik - şöyle bir şey yazmaya başlayabilirsiniz:
 
     class Car: Vehicle {
         let isConvertible: Bool

         init(isConvertible: Bool) {
             self.isConvertible = isConvertible
         }
     }

    But Swift will refuse to build that code: we’ve said that the Vehicle class needs to know whether it’s electric or not, but we haven’t provided a value for that.
    Ancak Swift bu kodu oluşturmayı reddedecektir: Vehicle sınıfının elektrikli olup olmadığını bilmesi gerektiğini söyledik, ancak bunun için bir değer sağlamadık.

    What Swift wants us to do is provide Car with an initializer that includes both isElectric and isConvertible, but rather than trying to store isElectric ourselves we instead need to pass it on – we need to ask the super class to run its own initializer.
    Swift'in bizden istediği şey Car'a hem isElectric hem de isConvertible içeren bir başlatıcı sağlamaktır, ancak isElectric'i kendimiz saklamaya çalışmak yerine onu aktarmamız gerekir - süper sınıftan kendi başlatıcısını çalıştırmasını istememiz gerekir.

    Here’s how that looks:
    İşte böyle görünüyor:
*/

class Car: Vehicle {
    let isConvertible: Bool

    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

/**
    super is another one of those values that Swift automatically provides for us, similar to self: it allows us to call up to methods that belong to our parent class, such as its initializer. You can use it with other methods if you want; it’s not limited to initializers.
    super, Swift'in self'e benzer şekilde bizim için otomatik olarak sağladığı değerlerden bir diğeridir: initializer gibi ana sınıfımıza ait yöntemleri çağırmamızı sağlar. İsterseniz bunu diğer metotlarla da kullanabilirsiniz; sadece initializer'larla sınırlı değildir.

    Now that we have a valid initializer in both our classes, we can make an instance of Car like so:
    Artık her iki sınıfımızda da geçerli bir initializer'ımız olduğuna göre, Car'ın bir örneğini şu şekilde oluşturabiliriz:
*/

let teslaX = Car(isElectric: true, isConvertible: false)

/**
    Tip: If a subclass does not have any of its own initializers, it automatically inherits the initializers of its parent class.
    İpucu: Bir alt sınıfın kendi başlatıcıları yoksa, otomatik olarak ana sınıfının başlatıcılarını devralır.
*/
