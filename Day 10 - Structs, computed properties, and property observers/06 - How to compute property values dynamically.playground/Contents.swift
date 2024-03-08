import Cocoa

/// # How to compute property values dynamically
/// # Özellik değerleri dinamik olarak nasıl hesaplanır?

// PEK ANLAMADIM DAHA SONRA TEKRAR BAK YA DA BAŞKA KAYNAKLARDAN BAK

/**
    Structs can have two kinds of property: a stored property is a variable or constant that holds a piece of data inside an instance of the struct, and a computed property calculates the value of the property dynamically every time it’s accessed. This means computed properties are a blend of both stored properties and functions: they are accessed like stored properties, but work like functions.
    Struct'lar iki tür özelliğe sahip olabilir: saklanan özellik, struct'ın bir örneği içinde bir veri parçasını tutan bir değişken veya sabittir ve hesaplanan özellik, özelliğe her erişildiğinde özelliğin değerini dinamik olarak hesaplar. Bu, hesaplanan özelliklerin hem saklanan özelliklerin hem de fonksiyonların bir karışımı olduğu anlamına gelir: saklanan özellikler gibi erişilirler, ancak fonksiyonlar gibi çalışırlar.

    As an example, previously we had an Employee struct that could track how many days of vacation remained for that employee. Here’s a simplified version:
    Örnek olarak, daha önce o çalışan için kaç gün tatil kaldığını takip edebilen bir Employee struct'ımız vardı. İşte basitleştirilmiş bir versiyon:
*/

struct Employee {
    let name: String
    var vacationRemaining: Int
}

var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
archer.vacationRemaining -= 5
print(archer.vacationRemaining)
archer.vacationRemaining -= 3
print(archer.vacationRemaining)

/**
 That works as a trivial struct, but we’re losing valuable information – we’re assigning this employee 14 days of vacation then subtracting them as days are taken, but in doing so we’ve lost how many days they were originally granted.
 Bu önemsiz bir yapı olarak işe yarıyor, ancak değerli bilgileri kaybediyoruz - bu çalışana 14 günlük tatil atıyoruz, ardından günler alındıkça bunları çıkarıyoruz, ancak bunu yaparken başlangıçta kaç gün verildiğini kaybediyoruz.
 
 We could adjust this to use computed property, like so:
 Bunu, hesaplanmış özelliği kullanacak şekilde ayarlayabiliriz:
*/

struct Employee2 {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0

    var vacationRemaining: Int {
        vacationAllocated - vacationTaken
    }
}

/**
 Now rather than making vacationRemaining something we can assign to directly, it is instead calculated by subtracting how much vacation they have taken from how much vacation they were allotted.
 Artık vacationRemaining'i doğrudan atayabileceğimiz bir şey yapmak yerine, ne kadar tatil yaptıklarını kendilerine ayrılan tatil miktarından çıkararak hesaplanıyor.

 When we’re reading from vacationRemaining, it looks like a regular stored property:
 vacationRemaining'den okuduğumuzda, normal bir depolanmış özellik gibi görünür:
*/

var archer2 = Employee2(name: "Sterling Archer", vacationAllocated: 14)
archer2.vacationTaken += 4
print(archer2.vacationRemaining)
archer2.vacationTaken += 4
print(archer2.vacationRemaining)

/**
 This is really powerful stuff: we’re reading what looks like a property, but behind the scenes Swift is running some code to calculate its value every time.
 Bu gerçekten güçlü bir şey: bir property gibi görünen şeyi okuyoruz, ancak perde arkasında Swift her seferinde değerini hesaplamak için bazı kodlar çalıştırıyor.

 We can’t write to it, though, because we haven’t told Swift how that should be handled. To fix that, we need to provide both a getter and a setter – fancy names for “code that reads” and “code that writes” respectively.
 Yine de ona yazamayız çünkü Swift'e bunun nasıl ele alınması gerektiğini söylemedik. Bunu düzeltmek için hem bir getter hem de bir setter sağlamamız gerekiyor - sırasıyla "okuyan kod" ve "yazan kod" için süslü isimler.

 In this case the getter is simple enough, because it’s just our existing code. But the setter is more interesting – if you set vacationRemaining for an employee, do you mean that you want their vacationAllocated value to be increased or decreased, or should vacationAllocated stay the same and instead we change vacationTaken?
 Bu durumda getter yeterince basittir, çünkü sadece mevcut kodumuzdur. Ancak setter daha ilginçtir - bir çalışan için vacationRemaining değerini ayarlarsanız, vacationAllocated değerinin artırılmasını veya azaltılmasını mı istiyorsunuz, yoksa vacationAllocated aynı kalmalı ve bunun yerine vacationTaken değerini mi değiştirmeliyiz?

 I’m going to assume the first of those two is correct, in which case here’s how the property would look:
 Bu ikisinden ilkinin doğru olduğunu varsayacağım, bu durumda property şu şekilde görünecektir:
 
 var vacationRemaining: Int {
     get {
         vacationAllocated - vacationTaken
     }

     set {
         vacationAllocated = vacationTaken + newValue
     }
 }
 
 Notice how get and set mark individual pieces of code to run when reading or writing a value. More importantly, notice newValue – that’s automatically provided to us by Swift, and stores whatever value the user was trying to assign to the property.
 get ve set'in bir değeri okurken veya yazarken çalıştırılacak ayrı kod parçalarını nasıl işaretlediğine dikkat edin. Daha da önemlisi, newValue'ya dikkat edin - bu bize Swift tarafından otomatik olarak sağlanır ve kullanıcının özelliğe atamaya çalıştığı değeri saklar.

 With both a getter and setter in place, we can now modify vacationRemaining:
 Hem getter hem de setter'ı yerleştirdikten sonra, şimdi vacationRemaining'i değiştirebiliriz:
 
 var archer = Employee(name: "Sterling Archer", vacationAllocated: 14)
 archer.vacationTaken += 4
 archer.vacationRemaining = 5
 print(archer.vacationAllocated)
 
 SwiftUI uses computed properties extensively – you’ll see them in the very first project you create!
 SwiftUI hesaplanmış özellikleri yoğun olarak kullanır - bunları oluşturduğunuz ilk projede göreceksiniz!
*/

struct Employee3 {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0

    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var archer3 = Employee3(name: "Sterling Archer", vacationAllocated: 14)
archer3.vacationTaken += 4
archer3.vacationRemaining = 5
print(archer3.vacationAllocated)
