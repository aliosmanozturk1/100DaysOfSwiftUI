import Cocoa

/// # How to use opaque return types
/// # Opak geri dönüş türleri nasıl kullanılır?

/**
    Swift provides one really obscure, really complex, but really important feature called opaque return types, which let us remove complexity in our code. Honestly I wouldn’t cover it in a beginners course if it weren’t for one very important fact: you will see it immediately as soon as you create your very first SwiftUI project.
    Swift, kodumuzdaki karmaşıklığı ortadan kaldırmamızı sağlayan opak dönüş türleri adı verilen gerçekten belirsiz, gerçekten karmaşık ama gerçekten önemli bir özellik sunar. Dürüst olmak gerekirse, çok önemli bir şey olmasa bunu yeni başlayanlar için bir kursta ele almazdım: ilk SwiftUI projenizi oluşturur oluşturmaz bunu hemen göreceksiniz.

    Important: You don’t need to understand in detail how opaque return types work, only that they exist and do a very specific job. As you’re following along here you might start to wonder why this feature is useful, but trust me: it is important, and it is useful, so try to power through!
    Önemli: Opak dönüş türlerinin nasıl çalıştığını ayrıntılı olarak anlamanıza gerek yok, sadece var olduklarını ve çok özel bir iş yaptıklarını bilmeniz yeterli. Burayı takip ederken bu özelliğin neden yararlı olduğunu merak etmeye başlayabilirsiniz, ancak bana güvenin: önemli ve yararlı, bu yüzden devam etmeye çalışın!

    Let’s implement two simple functions:
    İki basit fonksiyon uygulayalım:
*/

func getRandomNumber() -> Int {
    Int.random(in: 1...6)
}

func getRandomBool() -> Bool {
    Bool.random()
}

/**
    Tip: Bool.random() returns either true or false. Unlike random integers and decimals, we don’t need to specify any parameters because there are no customization options.
    İpucu: Bool.random() işlevi doğru veya yanlış döndürür. Rastgele tamsayılar ve ondalık sayıların aksine, özelleştirme seçenekleri olmadığından herhangi bir parametre belirtmemize gerek yoktur.

    So, getRandomNumber() returns a random integer, and getRandomBool() returns a random Boolean.
    Böylece getRandomNumber() rastgele bir tamsayı ve getRandomBool() rastgele bir Boolean döndürür.

    Both Int and Bool conform to a common Swift protocol called Equatable, which means “can be compared for equality.” The Equatable protocol is what allows us to use ==, like this:
    Hem Int hem de Bool, Equatable adı verilen ve "eşitlik için karşılaştırılabilir" anlamına gelen ortak bir Swift protokolüne uygundur. Equatable protokolü, == ifadesini kullanmamızı sağlayan şeydir:
*/

print(getRandomNumber() == getRandomNumber())

/**
    Because both of these types conform to Equatable, we could try amending our function to return an Equatable value, like this:
    Bu türlerin her ikisi de Equatable'a uygun olduğundan, fonksiyonumuzu Equatable değeri döndürecek şekilde değiştirmeyi deneyebiliriz:
*/

/**
 
    func getRandomNumber() -> Equatable {
        Int.random(in: 1...6)
    }

    func getRandomBool() -> Equatable {
        Bool.random()
    }

    However, that code won’t work, and Swift will throw up an error message that is unlikely to be helpful at this point in your Swift career: “protocol 'Equatable' can only be used as a generic constraint because it has Self or associated type requirements”. What Swift’s error means is that returning Equatable doesn’t make sense, and understanding why it doesn’t make sense is the key to understanding opaque return types.
    Ancak, bu kod çalışmayacak ve Swift, Swift kariyerinizin bu noktasında yardımcı olması muhtemel olmayan bir hata mesajı verecektir: "protokol 'Equatable' yalnızca genel bir kısıtlama olarak kullanılabilir çünkü Self veya ilişkili tür gereksinimleri vardır". Swift'in hatasının anlamı, Equatable döndürmenin mantıklı olmadığıdır ve neden mantıklı olmadığını anlamak, opak dönüş türlerini anlamanın anahtarıdır.


    First up: yes, you can return protocols from functions, and often it’s a really helpful thing to do. For example, you might have a function that finds car rentals for users: it accepts the number of passengers that it needs to carry, along with how much luggage they want, but it might send back one of several structs: Compact, ‌SUV, Minivan, and so on.
    İlk olarak: evet, fonksiyonlardan protokoller döndürebilirsiniz ve genellikle bu gerçekten yararlı bir şeydir. Örneğin, kullanıcılar için kiralık araba bulan bir işleviniz olabilir: taşıması gereken yolcu sayısını ve ne kadar bagaj istediklerini kabul eder, ancak birkaç yapıdan birini geri gönderebilir: Kompakt, SUV, Minivan vb.

    We can handle this by returning a Vehicle protocol that is adopted by all those structs, and so whoever calls the function will get back some kind of car matching their request without us having to write 10 different functions to handle all car varieties. Each of those car types will implement all the methods and properties of Vehicle, which means they are interchangeable – from a coding perspective we don’t care which of the options we get back.
    Bunu, tüm bu yapılar tarafından benimsenen bir Vehicle protokolü döndürerek halledebiliriz ve böylece işlevi çağıran kişi, tüm araba çeşitlerini işlemek için 10 farklı işlev yazmamıza gerek kalmadan istekleriyle eşleşen bir tür araba geri alacaktır. Bu araba türlerinin her biri Vehicle'ın tüm yöntemlerini ve özelliklerini uygulayacaktır, bu da birbirlerinin yerine kullanılabilecekleri anlamına gelir - kodlama açısından hangi seçenekleri geri aldığımız umurumuzda değildir.

    Now think about sending back an Int or a Bool. Yes, both conform to Equatable, but they aren’t interchangeable – we can’t use == to compare an Int and a Bool, because Swift won’t let us regardless of what protocols they conform to.
    Şimdi bir Int veya bir Bool göndermeyi düşünün. Evet, her ikisi de Equatable'a uygundur, ancak birbirlerinin yerine kullanılamazlar - bir Int ve bir Bool'u karşılaştırmak için == kullanamayız, çünkü Swift hangi protokollere uyduklarına bakılmaksızın bize izin vermez.

    Returning a protocol from a function is useful because it lets us hide information: rather than stating the exact type that is being returned, we get to focus on the functionality that is returned. In the case of a Vehicle protocol, that might mean reporting back the number of seats, the approximate fuel usage, and a price. This means we can change our code later without breaking things: we could return a RaceCar, or a PickUpTruck, etc, as long as they implement the properties and methods required by Vehicle.
    Bir fonksiyondan bir protokol döndürmek kullanışlıdır çünkü bilgileri gizlememize olanak tanır: döndürülen tam türü belirtmek yerine, döndürülen işlevselliğe odaklanabiliriz. Bir Araç protokolü söz konusu olduğunda bu, koltuk sayısını, yaklaşık yakıt kullanımını ve bir fiyatı geri bildirmek anlamına gelebilir. Bu, kodumuzu daha sonra bir şeyleri bozmadan değiştirebileceğimiz anlamına gelir: Vehicle'ın gerektirdiği özellikleri ve yöntemleri uyguladıkları sürece bir RaceCar veya bir PickUpTruck vb. döndürebiliriz.

    Hiding information in this way is really useful, but it just isn’t possible with Equatable because it isn’t possible to compare two different Equatable things. Even if we call getRandomNumber() twice to get two integers, we can’t compare them because we’ve hidden their exact data type – we’ve hidden the fact that they are two integers that actually could be compared.
    Bu şekilde bilgi gizlemek gerçekten yararlıdır, ancak Equatable ile mümkün değildir, çünkü iki farklı Equatable şeyi karşılaştırmak mümkün değildir. İki tamsayı elde etmek için getRandomNumber() işlevini iki kez çağırsak bile, tam veri türlerini gizlediğimiz için bunları karşılaştıramayız - bunların gerçekten karşılaştırılabilecek iki tamsayı olduğu gerçeğini gizledik.

    This is where opaque return types come in: they let us hide information in our code, but not from the Swift compiler. This means we reserve the right to make our code flexible internally so that we can return different things in the future, but Swift always understands the actual data type being returned and will check it appropriately.
    Opak geri dönüş tipleri burada devreye girer: kodumuzdaki bilgileri gizlememize izin verirler, ancak Swift derleyicisinden gizlemezler. Bu, kodumuzu dahili olarak esnek hale getirme hakkımızı saklı tuttuğumuz anlamına gelir, böylece gelecekte farklı şeyler döndürebiliriz, ancak Swift her zaman döndürülen gerçek veri türünü anlar ve uygun şekilde kontrol eder.

    To upgrade our two functions to opaque return types, add the keyword some before their return type, like this:
    İki fonksiyonumuzu opak dönüş tipine yükseltmek için, dönüş tiplerinden önce some anahtar sözcüğünü aşağıdaki gibi ekleyin:
*/

func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

/**
 And now we can call getRandomNumber() twice and compare the results using ==. From our perspective we still only have some Equatable data, but Swift knows that behind the scenes they are actually two integers.
 Ve şimdi getRandomNumber() fonksiyonunu iki kez çağırabilir ve == kullanarak sonuçları karşılaştırabiliriz. Bizim bakış açımızdan hala sadece Equatable verimiz var, ancak Swift perde arkasında bunların aslında iki tamsayı olduğunu biliyor.

 Returning an opaque return type means we still get to focus on the functionality we want to return rather than the specific type, which in turn allows us to change our mind in the future without breaking the rest of our code. For example, getRandomNumber() could switch to using Double.random(in:) and the code would still work great.
 Opak bir dönüş türü döndürmek, belirli bir tür yerine döndürmek istediğimiz işlevselliğe odaklanmaya devam edeceğimiz anlamına gelir; bu da gelecekte kodumuzun geri kalanını bozmadan fikrimizi değiştirmemize olanak tanır. Örneğin, getRandomNumber() kodu Double.random(in:) kullanmaya geçebilir ve kod hala harika çalışır.

 But the advantage here is that Swift always knows the real underlying data type. It’s a subtle distinction, but returning Vehicle means "any sort of Vehicle type but we don't know what", whereas returning some Vehicle means "a specific sort of Vehicle type but we don't want to say which one.”
 Ancak buradaki avantaj, Swift'in her zaman altta yatan gerçek veri türünü bilmesidir. Bu ince bir ayrımdır, ancak Vehicle döndürmek "herhangi bir Vehicle türü ama ne olduğunu bilmiyoruz" anlamına gelirken, some Vehicle döndürmek "belirli bir Vehicle türü ama hangisi olduğunu söylemek istemiyoruz" anlamına gelir.

 At this point I expect your head is spinning, so let me give you a real example of why this matters in SwiftUI. SwiftUI needs to know exactly what kind of layout you want to show on the screen, and so we write code to describe it.
 Bu noktada başınızın döndüğünü tahmin ediyorum, bu yüzden size SwiftUI'de bunun neden önemli olduğuna dair gerçek bir örnek vereyim. SwiftUI'nin ekranda ne tür bir düzen göstermek istediğinizi tam olarak bilmesi gerekiyor ve bu yüzden bunu tanımlamak için kod yazıyoruz.

 In English, we might say something like this: “there’s a screen with a toolbar at the top, a tab bar at the bottom, and in the middle is a scrolling grid of color icons, each of which has a label below saying what the icon means written in a bold font, and when you tap an icon a message appears.”
 İngilizce olarak şöyle bir şey söyleyebiliriz: "Üstte bir araç çubuğu, altta bir sekme çubuğu ve ortada renkli simgelerden oluşan kayan bir ızgara bulunan bir ekran var, bunların her birinin altında kalın bir yazı tipiyle yazılmış simgenin ne anlama geldiğini belirten bir etiket var ve bir simgeye dokunduğunuzda bir mesaj beliriyor."

 When SwiftUI asks for our layout, that description – the whole thing – becomes the return type for the layout. We need to be explicit about every single thing we want to show on the screen, including positions, colors, font sizes, and more. Can you imagine typing that as your return type? It would be a mile long! And every time you changed the code to generate your layout, you’d need to change the return type to match.
 SwiftUI düzenimizi sorduğunda, bu açıklama - her şey - düzen için dönüş türü haline gelir. Konumlar, renkler, yazı tipi boyutları ve daha fazlası dahil olmak üzere ekranda göstermek istediğimiz her şey hakkında açık olmamız gerekir. Bunu dönüş türünüz olarak yazdığınızı hayal edebiliyor musunuz? Bir mil uzunluğunda olurdu! Ve düzeninizi oluşturmak için kodu her değiştirdiğinizde, dönüş türünü eşleşecek şekilde değiştirmeniz gerekirdi.

 This is where opaque return types come to the rescue: we can return the type some View, which means that some kind of view screen will be returned but we don’t want to have to write out its mile-long type. At the same time, Swift knows the real underlying type because that’s how opaque return types work: Swift always knows the exact type of data being sent back, and SwiftUI will use that to create its layouts.
 İşte bu noktada opak dönüş tipleri imdadımıza yetişiyor: some View tipini döndürebiliriz, bu da bir tür görünüm ekranının döndürüleceği anlamına gelir, ancak bunun kilometrelerce uzunluğundaki tipini yazmak zorunda kalmak istemeyiz. Aynı zamanda Swift altta yatan gerçek türü bilir çünkü opak dönüş türleri bu şekilde çalışır: Swift her zaman geri gönderilen verinin tam türünü bilir ve SwiftUI bunu düzenlerini oluşturmak için kullanır.

 Like I said at the beginning, opaque return types are a really obscure, really complex, but really important feature, and I wouldn’t cover them in a beginners course if it weren’t for the fact that they are used extensively in SwiftUI.
 Başta da söylediğim gibi, opak dönüş tipleri gerçekten belirsiz, gerçekten karmaşık ama gerçekten önemli bir özelliktir ve SwiftUI'de yoğun olarak kullanılıyor olmasalardı yeni başlayanlar için bir kursta bunları ele almazdım.

 So, when you see some View in your SwiftUI code, it’s effectively us telling Swift “this is going to send back some kind of view to lay out, but I don’t want to write out the exact thing – you figure it out for yourself.”
 Dolayısıyla, SwiftUI kodunuzda some View gördüğünüzde, Swift'e "bu, düzenlemek için bir tür görünüm gönderecek, ancak tam olarak ne olduğunu yazmak istemiyorum - bunu kendiniz çözün" demiş oluyoruz.
 */

print(getRandomNumber() == getRandomNumber())
