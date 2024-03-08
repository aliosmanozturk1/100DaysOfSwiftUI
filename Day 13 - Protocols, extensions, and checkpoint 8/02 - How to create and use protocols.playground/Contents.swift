import Cocoa

/// # How to create and use protocols

/**
    Protocols are a bit like contracts in Swift: they let us define what kinds of functionality we expect a data type to support, and Swift ensures that the rest of our code follows those rules.
    Protokoller Swift'teki sözleşmeler gibidir: bir veri türünün ne tür işlevleri desteklemesini beklediğimizi tanımlamamızı sağlarlar ve Swift kodumuzun geri kalanının bu kurallara uymasını sağlar.

    Think about how we might write some code to simulate someone commuting from their home to their office. We might create a small Car struct, then write a function like this:
    Evinden ofisine gidip gelen birini simüle etmek için nasıl bir kod yazabileceğimizi düşünün. Küçük bir Araba yapısı oluşturabilir, ardından aşağıdaki gibi bir fonksiyon yazabiliriz:
 
    func commute(distance: Int, using vehicle: Car) {
        // lots of code here
    }
 
    Of course, they might also commute by train, so we’d also write this:
    Tabii ki trenle de gidip geliyor olabilirler, o zaman bunu da yazarız:

    func commute(distance: Int, using vehicle: Train) {
        // lots of code here
    }
 
    Or they might travel by bus:
    Ya da otobüsle seyahat edebilirler:

    func commute(distance: Int, using vehicle: Bus) {
        // lots of code here
    }
 
    Or they might use a bike, an e-scooter, a ride share, or any number of other transport options.
    Ya da bisiklet, e-scooter, araç paylaşımı veya diğer ulaşım seçeneklerinden herhangi birini kullanabilirler.

    The truth is that at this level we don’t actually care how the underlying trip happens. What we care about is much broader: how long might it take for the user to commute using each option, and how to perform the actual act of moving to the new location.
    Gerçek şu ki, bu seviyede aslında temel yolculuğun nasıl gerçekleştiğiyle ilgilenmiyoruz. Önemsediğimiz şey çok daha geniştir: kullanıcının her bir seçeneği kullanarak işe gidip gelmesi ne kadar sürebilir ve yeni konuma taşınma eylemi nasıl gerçekleştirilir.

    This is where protocols come in: they let us define a series of properties and methods that we want to use. They don’t implement those properties and methods – they don’t actually put any code behind it – they just say that the properties and methods must exist, a bit like a blueprint.
    Protokoller burada devreye girer: kullanmak istediğimiz bir dizi özellik ve yöntemi tanımlamamıza izin verirler. Bu özellikleri ve yöntemleri uygulamazlar - aslında arkasına herhangi bir kod koymazlar - sadece özelliklerin ve yöntemlerin var olması gerektiğini söylerler, tıpkı bir plan gibi.

    For example, we could define a new Vehicle protocol like this:
    Örneğin, aşağıdaki gibi yeni bir Araç protokolü tanımlayabiliriz:
*/

protocol Vehicle {
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

/**
    Let’s break that down:
    - To create a new protocol we write protocol followed by the protocol name. This is a new type, so we need to use camel case starting with an uppercase letter.
    - Yeni bir protokol oluşturmak için protokol yazıp ardından protokol adını yazıyoruz. Bu yeni bir türdür, bu nedenle büyük harfle başlayan camel case kullanmamız gerekir.

    - Inside the protocol we list all the methods we require in order for this protocol to work the way we expect.
    - Protokolün içinde, bu protokolün beklediğimiz şekilde çalışması için ihtiyaç duyduğumuz tüm metotları listeliyoruz.

    - These methods do not contain any code inside – there are no function bodies provided here. Instead, we’re specifying the method names, parameters, and return types. You can also mark methods as being throwing or mutating if needed.
    - Bu metotların içinde herhangi bir kod bulunmaz - burada sağlanan herhangi bir fonksiyon gövdesi yoktur. Bunun yerine, yöntem adlarını, parametreleri ve dönüş türlerini belirtiyoruz. Gerekirse yöntemleri fırlatma veya mutasyon olarak da işaretleyebilirsiniz.

    So we’ve made a protocol – how has that helped us?
    Yani bir protokol yaptık - bu bize nasıl yardımcı oldu?

    Well, now we can design types that work with that protocol. This means creating new structs, classes, or enums that implement the requirements for that protocol, which is a process we call adopting or conforming to the protocol.
    Artık bu protokolle çalışan tipler tasarlayabiliriz. Bu, söz konusu protokolün gerekliliklerini uygulayan yeni yapılar, sınıflar veya enumlar oluşturmak anlamına gelir; bu da protokolü benimseme veya protokole uyma olarak adlandırdığımız bir süreçtir.

    The protocol doesn’t specify the full range of functionality that must exist, only a bare minimum. This means when you create new types that conform to the protocol you can add all sorts of other properties and methods as needed.
    Protokol, var olması gereken tüm işlevselliği belirtmez, yalnızca asgari düzeyde bir işlevsellik belirtir. Bu, protokole uygun yeni türler oluşturduğunuzda, gerektiğinde her türlü başka özellik ve metodu ekleyebileceğiniz anlamına gelir.

    For example, we could make a Car struct that conforms to Vehicle, like this:
    Örneğin, aşağıdaki gibi Vehicle ile uyumlu bir Car yapısı oluşturabiliriz:
 */

struct Car: Vehicle {
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }

    func openSunroof() {
        print("It's a nice day!")
    }
}

/**
 There are a few things I want to draw particular attention to in that code:
 Bu kodda özellikle dikkat çekmek istediğim birkaç husus var:

 We tell Swift that Car conforms to Vehicle by using a colon after the name Car, just like how we mark subclasses.
 Tıpkı alt sınıfları işaretlediğimiz gibi, Car adından sonra iki nokta üst üste kullanarak Swift'e Car'ın Vehicle'a uygun olduğunu söylüyoruz.
 
 All the methods we listed in Vehicle must exist exactly in Car. If they have slightly different names, accept different parameters, have different return types, etc, then Swift will say we haven’t conformed to the protocol.
 Vehicle'da listelediğimiz tüm metotlar Car'da da aynen bulunmalıdır. Eğer biraz farklı isimlere sahip olurlarsa, farklı parametreler kabul ederlerse, farklı geri dönüş tiplerine sahip olurlarsa, Swift protokole uymadığımızı söyleyecektir.
 
 The methods in Car provide actual implementations of the methods we defined in the protocol. In this case, that means our struct provides a rough estimate for how many minutes it takes to drive a certain distance, and prints a message when travel() is called.
 Car'daki yöntemler, protokolde tanımladığımız yöntemlerin gerçek uygulamalarını sağlar. Bu durumda, yapımız belirli bir mesafenin kaç dakika sürdüğünü kabaca tahmin eder ve travel() çağrıldığında bir mesaj yazdırır.
 
 The openSunroof() method doesn’t come from the Vehicle protocol, and doesn’t really make sense there because many vehicle types don’t have a sunroof. But that’s okay, because the protocol describes only the minimum functionality conforming types must have, and they can add their own as needed.
 openSunroof() metodu Vehicle protokolünden gelmiyor ve birçok araç tipinde sunroof bulunmadığı için orada bir anlam ifade etmiyor. Ancak bu sorun değil, çünkü protokol yalnızca uyumlu türlerin sahip olması gereken minimum işlevselliği tanımlar ve gerektiğinde kendi işlevlerini ekleyebilirler.
 
 So, now we’ve created a protocol, and made a Car struct that conforms to the protocol.
 Şimdi bir protokol oluşturduk ve protokole uygun bir Car struct'ı yaptık.

 To finish off, let’s update the commute() function from earlier so that it uses the new methods we added to Car:
 Bitirmek için, daha önceki commute() fonksiyonunu Car'a eklediğimiz yeni metotları kullanacak şekilde güncelleyelim:
 */

func commute(distance: Int, using vehicle: Car) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

let car = Car()
commute(distance: 100, using: car)

/**
 That code all works, but here the protocol isn’t actually adding any value. Yes, it made us implement two very specific methods inside Car, but we could have done that without adding the protocol, so why bother?
 Bu kodun hepsi çalışıyor, ancak burada protokol aslında herhangi bir değer katmıyor. Evet, Car'ın içinde çok özel iki yöntem uygulamamızı sağladı, ancak bunu protokolü eklemeden de yapabilirdik, öyleyse neden uğraşalım?
 
 Here comes the clever part: Swift knows that any type conforming to Vehicle must implement both the estimateTime() and travel() methods, and so it actually lets us use Vehicle as the type of our parameter rather than Car. We can rewrite the function to this:
 İşte akıllıca kısım geliyor: Swift, Vehicle'a uyan herhangi bir türün hem estimateTime() hem de travel() yöntemlerini uygulaması gerektiğini bilir ve bu nedenle aslında parametremizin türü olarak Car yerine Vehicle kullanmamıza izin verir. Fonksiyonu şu şekilde yeniden yazabiliriz:
 */

func commute2(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

let car2 = Car()
commute2(distance: 100, using: car)

/**
 Now we’re saying this function can be called with any type of data, as long as that type conforms to the Vehicle protocol. The body of the function doesn’t need to change, because Swift knows for sure that the estimateTime() and travel() methods exist.
 Şimdi bu fonksiyonun, Vehicle protokolüne uygun olduğu sürece herhangi bir veri türüyle çağrılabileceğini söylüyoruz. Swift, estimateTime() ve travel() yöntemlerinin var olduğundan emin olduğu için işlevin gövdesinin değişmesi gerekmez.

 If you’re still wondering why this is useful, consider the following struct:
 Bunun neden yararlı olduğunu hala merak ediyorsanız, aşağıdaki yapıyı göz önünde bulundurun:
 */

struct Bicycle: Vehicle {
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }

    func travel(distance: Int) {
        print("I'm cycling \(distance)km.")
    }
}

let bike = Bicycle()
commute2(distance: 50, using: bike)

/**
    Now we have a second struct that also conforms to Vehicle, and this is where the power of protocols becomes apparent: we can now either pass a Car or a Bicycle into the commute() function. Internally the function can have all the logic it wants, and when it calls estimateTime() or travel() Swift will automatically use the appropriate one – if we pass in a car it will say “I’m driving”, but if we pass in a bike it will say “I’m cycling”.
    Şimdi elimizde Vehicle ile uyumlu ikinci bir struct var ve protokollerin gücü burada ortaya çıkıyor: commute() fonksiyonuna artık bir Car ya da bir Bicycle geçirebiliriz. İşlev dahili olarak istediği tüm mantığa sahip olabilir ve estimateTime() veya travel() işlevlerini çağırdığında Swift otomatik olarak uygun olanı kullanacaktır - eğer bir araba geçirirsek "araba kullanıyorum" diyecektir, ancak bir bisiklet geçirirsek "bisiklet sürüyorum" diyecektir.

    So, protocols let us talk about the kind of functionality we want to work with, rather than the exact types. Rather than saying “this parameter must be a car”, we can instead say “this parameter can be anything at all, as long as it’s able to estimate travel time and move to a new location.”
    Dolayısıyla protokoller, tam türler yerine çalışmak istediğimiz işlevsellik türü hakkında konuşmamıza izin verir. "Bu parametre bir araba olmalıdır" demek yerine, "bu parametre, seyahat süresini tahmin edebildiği ve yeni bir konuma geçebildiği sürece herhangi bir şey olabilir" diyebiliriz.

    As well as methods, you can also write protocols to describe properties that must exist on conforming types. To do this, write var, then a property name, then list whether it should be readable and/or writeable.
    Yöntemlerin yanı sıra, uyumlu türlerde bulunması gereken özellikleri tanımlamak için protokoller de yazabilirsiniz. Bunu yapmak için, var yazın, ardından bir özellik adı yazın, ardından okunabilir ve/veya yazılabilir olup olmadığını listeleyin.

    For example, we could specify that all types that conform Vehicle must specify how many seats they have and how many passengers they currently have, like this:
    Örneğin, Araç'a uyan tüm tiplerin kaç koltuğa sahip olduklarını ve şu anda kaç yolcuya sahip olduklarını belirtmeleri gerektiğini şu şekilde belirtebiliriz:
*/

protocol Vehicle2 {
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

/**
    That adds two properties:
    Bu iki özellik ekler:
    - A string called name, which must be readable. That might mean it’s a constant, but it might also be a computed property with a getter.
    - Okunabilir olması gereken name adlı bir dize. Bu, bir sabit olduğu anlamına gelebilir, ancak bir getter ile hesaplanmış bir özellik de olabilir.

    - An integer called currentPassengers, which must be read-write. That might mean it’s a variable, but it might also be a computed property with a getter and setter.
    - currentPassengers adında, okuma-yazma özelliğine sahip olması gereken bir tamsayı. Bu bir değişken olduğu anlamına gelebilir, ancak bir getter ve setter ile hesaplanmış bir özellik de olabilir.

    Type annotation is required for both of them, because we can’t provide a default value in a protocol, just like how protocols can’t provide implementations for methods.
    Tip ek açıklaması her ikisi için de gereklidir, çünkü bir protokolde varsayılan bir değer sağlayamayız, tıpkı protokollerin yöntemler için uygulama sağlayamaması gibi.

    With those two extra requirements in place, Swift will warn us that both Car and Bicycle no longer conform to the protocol because they are missing the properties. To fix that, we could add the following properties to Car:
    Bu iki ekstra gereklilikle birlikte Swift, Car ve Bicycle'ın özelliklerinin eksik olması nedeniyle artık protokole uymadığı konusunda bizi uyaracaktır. Bunu düzeltmek için Car'a aşağıdaki özellikleri ekleyebiliriz:

        let name = "Car"
        var currentPassengers = 1

    And these to Bicycle:
    Ve bunlar da Bisiklet'e:

        let name = "Bicycle"
        var currentPassengers = 1
*/

struct Car2: Vehicle2 {
    let name = "Car"
    var currentPassengers = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }

    func openSunroof() {
        print("It's a nice day!")
    }
}

struct Bicycle2: Vehicle2 {
    let name = "Bicycle"
    var currentPassengers = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }

    func travel(distance: Int) {
        print("I'm cycling \(distance)km.")
    }
}

/**
 Again, though, you could replace those with computed properties as long as you obey the rules – if you use { get set } then you can’t conform to the protocol using a constant property.
 Yine de, kurallara uyduğunuz sürece bunları hesaplanan özelliklerle değiştirebilirsiniz - { get set } kullanırsanız, sabit bir özellik kullanarak protokole uyamazsınız.

 So now our protocol requires two methods and two properties, meaning that all conforming types must implement those four things in order for our code to work. This in turn means Swift knows for sure that functionality is present, so we can write code relying on it.
 Şimdi protokolümüz iki yöntem ve iki özellik gerektiriyor, yani kodumuzun çalışması için tüm uyumlu türlerin bu dört şeyi uygulaması gerekiyor. Bu da Swift'in işlevselliğin mevcut olduğundan emin olduğu anlamına gelir, böylece ona güvenerek kod yazabiliriz.

 For example, we could write a method that accepts an array of vehicles and uses it to calculate estimates across a range of options:
 Örneğin, bir dizi araç kabul eden ve bunu bir dizi seçenek üzerinden tahminleri hesaplamak için kullanan bir yöntem yazabiliriz:
*/

func getTravelEstimates(using vehicles: [Vehicle2], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}

/**
    I hope that shows you the real power of protocols – we accept a whole array of the Vehicle protocol, which means we can pass in a Car, a Bicycle, or any other struct that conforms to Vehicle, and it will automatically work:
    Umarım bu size protokollerin gerçek gücünü gösterir - bir dizi Vehicle protokolünü kabul ediyoruz, bu da bir Araba, Bisiklet veya Vehicle'a uyan herhangi bir yapıyı aktarabileceğimiz ve otomatik olarak çalışacağı anlamına geliyor:
*/

let car3 = Car2()
commute2(distance: 100, using: car)

let bike3 = Bicycle2()
commute2(distance: 50, using: bike)

getTravelEstimates(using: [car3, bike3], distance: 150)

/**
 As well as accepting protocols as parameters, you can also return protocols from a function if needed.
 Protokolleri parametre olarak kabul etmenin yanı sıra, gerekirse bir fonksiyondan protokolleri de döndürebilirsiniz.

 Tip: You can conform to as many protocols as you need, just by listing them one by one separated with a comma. If you ever need to subclass something and conform to a protocol, you should put the parent class name first, then write your protocols afterwards.
 İpucu: Sadece virgülle ayırarak tek tek listeleyerek istediğiniz kadar protokole uyabilirsiniz. Bir şeyin alt sınıfını oluşturmanız ve bir protokole uymanız gerekirse, önce üst sınıf adını yazmalı, ardından protokollerinizi yazmalısınız.
 */
