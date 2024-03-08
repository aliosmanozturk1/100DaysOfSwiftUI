import Cocoa

/// # How to create custom initializers
/// # Özel ilklendiriciler (başlatıcı) nasıl oluşturulur

/**
    Initializers are specialized methods that are designed to prepare a new struct instance to be used. You’ve already seen how Swift silently generates one for us based on the properties we place inside a struct, but you can also create your own as long as you follow one golden rule: all properties must have a value by the time the initializer ends.
    Başlatıcılar, kullanılacak yeni bir struct örneği hazırlamak için tasarlanmış özel yöntemlerdir. Swift'in bir struct içine yerleştirdiğimiz özelliklere dayanarak bizim için nasıl sessizce bir tane oluşturduğunu zaten gördünüz, ancak bir altın kurala uyduğunuz sürece kendiniz de oluşturabilirsiniz: başlatıcı sona erdiğinde tüm özelliklerin bir değeri olmalıdır.
 
    Let’s start by looking again at Swift’s default initializer for structs:
    Swift'in struct'lar için varsayılan başlatıcısına tekrar bakarak başlayalım:
*/

struct Player {
    let name: String
    let number: Int
}

let player = Player(name: "Megan R", number: 15)

/**
    That creates a new Player instance by providing values for its two properties. Swift calls this the memberwise initializer, which is a fancy way of saying an initializer that accepts each property in the order it was defined.
    Bu, iki özelliği için değerler sağlayarak yeni bir Player örneği oluşturur. Swift buna, her özelliği tanımlandığı sırayla kabul eden bir başlatıcı demenin süslü bir yolu olan üyeli başlatıcı adını verir.

    Like I said, this kind of code is possible because Swift silently generates an initializer accepting those two values, but we could write our own to do the same thing. The only catch here is that you must be careful to distinguish between the names of parameters coming in and the names of properties being assigned.
    Dediğim gibi, Swift bu iki değeri kabul eden bir başlatıcıyı sessizce oluşturduğu için bu tür bir kod mümkündür, ancak aynı şeyi yapmak için kendimiz de yazabiliriz. Buradaki tek sorun, gelen parametrelerin adları ile atanan özelliklerin adları arasında ayrım yapmaya dikkat etmeniz gerektiğidir.

    Here’s how that would look:
    İşte böyle görünecek:
*/

struct Player2 {
    let name: String
    let number: Int

    init(name: String, number: Int) {
        self.name = name
        self.number = number
    }
}

/**
    That works the same as our previous code, except now the initializer is owned by us so we can add extra functionality there if needed.
    Bu, önceki kodumuzla aynı şekilde çalışır, ancak şimdi başlatıcı bize aittir, böylece gerekirse oraya ekstra işlevsellik ekleyebiliriz.

    However, there are a couple of things I want you to notice:
    Ancak, dikkat etmenizi istediğim birkaç husus var:
    - There is no func keyword. Yes, this looks like a function in terms of its syntax, but Swift treats initializers specially.
    - func anahtar sözcüğü yoktur. Evet, bu sözdizimi açısından bir fonksiyon gibi görünüyor, ancak Swift başlatıcılara özel davranıyor.

    - Even though this creates a new Player instance, initializers never explicitly have a return type – they always return the type of data they belong to.
    - Bu yeni bir Player örneği oluştursa da, başlatıcıların hiçbir zaman açıkça bir dönüş türü yoktur - her zaman ait oldukları veri türünü döndürürler.

    - I’ve used self to assign parameters to properties to clarify we mean “assign the name parameter to my name property”.
    - "name parametresini name özelliğime ata" demek istediğimizi netleştirmek için özelliklere parametre atamak için self kullandım.

    That last point is particularly important, because without self we’d have name = name and that doesn’t make sense – are we assigning the property to the parameter, assigning the parameter to itself, or something else? By writing self.name we’re clarifying we mean “the name property that belongs to my current instance,” as opposed to anything else.
    Bu son nokta özellikle önemlidir, çünkü self olmadan name = name olur ve bu mantıklı değildir - özelliği parametreye mi atıyoruz, parametreyi kendisine mi atıyoruz yoksa başka bir şey mi? self.name yazarak, başka bir şeyin aksine "mevcut örneğime ait olan name özelliğini" kastettiğimizi açıklığa kavuşturuyoruz.

    Of course, our custom initializers don’t need to work like the default memberwise initializer Swift provides us with. For example, we could say that you must provide a player name, but the shirt number is randomized:
    Elbette, özel başlatıcılarımızın Swift'in bize sağladığı varsayılan üyeli başlatıcı gibi çalışması gerekmez. Örneğin, bir oyuncu adı sağlamanız gerektiğini, ancak forma numarasının rastgele olduğunu söyleyebiliriz:
*/

struct Player3 {
    let name: String
    let number: Int

    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

let player3 = Player3(name: "Megan R")
print(player3.number)

/**
 Just remember the golden rule: all properties must have a value by the time the initializer ends. If we had not provided a value for number inside the initializer, Swift would refuse to build our code.
 Altın kuralı unutmayın: başlatıcı sona erdiğinde tüm özellikler bir değere sahip olmalıdır. Eğer başlatıcı içinde number için bir değer vermemiş olsaydık, Swift kodumuzu oluşturmayı reddedecekti.

 Important: Although you can call other methods of your struct inside your initializer, you can’t do so before assigning values to all your properties – Swift needs to be sure everything is safe before doing anything else.
 Önemli: Başlatıcınızın içinde struct'ınızın diğer yöntemlerini çağırabilseniz de, tüm özelliklerinize değer atamadan önce bunu yapamazsınız - Swift'in başka bir şey yapmadan önce her şeyin güvenli olduğundan emin olması gerekir.

 You can add multiple initializers to your structs if you want, as well as leveraging features such as external parameter names and default values. However, as soon as you implement your own custom initializers you’ll lose access to Swift’s generated memberwise initializer unless you take extra steps to retain it. This isn’t an accident: if you have a custom initializer, Swift effectively assumes that’s because you have some special way to initialize your properties, which means the default one should no longer be available.
 İsterseniz yapılarınıza birden fazla başlatıcı ekleyebilir, harici parametre adları ve varsayılan değerler gibi özelliklerden yararlanabilirsiniz. Ancak, kendi özel başlatıcılarınızı uyguladığınız anda, onu korumak için ekstra adımlar atmadığınız sürece Swift'in oluşturduğu üye bazında başlatıcıya erişiminizi kaybedersiniz. Bu bir tesadüf değildir: özel bir başlatıcınız varsa, Swift bunun nedeninin özelliklerinizi başlatmak için özel bir yolunuz olduğunu varsayar, bu da varsayılan başlatıcının artık kullanılamayacağı anlamına gelir.
*/
