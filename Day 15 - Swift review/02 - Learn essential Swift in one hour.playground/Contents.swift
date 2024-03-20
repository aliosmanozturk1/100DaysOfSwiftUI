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



