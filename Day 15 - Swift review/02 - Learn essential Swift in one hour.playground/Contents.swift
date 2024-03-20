import Cocoa

/// # Learn essential Swift in one hour
/// # Bir saat içinde temel Swift'i öğrenin

// ****************************************************************************


/// # Creating constants and variables

/// Swift can create constants and variables, but constants are generally preferable
/// Swift sabitler ve değişkenler oluşturabilir, ancak sabitler genellikle tercih edilir

/// Use this to create then change a variable string:
/// Bir değişken stringi oluşturmak ve sonra değiştirmek için bunu kullanın:

var name = "Ted"
name = "Rebecca"

/// If you don’t want to change a value, use a constant instead:
/// Bir değeri değiştirmek istemiyorsanız, bunun yerine bir sabit kullanın:

let user = "Daphne"

/// The print() function is helpful for learning and debugging, and shows some information about a variable:
/// print() fonksiyonu, öğrenme ve hata ayıklama için faydalıdır ve bir değişken hakkında bazı bilgiler gösterir:

print(user)


// ****************************************************************************


/// # Strings

/// Swift’s strings start and end with double quotes:
/// Swift'in stringleri çift tırnak ile başlar ve biter:

let actor = "Tom Cruise"

/// And they work great with emoji too:
/// Ve emoji ile de harika çalışıyorlar:

let actor2 = "Tom Cruise 🏃‍♂️"

/// If you want double quotes inside your string, place a backslash before them:
/// String'inizin içinde çift tırnak olmasını istiyorsanız, önlerine ters eğik çizgi koyun:

let quote = "He tapped a sign saying \"Believe\" and walked away."

/// If you want a string that spans multiple lines, start and end with three double quotes, like this:
/// Birden fazla satıra yayılan bir string istiyorsanız, aşağıdaki gibi üç çift tırnak ile başlayın ve bitirin:

let movie = """
A day in
the life of an
Apple engineer
"""

/// Swift provides many useful properties and methods for strings, including .count to read how many letters it has:
/// Swift, stringler için kaç harf olduğunu okumak için .count dahil olmak üzere birçok yararlı özellik ve metot sağlar:

print(actor.count)

/// There are also hasPrefix() and hasSuffix(), which lets us know whether a string starts or ends with specific letters:
/// Ayrıca, bir stringin belirli harflerle başlayıp başlamadığını veya bitip bitmediğini bilmemizi sağlayan hasPrefix() ve hasSuffix() de vardır:

print(quote.hasPrefix("He"))
print(quote.hasSuffix("Away."))

/// Important: Strings are case-sensitive in Swift, so that second check will return false.
/// Önemli: Swift'te stringler büyük/küçük harfe duyarlıdır, bu nedenle ikinci kontrol false dönecektir.


// ****************************************************************************


/// # Integers

/// Swift stores whole numbers using the type Int, which supports a range of standard mathematical operators:
/// Swift, bir dizi standart matematiksel operatörü destekleyen Int türünü kullanarak tam sayıları saklar:

let score = 10
let higherScore = score + 10
let halvedScore = score / 2

/// It also supports compound assignment operators that modify variables in place:
/// Ayrıca değişkenleri yerinde değiştiren bileşik atama operatörlerini de destekler:

var counter = 10
counter += 5

/// Integers come with their own useful functionality, such as the isMultiple(of:) method:
/// Integer'lar, isMultiple(of:) metodu gibi kendi kullanışlı fonksiyonlarıyla birlikte gelir:

let number = 120
print(number.isMultiple(of: 3))

/// You can also make random integers in a specific range, like this:
/// Bunun gibi belirli bir aralıkta rastgele tam sayılar da oluşturabilirsiniz:

let id = Int.random(in: 1...1000)


// ****************************************************************************


/// # Decimals

/// If you create a number with a decimal point, Swift will consider it a Double:
/// Ondalık noktalı bir sayı oluşturursanız, Swift bunu bir Double olarak kabul edecektir:

let score2 = 3.0

/// Swift considers Double to be a wholly different type of data to Int, and won’t let you mix them together.
/// Swift, Double'ı Int'ten tamamen farklı bir veri türü olarak kabul eder ve bunları birbirine karıştırmanıza izin vermez.


// ****************************************************************************


/// # Booleans

/// Swift uses the type Bool to store true or false:
/// Swift, doğru veya yanlışı saklamak için Bool türünü kullanır:

let goodDogs = true
let gameOver = false

/// You can flip a Boolean from true to false by calling its toggle() method:
/// Bir Boolean'ı toggle() yöntemini çağırarak true'dan false'a çevirebilirsiniz:

var isSaved = false
isSaved.toggle()


// ****************************************************************************


/// # Joining strings

/// You can create strings out of other data using string interpolation: write a backslash inside your string, then place the name of a variable or constant inside parentheses, like this:
/// String interpolasyonunu kullanarak diğer verilerden stringler oluşturabilirsiniz: stringinizin içine bir ters eğik çizgi yazın, ardından bir değişkenin veya sabitin adını parantez içine yerleştirin, bunun gibi:

let name2 = "Taylor"
let age = 26
let message = "I'm \(name2) and I'm \(age) years old."
print(message)

/// When that code runs, it will print “I’m Taylor and I’m 26 years old.”
/// Bu kod çalıştığında, "I’m Taylor and I’m 26 years old." yazacaktır.


// ****************************************************************************


/// # Arrays

/// You can group items into an array like this:
/// Öğeleri aşağıdaki gibi bir dizi halinde gruplayabilirsiniz:

var colors = ["Red", "Green", "Blue"]
let numbers = [4, 8, 15, 16]
var readings = [0.1, 0.5, 0.8]

/// Each of those hold different kinds of data: one strings, one integers, and one decimals. When we read data from arrays we will get the appropriate type back - a String, an Int, or a Double:
/// Bunların her biri farklı veri türlerini tutar: biri stringler, biri tamsayılar ve biri de ondalık sayılar. Dizilerden veri okuduğumuzda uygun türü geri alırız - bir String, bir Int veya bir Double:

print(colors[0])
print(readings[2])

/// Tip: Make sure an item exists at the index you’re asking for, otherwise your code will crash – your app will just stop working.
/// İpucu: İstediğiniz dizinde bir öğe bulunduğundan emin olun, aksi takdirde kodunuz çökecektir - uygulamanız çalışmayı durduracaktır.

/// If your array is variable, you can use append() to add new items:
/// Diziniz değişkense, yeni öğeler eklemek için append() işlevini kullanabilirsiniz:

colors.append("Tartan")

/// The type of data you add must match whatever was already in there.
/// Eklediğiniz veri türü zaten orada olanla eşleşmelidir.

/// Arrays have useful functionality, such as .count to read how many items are in an array, or remove(at:) to remove one item at a specific index:
/// Diziler, bir dizide kaç öğe olduğunu okumak için .count veya belirli bir dizindeki bir öğeyi kaldırmak için remove(at:) gibi kullanışlı işlevlere sahiptir:

colors.remove(at: 0)
print(colors.count)

/// You can check whether an array contains a particular item by using contains(), like this:
/// Bir dizinin belirli bir öğeyi içerip içermediğini contains() metodunu kullanarak kontrol edebilirsiniz:

print(colors.contains("Octarine"))


// ****************************************************************************


/// # Dictionaries

/// Dictionaries store multiple values according to a key we specify. For example, we could create a dictionary to store information about a person:
/// Sözlükler, belirlediğimiz bir anahtara göre birden fazla değeri depolar. Örneğin, bir kişi hakkındaki bilgileri saklamak için bir sözlük oluşturabiliriz:

let employee = [
    "name": "Taylor",
    "job": "Singer"
]

/// To read data from the dictionary, use the same keys you used when creating it:
/// Sözlükten veri okumak için, sözlüğü oluştururken kullandığınız anahtarları kullanın:

print(employee["name", default: "Unknown"])
print(employee["job", default: "Unknown"])

/// The default value will be used if the key we’ve asked for doesn’t exist.
/// İstediğimiz anahtar mevcut değilse default değer kullanılacaktır.


// ****************************************************************************


/// # Sets

/// Sets are similar to arrays, except you can’t add duplicate items, and they don’t store items in a particular order.
/// Kümeler, yinelenen öğeler ekleyememeniz ve öğeleri belirli bir sırada saklamamaları dışında dizilere benzer.

/// This makes a set of numbers:
/// Bu bir dizi sayı oluşturur:

var numbers2 = Set([1, 1, 3, 5, 7])
print(numbers2)

/// Remember, the set will ignore duplicate values, and it won’t remember the order used in the array.
/// Kümenin yinelenen değerleri yok sayacağını ve dizide kullanılan sırayı hatırlamayacağını unutmayın.

/// Adding items to a set is done by calling its insert() method, like this:
/// Bir kümeye öğe eklemek, aşağıdaki gibi insert() yöntemini çağırarak yapılır:

numbers2.insert(10)

/// Sets have one big advantage over arrays: using contains() on a set is effectively instant no matter how many items the set contains – even a set with 10,000,000 items will respond instantly.
/// Kümelerin dizilere göre büyük bir avantajı vardır: bir kümede contains() işlevini kullanmak, kümenin kaç öğe içerdiğine bakılmaksızın etkili bir şekilde anında gerçekleşir - 10.000.000 öğeli bir küme bile anında yanıt verecektir.


// ****************************************************************************


/// # Enums

/// An enum is a set of named values we can create and use to make our code more efficient and safer. For example, we could make an enum of weekdays like this:
/// Bir enum, kodumuzu daha verimli ve daha güvenli hale getirmek için oluşturup kullanabileceğimiz adlandırılmış değerler kümesidir. Örneğin, aşağıdaki gibi bir hafta içi gün enumu oluşturabiliriz:

enum Weekday {
    case monday, tuesday, wednesday, thursday, friday
}

/// That calls the new enum Weekday, and provides five cases to handle the five weekdays.
/// Bu, yeni enum Weekday'i çağırır ve haftanın beş gününü işlemek için beş durum sağlar.

/// We can now make instances of that enum, then assign other possible cases to it:
/// Artık bu enum'un örneklerini oluşturabilir, ardından diğer olası durumları ona atayabiliriz:

var day = Weekday.monday
day = .friday


// ****************************************************************************


/// # Type annotations

/// You can try to force a specific type for a new variable or constant by using type annotation like this:
/// Yeni bir değişken veya sabit için type annotation kullanarak belirli bir türü zorlamayı deneyebilirsiniz:

var score3: Double = 0

/// Without the : Double part Swift would infer that to be an Int, but we’re overriding that and saying it’s a Double.
/// Double kısmı olmadan Swift bunun bir Int olduğu sonucuna varırdı, ancak biz bunu geçersiz kılıyoruz ve bunun bir Double olduğunu söylüyoruz.

/// Here are some type annotations based on the types covered so far:
/// İşte şu ana kadar ele alınan türlere dayalı bazı tür açıklamaları:

let player: String = "Roy"
var luckyNumber: Int = 13
let pi: Double = 3.141
var isEnabled: Bool = true
var albums: Array<String> = ["Red", "Fearless"]
var user2: Dictionary<String, String> = ["id": "@twostraws"]
var books: Set<String> = Set(["The Bluest Eye", "Foundation"])

/// Arrays and dictionaries are so common that they have special syntax that is easier to write:
/// Diziler ve sözlükler o kadar yaygındır ki, yazılması daha kolay olan özel sözdizimine sahiptirler:

var albums2: [String] = ["Red", "Fearless"]
var user3: [String: String] = ["id": "@twostraws"]

/// Knowing the exact types of things is important for creating empty collections. For example, both of these create empty string arrays:
/// Boş koleksiyonlar oluşturmak için nesnelerin tam türlerini bilmek önemlidir. Örneğin, bunların her ikisi de boş dize dizileri oluşturur:

var teams: [String] = [String]()
var clues = [String]()

/// Values of an enum have the same type as the enum itself, so we could write this:
/// Bir enum'un değerleri enum'un kendisiyle aynı türe sahiptir, bu nedenle bunu yazabiliriz:

enum UIStyle {
    case light, dark, system
}

var style: UIStyle = .light


// ****************************************************************************


/// # Conditions

/// Use if, else, and else if statements to check a condition and run some code as appropriate:
/// Bir koşulu kontrol etmek ve uygun şekilde bazı kodları çalıştırmak için if, else ve else if deyimlerini kullanın:

let age2 = 16

if age2 < 12 {
    print("You can't vote")
} else if age2 < 18 {
    print("You can vote soon.")
} else {
    print("You can vote now.")
}

/// We can use && to combine two conditions, and the whole condition will only be true if the two parts inside are true:
/// İki koşulu birleştirmek için && kullanabiliriz ve tüm koşul yalnızca içindeki iki parça doğruysa doğru olur:

let temp = 26

if temp > 20 && temp < 30 {
    print("It's a nice day.")
}

/// Alternatively, || will make a condition be true if either subcondition is true.
/// Alternatif olarak, || alt koşullardan biri doğruysa bir koşulun doğru olmasını sağlar.


// ****************************************************************************


/// # Switch statements

/// Swift lets us check a value against multiple conditions using switch/case syntax, like this:
/// Swift, switch/case sözdizimini kullanarak bir değeri birden fazla koşula karşı kontrol etmemizi sağlar:

enum Weather {
    case sun, rain, wind
}

let forecast = Weather.sun

switch forecast {
case .sun:
    print("A nice day.")
case .rain:
    print("Pack an umbrella.")
default:
    print("Should be okay.")
}

/// switch statements must be exhaustive: all possible values must be handled so you can’t miss one by accident.
/// switch deyimleri kapsamlı olmalıdır: olası tüm değerler ele alınmalıdır, böylece kazara birini kaçıramazsınız.


// ****************************************************************************


/// # The ternary conditional operator

/// The ternary operator lets us check a condition and return one of two values: something if the condition is true, and something if it’s false:
/// Üçlü işleç, bir koşulu kontrol etmemizi ve iki değerden birini döndürmemizi sağlar: koşul doğruysa bir şey, yanlışsa bir şey:

let age3 = 18
let canVote = age3 >= 18 ? "Yes" : "No"

/// When that code runs, canVote will be set to “Yes” because age is set to 18.
/// Bu kod çalıştığında, canVote "Evet" olarak ayarlanacaktır çünkü yaş 18 olarak ayarlanmıştır.


// ****************************************************************************


/// # Loops

/// Swift’s for loops run some code for every item in a collection, or in a custom range. For example:
/// Swift'in for döngüleri, bir koleksiyondaki veya özel bir aralıktaki her öğe için bazı kodlar çalıştırır. Örneğin:

let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
    print("Swift works on \(os).")
}

/// You can also loop over a range of numbers:
/// Ayrıca bir sayı aralığı üzerinde de döngü yapabilirsiniz:

for i in 1...12 {
    print("5 x \(i) is \(5 * i)")
}

///  1...12 contains the values 1 through 12 inclusive. If you want to exclude the final number, use ..< instead:
///  1...12, 1'den 12'ye kadar olan değerleri içerir. Son sayıyı hariç tutmak istiyorsanız, bunun yerine ..< kullanın:

for i in 1..<13 {
    print("5 x \(i) is \(5 * i)")
}

/// Tip: If you don’t need the loop variable, use _:
/// İpucu: Döngü değişkenine ihtiyacınız yoksa _ kullanın:

var lyric = "Haters gonna"

for _ in 1...5 {
    lyric += " hate"
}

print(lyric)

/// There are also while loops, which execute their loop body until a condition is false, like this:
/// Ayrıca, bir koşul yanlış olana kadar döngü gövdesini çalıştıran while döngüleri de vardır, bunun gibi:

var count = 10

while count > 0 {
    print("\(count)…")
    count -= 1
}

print("Go!")

/// You can use continue to skip the current loop iteration and proceed to the following one:
/// Geçerli döngü yinelemesini atlamak ve bir sonrakine geçmek için continue kullanabilirsiniz:

let files = ["me.jpg", "work.txt", "sophie.jpg"]

for file in files {
    if file.hasSuffix(".jpg") == false {
        continue
    }

    print("Found picture: \(file)")
}

/// Alternatively, use break to exit a loop and skip all remaining iterations.
/// Alternatif olarak, bir döngüden çıkmak ve kalan tüm yinelemeleri atlamak için break kullanın.


// ****************************************************************************


/// # Functions

/// To create a new function, write func followed by your function’s name, then add parameters inside parentheses:
/// Yeni bir fonksiyon oluşturmak için, func yazıp ardından fonksiyonunuzun adını yazın, ardından parantez içine parametreleri ekleyin:

func printTimesTables(number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5)

/// We need to write number: 5 at the call site, because the parameter name is part of the function call.
/// Parametre adı fonksiyon çağrısının bir parçası olduğu için çağrı yerine sayı: 5 yazmamız gerekir.

/// To return data from a function, tell Swift what type it is, then use the return keyword to send it back. For example, this returns a dice roll:
/// Bir fonksiyondan veri döndürmek için Swift'e verinin ne tür olduğunu söyleyin, ardından geri göndermek için return anahtar sözcüğünü kullanın. Örneğin, bu bir zar atışı döndürür:

func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)

/// If your function contains only a single line of code, you can remove the return keyword:
/// İşleviniz yalnızca tek bir kod satırı içeriyorsa, return anahtar sözcüğünü kaldırabilirsiniz:

func rollDice2() -> Int {
    Int.random(in: 1...6)
}


// ****************************************************************************


/// # Returning multiple values from functions

/// Tuples store a fixed number of values of specific types, which is a convenient way to return multiple values from a function:
/// Tuple'lar belirli türlerde sabit sayıda değer depolar ve bu da bir fonksiyondan birden fazla değer döndürmek için uygun bir yoldur:

func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let user4 = getUser()
print("Name: \(user4.firstName) \(user4.lastName)")

/// If you don’t need all the values from the tuple you can destructure the tuple to pull it apart into individual values, then _ to tell Swift to ignore some:
/// Tuple'daki tüm değerlere ihtiyacınız yoksa, tuple'ı tek tek değerlere ayırmak için yıkabilir, ardından Swift'e bazılarını göz ardı etmesini söylemek için _ yapabilirsiniz:

let (firstName, _) = getUser()
print("Name: \(firstName)")


// ****************************************************************************


/// # Customizing parameter labels

/// If you don’t want to pass a parameter’s name when calling a function, place an underscore before it:
/// Bir işlevi çağırırken parametrenin adını geçmek istemiyorsanız, parametrenin önüne bir alt çizgi koyun:

func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO, WORLD"
let result2 = isUppercase(string)

/// An alternative is to write a second name before the first: one to use externally, and one internally:
/// Bir alternatif de ilk adın önüne ikinci bir ad yazmaktır: biri harici olarak, diğeri dahili olarak kullanılmak üzere:

func printTimesTables(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5)

/// In that code for is used externally, and number is used internally.
/// Bu kodda for harici olarak, number ise dahili olarak kullanılır.


// ****************************************************************************


/// # Providing default values for parameters

/// We can provide default parameter values by writing an equals after the type then providing a value, like this:
/// Varsayılan parametre değerlerini, türden sonra bir eşittir yazarak ve ardından aşağıdaki gibi bir değer sağlayarak sağlayabiliriz:

func greet(_ person: String, formal: Bool = false) {
    if formal {
        print("Welcome, \(person)!")
    } else {
        print("Hi, \(person)!")
    }
}

/// Now we can call greet() in two ways:
/// Şimdi greet() işlevini iki şekilde çağırabiliriz:

greet("Tim", formal: true)
greet("Taylor")


// ****************************************************************************


/// # Handling errors in functions

/// To handle errors in functions you need to tell Swift which errors can happen, write a function that can throw errors, then call it and handle any problems.
/// Fonksiyonlardaki hataları ele almak için Swift'e hangi hataların olabileceğini söylemeniz, hata atabilen bir fonksiyon yazmanız, ardından bu fonksiyonu çağırmanız ve sorunları ele almanız gerekir.

/// First, define the errors that can occur:
/// İlk olarak, oluşabilecek hataları tanımlayın:

enum PasswordError: Error {
    case short, obvious
}

/// Next, write a function that can throw errors. This is done by placing throws into the function’s type, then by using throw to trigger specific errors:
/// Ardından, hata fırlatabilen bir fonksiyon yazın. Bu, fonksiyonun türüne throw yerleştirerek ve ardından belirli hataları tetiklemek için throw kullanarak yapılır:

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }

    if password == "12345" {
        throw PasswordError.obvious
    }

    if password.count < 10 {
        return "OK"
    } else {
        return "Good"
    }
}

/// Now call the throwing function by starting a do block, calling the function using try, then catching errors that occur:
/// Şimdi bir do bloğu başlatarak fırlatma işlevini çağırın, try kullanarak işlevi çağırın ve ardından oluşan hataları yakalayın:

let string2 = "12345"

do {
    let result = try checkPassword(string)
    print("Rating: \(result)")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error.")
}

/// When it comes to catching errors, you must always have a catch block that can handle every kind of error.
/// Hataları yakalamak söz konusu olduğunda, her zaman her tür hatayı ele alabilecek bir catch bloğuna sahip olmalısınız.


// ****************************************************************************


/// # Closures

/// You can assign functionality directly to a constant or variable like this:
/// İşlevselliği doğrudan bir sabite veya değişkene şu şekilde atayabilirsiniz:

let sayHello = {
    print("Hi there!")
}

sayHello()

/// In that code, sayHello is a closure – a chunk of code we can pass around and call whenever we want. If you want the closure to accept parameters, they must be written inside the braces:
