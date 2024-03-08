import Cocoa

/// # How to create your own structs

/**
    Swift’s structs let us create our own custom, complex data types, complete with their own variables and their own functions.
    Swift'in struct'ları, kendi değişkenleri ve kendi işlevleriyle birlikte kendi özel, karmaşık veri türlerimizi oluşturmamıza olanak tanır.
*/

struct Album {
    let title: String
    let artist: String
    let year: Int

    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

/**
    That creates a new type called Album, with two string constants called title and artist, plus an integer constant called year. I also added a simple function that summarizes the values of our three constants.
    Bu, Albüm adında yeni bir tür oluşturur ve başlık ve sanatçı adında iki string sabiti ile yıl adında bir integer sabiti içerir. Ayrıca üç sabitimizin değerlerini özetleyen basit bir fonksiyon ekledim.

    Notice how Album starts with a capital A? That’s the standard in Swift, and we’ve been using it all along – think of String, Int, Bool, Set, and so on. When you’re referring to a data type, we use camel case where the first letter is uppercased, but when you’re referring to something inside the type, such as a variable or function, we use camel case where the first letter is lowercased. Remember, for the most part this is only a convention rather than a rule, but it’s a helpful one to stick with.
    Album'ün nasıl büyük A ile başladığına dikkat ettiniz mi? Bu Swift'te standarttır ve biz de başından beri bunu kullanıyoruz - String, Int, Bool, Set ve benzerlerini düşünün. Bir veri tipine atıfta bulunduğunuzda, ilk harfin büyük olduğu deve harfini kullanırız, ancak tipin içindeki bir değişken veya fonksiyon gibi bir şeye atıfta bulunduğunuzda, ilk harfin küçük olduğu deve harfini kullanırız. Unutmayın, bu çoğunlukla bir kuraldan ziyade sadece bir gelenektir, ancak bağlı kalmak için yararlı bir kuraldır.

    At this point, Album is just like String or Int – we can make them, assign values, copy them, and so on. For example, we could make a couple of albums, then print some of their values and call their functions:
    Bu noktada, Albüm tıpkı String veya Int gibidir - onları oluşturabilir, değer atayabilir, kopyalayabilir ve benzeri işlemleri yapabiliriz. Örneğin, birkaç albüm oluşturabilir, ardından bazı değerlerini yazdırabilir ve işlevlerini çağırabiliriz:
*/

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()
wings.printSummary()

/**
    Notice how we can create a new Album as if we were calling a function – we just need to provide values for each of the constants in the order they were defined.
    Bir fonksiyon çağırır gibi nasıl yeni bir Albüm oluşturabildiğimize dikkat edin - sadece her bir sabit için tanımlandıkları sırayla değerler sağlamamız gerekiyor.

    As you can see, both red and wings come from the same Album struct, but once we create them they are separate just like creating two strings.
    Gördüğünüz gibi, hem red hem de wings aynı Album yapısından geliyor, ancak onları oluşturduğumuzda, tıpkı iki string oluşturmak gibi ayrılar.

    You can see this in action when we call printSummary() on each struct, because that function refers to title, artist, and year. In both instances the correct values are printed out for each struct: red prints “Red (2012) by Taylor Swift” and wings prints out “Wings (2016) by BTS” – Swift understands that when printSummary() is called on red, it should use the title, artist, and year constants that also belong to red.
    Bunu her bir struct üzerinde printSummary() işlevini çağırdığımızda görebilirsiniz, çünkü bu işlev başlık, sanatçı ve yıla atıfta bulunur. Her iki durumda da her struct için doğru değerler yazdırılır: red, "Red (2012) by Taylor Swift" ve wings, "Wings (2016) by BTS" yazdırır - Swift, printSummary() fonksiyonu red üzerinde çağrıldığında, red'e ait olan title, artist ve year sabitlerini kullanması gerektiğini anlar.

    Where things get more interesting is when you want to have values that can change. For example, we could create an Employee struct that can take vacation as needed:
    İşlerin daha ilginç hale geldiği yer, değişebilen değerlere sahip olmak istediğiniz zamandır. Örneğin, gerektiğinde tatil yapabilen bir Employee struct'ı oluşturabiliriz:
*/

/**
    struct Employee {
     let name: String
     var vacationRemaining: Int

     func takeVacation(days: Int) {
         if vacationRemaining > days {
             vacationRemaining -= days
             print("I'm going on vacation!")
             print("Days remaining: \(vacationRemaining)")
         } else {
             print("Oops! There aren't enough days remaining.")
         }
     }
    }

    However, that won’t actually work – Swift will refuse to build the code.
    Ancak, bu aslında işe yaramayacaktır - Swift kodu derlemeyi reddedecektir.

    You see, if we create an employee as a constant using let, Swift makes the employee and all its data constant – we can call functions just fine, but those functions shouldn’t be allowed to change the struct’s data because we made it constant.
    Gördüğünüz gibi, let kullanarak bir çalışanı sabit olarak oluşturursak, Swift çalışanı ve tüm verilerini sabit hale getirir - fonksiyonları çağırabiliriz, ancak bu fonksiyonların struct'ın verilerini değiştirmesine izin verilmemelidir çünkü onu sabit hale getirdik.

    As a result, Swift makes us take an extra step: any functions that only read data are fine as they are, but any that change data belonging to the struct must be marked with a special mutating keyword, like this:
    Sonuç olarak, Swift fazladan bir adım atmamızı sağlar: yalnızca veri okuyan tüm fonksiyonlar oldukları gibi iyidir, ancak yapıya ait verileri değiştiren tüm fonksiyonlar, bunun gibi özel bir mutating anahtar sözcüğü ile işaretlenmelidir:
 */

struct Employee {
    let name: String
    var vacationRemaining: Int

    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}

/**
    Now our code will build just fine, but Swift will stop us from calling takeVacation() from constant structs.
    Artık kodumuz sorunsuz bir şekilde oluşturulacak, ancak Swift sabit struct'lardan takeVacation() işlevini çağırmamızı engelleyecektir.

    In code, this is allowed:
    Kodda buna izin verilir:
*/

var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
archer.takeVacation(days: 5)
print(archer.vacationRemaining)

/**
    But if you change var archer to let archer you’ll find Swift refuses to build your code again – we’re trying to call a mutating function on a constant struct, which isn’t allowed.
    Ancak var archer'ı let archer olarak değiştirirseniz Swift'in kodunuzu tekrar oluşturmayı reddettiğini göreceksiniz - sabit bir yapı üzerinde mutasyona uğrayan bir fonksiyon çağırmaya çalışıyoruz, buna izin verilmiyor.

    We’re going to explore structs in detail over the next few chapters, but first I want to give some names to things:
    Struct'ları önümüzdeki birkaç bölümde ayrıntılı olarak inceleyeceğiz, ancak önce bazı şeylere isim vermek istiyorum:
    - Variables and constants that belong to structs are called properties.
    - Struct'lara ait değişkenler ve sabitler properties (özellikler) olarak adlandırılır.

    Functions that belong to structs are called methods.
    Struct'lara ait olan fonksiyonlara method denir.
 
    When we create a constant or variable out of a struct, we call that an instance – you might create a dozen unique instances of the Album struct, for example.
    Bir struct'tan bir sabit veya değişken oluşturduğumuzda, buna instance diyoruz - örneğin Album struct'ının bir düzine benzersiz instance'ını oluşturabilirsiniz.

    When we create instances of structs we do so using an initializer like this: Album(title: "Wings", artist: "BTS", year: 2016).
    Struct'ların örneklerini oluştururken bunu aşağıdaki gibi bir initializer kullanarak yaparız: Album(title: "Wings", artist: "BTS", year: 2016).

    That last one might seem a bit odd at first, because we’re treating our struct like a function and passing in parameters. This is a little bit of what’s called syntactic sugar – Swift silently creates a special function inside the struct called init(), using all the properties of the struct as its parameters. It then automatically treats these two pieces of code as being the same:
    Sonuncusu ilk başta biraz garip görünebilir, çünkü yapımıza bir fonksiyon gibi davranıyor ve parametreler geçiriyoruz. Bu, syntactic sugar olarak adlandırılan şeyin bir parçasıdır - Swift sessizce struct'ın içinde init() adında özel bir fonksiyon yaratır ve struct'ın tüm özelliklerini parametre olarak kullanır. Daha sonra otomatik olarak bu iki kod parçasını aynı olarak değerlendirir:
*/

var archer1 = Employee(name: "Sterling Archer", vacationRemaining: 14)
var archer2 = Employee.init(name: "Sterling Archer", vacationRemaining: 14)

/**
    We actually relied on this behavior previously. Way back when I introduced Double for the first time, I explained that you can’t add an Int and a Double and instead need to write code like this:
    Aslında daha önce bu davranışa güveniyorduk. Double'ı ilk kez tanıttığımda, bir Int ile bir Double'ı toplayamayacağınızı ve bunun yerine aşağıdaki gibi bir kod yazmanız gerektiğini açıklamıştım:
*/

let a = 1
let b = 2.0
let c = Double(a) + b

/**
    Now you can see what’s really happening here: Swift’s own Double type is implemented as a struct, and has an initializer function that accepts an integer.
    Şimdi burada gerçekten ne olduğunu görebilirsiniz: Swift'in kendi Double tipi bir struct olarak uygulanır ve bir integer kabul eden bir initializer fonksiyonuna sahiptir.

    Swift is intelligent in the way it generates its initializer, even inserting default values if we assign them to our properties.
    Swift, initializer'ını oluşturma konusunda akıllıdır, hatta özelliklerimizi atadığımızda varsayılan değerleri bile ekler.

    For example, if our struct had these two properties
    Örneğin, struct'ımız şu iki özelliğe sahip olsaydı
 */

let name: String
var vacationRemaining = 14

/**
    Then Swift will silently generate an initializer with a default value of 14 for vacationRemaining, making both of these valid:
    Ardından Swift, holidayRemaining için varsayılan değeri 14 olan bir initializer'ı sessizce oluşturacak ve her ikisini de geçerli kılacaktır:
*/

let kane = Employee(name: "Lana Kane")
let poovey = Employee(name: "Pam Poovey", vacationRemaining: 35)

/**
    Tip: If you assign a default value to a constant property, that will be removed from the initializer entirely. To assign a default but leave open the possibility of overriding it when needed, use a variable property.
    İpucu: Sabit bir özelliğe varsayılan bir değer atarsanız, bu değer başlatıcıdan tamamen kaldırılır. Varsayılan bir değer atamak ancak gerektiğinde bunu geçersiz kılma olasılığını açık bırakmak için bir değişken özelliği kullanın.
*/
