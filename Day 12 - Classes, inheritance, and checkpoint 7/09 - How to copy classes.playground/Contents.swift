import Cocoa

/// # How to copy classes

/**
    In Swift, all copies of a class instance share the same data, meaning that any changes you make to one copy will automatically change the other copies. This happens because classes are reference types in Swift, which means all copies of a class all refer back to the same underlying pot of data.
    Swift'te bir sınıf örneğinin tüm kopyaları aynı verileri paylaşır, yani bir kopyada yaptığınız herhangi bir değişiklik otomatik olarak diğer kopyaları da değiştirir. Bunun nedeni, Swift'te sınıfların referans tipleri olmasıdır; yani bir sınıfın tüm kopyaları aynı temel veri kabına geri döner.

    To see this in action, try this simple class:
    Bunu uygulamada görmek için bu basit sınıfı deneyin:
*/

class User {
    var username = "Anonymous"
}

/**
    That has just one property, but because it’s stored inside a class it will get shared across all copies of the class.
    Bunun sadece bir özelliği vardır, ancak bir sınıfın içinde saklandığı için sınıfın tüm kopyalarında paylaşılacaktır.

    So, we could create an instance of that class:
    Böylece, bu sınıfın bir örneğini oluşturabiliriz:
*/

var user1 = User()

/**
    We could then take a copy of user1 and change the username value:
    Daha sonra user1'in bir kopyasını alabilir ve kullanıcı adı değerini değiştirebiliriz:
*/

var user2 = user1
user2.username = "Taylor"

/**
    I hope you see where this is going! Now we’ve changed the copy’s username property we can then print out the same properties from each different copy:
    Umarım bunun nereye gittiğini anlıyorsunuzdur! Şimdi kopyanın kullanıcı adı özelliğini değiştirdik, daha sonra her farklı kopyadan aynı özellikleri yazdırabiliriz:
*/

print(user1.username)
print(user2.username)

/**
 …and that’s going to print “Taylor” for both – even though we only changed one of the instances, the other also changed.
 ...ve bu her ikisi için de "Taylor" yazdıracak - örneklerden yalnızca birini değiştirmiş olsak da, diğeri de değişti.

 This might seem like a bug, but it’s actually a feature – and a really important feature too, because it’s what allows us to share common data across all parts of our app. As you’ll see, SwiftUI relies very heavily on classes for its data, specifically because they can be shared so easily.
 Bu bir hata gibi görünebilir, ancak aslında bir özelliktir - ve gerçekten de önemli bir özelliktir, çünkü uygulamamızın tüm bölümlerinde ortak verileri paylaşmamızı sağlayan şey budur. Göreceğiniz gibi SwiftUI, özellikle kolayca paylaşılabildikleri için verileri için sınıflara çok güveniyor.

 In comparison, structs do not share their data amongst copies, meaning that if we change class User to struct User in our code we get a different result: it will print “Anonymous” then “Taylor”, because changing the copy didn’t also adjust the original.
 Buna karşılık, struct'lar verilerini kopyalar arasında paylaşmaz, yani kodumuzda User sınıfını struct User olarak değiştirirsek farklı bir sonuç elde ederiz: kopyayı değiştirmek orijinali de değiştirmediği için önce "Anonymous" sonra "Taylor" yazdıracaktır.

 If you want to create a unique copy of a class instance – sometimes called a deep copy – you need to handle creating a new instance and copy across all your data safely.
 Bir sınıf örneğinin benzersiz bir kopyasını oluşturmak istiyorsanız - bazen derin kopya olarak adlandırılır - yeni bir örnek oluşturmayı ve tüm verilerinizi güvenli bir şekilde kopyalamayı ele almanız gerekir.
 
 In our case that’s straightforward:
 Bizim durumumuzda bu çok basit:
*/

class User2 {
    var username2 = "Anonymous"

    func copy() -> User2 {
        let user2 = User2()
        user2.username2 = username2
        return user2
    }
}

/**
 Now we can safely call copy() to get an object with the same starting data, but any future changes won’t impact the original.
 Artık aynı başlangıç verilerine sahip bir nesne elde etmek için copy() işlevini güvenle çağırabiliriz, ancak gelecekte yapılacak herhangi bir değişiklik orijinali etkilemeyecektir.
*/
