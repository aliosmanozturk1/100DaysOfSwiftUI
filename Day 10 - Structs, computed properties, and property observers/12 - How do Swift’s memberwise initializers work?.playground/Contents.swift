import Cocoa

/// # How do Swift’s memberwise initializers work?
/// # Swift'in üyeli başlatıcıları nasıl çalışır?

// TAM ANLAMADIM

/**
 By default, all Swift structs get a synthesized memberwise initializer by default, which means that we automatically get an initializer that accepts values for each of the struct’s properties. This initializer makes structs easy to work with, but Swift does two further things that make it especially clever.
 Varsayılan olarak, tüm Swift struct'ları varsayılan olarak sentezlenmiş bir üyeli başlatıcı alır, bu da otomatik olarak struct'ın özelliklerinin her biri için değerleri kabul eden bir başlatıcı alacağımız anlamına gelir. Bu başlatıcı, struct'larla çalışmayı kolaylaştırır, ancak Swift onu özellikle akıllı yapan iki şey daha yapar.

 First, if any of your properties have default values, then they’ll be incorporated into the initializer as default parameter values. So, if I make a struct like this:
 İlk olarak, özelliklerinizden herhangi biri varsayılan değerlere sahipse, bunlar varsayılan parametre değerleri olarak başlatıcıya dahil edilecektir. Yani, eğer şöyle bir yapı oluşturursam:
*/

struct User {
    var name: String
    var yearsActive = 0
}

/**
    Sonra bu iki yoldan biriyle oluşturabilirim:
*/

struct Employee {
    var name: String
    var yearsActive = 0
}

let roslin = Employee(name: "Laura Roslin")
let adama = Employee(name: "William Adama", yearsActive: 45)

/**
    This makes them even easier to create, because you can fill in only the parts you need to.
    Bu, onları oluşturmayı daha da kolaylaştırır, çünkü yalnızca ihtiyacınız olan kısımları doldurabilirsiniz.

    The second clever thing Swift does is remove the memberwise initializer if you create an initializer of your own.
    Swift'in yaptığı ikinci akıllıca şey, kendi initializer'ınızı oluşturduğunuzda memberwise initializer'ı kaldırmaktır.

    For example, if I had a custom initializer that created anonymous employees, it would look like this:
    Örneğin, anonymous employees oluşturan özel bir başlatıcıya sahip olsaydım, şöyle görünürdü:
*/

struct Employee2 {
    var name: String
    var yearsActive = 0

    init() {
        self.name = "Anonymous"
        print("Creating an anonymous employee…")
    }
}

/**
    With that in place, I could no longer rely on the memberwise initializer, so this would no longer be allowed:
    Bu durumda, artık memberwise initializer'a güvenemezdim, bu yüzden buna artık izin verilmeyecekti:
*/

// let roslin2 = Employee2(name: "Laura Roslin")

/**
    This isn’t an accident, but it’s a deliberate feature: we created our own initializer, and if Swift left its memberwise initializer in place then it might be missing important work we put into our own initializer.
    Bu bir kaza değil, kasıtlı bir özelliktir: kendi başlatıcımızı oluşturduk ve Swift kendi üyeli başlatıcısını yerinde bırakırsa, kendi başlatıcımıza koyduğumuz önemli çalışmayı kaçırabilir.

    So, as soon as you add a custom initializer for your struct, the default memberwise initializer goes away. If you want it to stay, move your custom initializer to an extension, like this:
    Bu nedenle, yapınız için özel bir başlatıcı eklediğiniz anda, varsayılan üyeli başlatıcı ortadan kalkar. Eğer kalmasını istiyorsanız, özel başlatıcınızı aşağıdaki gibi bir uzantıya taşıyın:
 */

struct Employee3 {
    var name: String
    var yearsActive = 0
}

extension Employee3 {
    init() {
        self.name = "Anonymous"
        print("Creating an anonymous employee…")
    }
}

// creating a named employee now works
let roslin3 = Employee3(name: "Laura Roslin")
print(roslin3)

// as does creating an anonymous employee
let anon3 = Employee3()
print(anon3)
