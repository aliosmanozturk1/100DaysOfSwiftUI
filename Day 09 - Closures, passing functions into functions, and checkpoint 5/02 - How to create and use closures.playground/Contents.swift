import Cocoa

/// # How to create and use closures
/// # Kapanışlar (Closure) nasıl oluşturulur ve kullanılır

/// Functions are powerful things in Swift. Yes, you’ve seen how you can call them, pass in values, and return data, but you can also assign them to variables, pass functions into functions, and even return functions from functions.
/// Fonksiyonlar Swift'te güçlü şeylerdir. Evet, onları nasıl çağırabileceğinizi, değer aktarabileceğinizi ve veri döndürebileceğinizi gördünüz, ancak aynı zamanda onları değişkenlere atayabilir, fonksiyonları fonksiyonlara geçirebilir ve hatta fonksiyonlardan fonksiyonları döndürebilirsiniz.

func greetUser() {
    print("Hi there!")
}

greetUser()

var greetCopy = greetUser
greetCopy()

/// Bu, önemsiz bir fonksiyon oluşturur ve onu çağırır, ancak daha sonra bu fonksiyonun bir kopyasını oluşturur ve kopyayı çağırır. Sonuç olarak, aynı mesajı iki kez yazdıracaktır.
/// Önemli: Bir fonksiyonu kopyalarken, parantezleri ondan sonra yazmazsınız - var greetCopy = greetUser olur, var greetCopy = greetUser() olmaz. Parantezleri oraya koyarsanız, fonksiyonu çağırmış ve dönüş değerini başka bir şeye geri atamış olursunuz.

/// Peki ya ayrı bir fonksiyon oluşturmayı atlamak ve fonksiyonu doğrudan bir sabite veya değişkene atamak isterseniz? Bunu da yapabileceğiniz ortaya çıktı:
let sayHello2 = {
    print("Hi there!")
}

sayHello()

/**
    Swift gives this the grandiose name closure expression, which is a fancy way of saying we just created a closure – a chunk of code we can pass around and call whenever we want. This one doesn’t have a name, but otherwise it’s effectively a function that takes no parameters and doesn’t return a value.
    Swift buna closure expression gibi görkemli bir isim verir, bu da bir closure oluşturduğumuzu söylemenin süslü bir yoludur - etrafta dolaştırabileceğimiz ve istediğimiz zaman çağırabileceğimiz bir kod yığını. Bunun bir adı yok, ancak bunun dışında parametre almayan ve değer döndürmeyen bir fonksiyon.

    If you want the closure to accept parameters, they need to be written in a special way. You see, the closure starts and ends with the braces, which means we can’t put code outside those braces to control parameters or return value. So, Swift has a neat workaround: we can put that same information inside the braces, like this:
    Eğer closure'un parametre kabul etmesini istiyorsanız, bunların özel bir şekilde yazılması gerekir. Gördüğünüz gibi, closure parantezlerle başlar ve biter, bu da parametreleri veya dönüş değerini kontrol etmek için bu parantezlerin dışına kod koyamayacağımız anlamına gelir. Bu yüzden, Swift'in güzel bir çözümü var: aynı bilgiyi parantezlerin içine koyabiliriz, bunun gibi:
 */

let sayHello = { (name: String) -> String in
    "Hi \(name)!"
}

/**
    I added an extra keyword there – did you spot it? It’s the in keyword, and it comes directly after the parameters and return type of the closure. Again, with a regular function the parameters and return type would come outside the braces, but we can’t do that with closures. So, in is used to mark the end of the parameters and return type – everything after that is the body of the closure itself. There’s a reason for this, and you’ll see it for yourself soon enough.
    Buraya fazladan bir anahtar kelime ekledim - fark ettiniz mi? Bu in anahtar sözcüğüdür ve doğrudan parametrelerden ve closure'un dönüş türünden sonra gelir. Yine, normal bir fonksiyonda parametreler ve dönüş tipi parantezlerin dışına gelirdi, ancak bunu closure'larda yapamayız. Dolayısıyla, in parametre ve dönüş tipinin sonunu işaretlemek için kullanılır - bundan sonraki her şey closure'un gövdesidir. Bunun bir nedeni var ve yakında bunu kendiniz de göreceksiniz.

    In the meantime, you might have a more fundamental question: “why would I ever need these things?” I know, closures do seem awfully obscure. Worse, they seem obscure and complicated – many, many people really struggle with closures when they first meet them, because they are complex beasts and seem like they are never going to be useful.
    Aynı zamanda, daha temel bir sorunuz olabilir: "Bu şeylere neden ihtiyacım olsun ki?" Biliyorum, closure'lar son derece anlaşılmaz görünüyor. Daha da kötüsü, belirsiz ve karmaşık görünüyorlar - birçok insan ilk karşılaştıklarında closure'larla gerçekten mücadele ediyor, çünkü bunlar karmaşık canavarlar ve asla yararlı olmayacaklarmış gibi görünüyorlar.

    However, as you’ll see this gets used extensively in Swift, and almost everywhere in SwiftUI. Seriously, you’ll use them in every SwiftUI app you write, sometimes hundreds of times – maybe not necessarily in the form you see above, but you’re going to be using it a lot.
    Ancak, göreceğiniz gibi bu Swift'te ve SwiftUI'nin neredeyse her yerinde yoğun bir şekilde kullanılıyor. Cidden, bunları yazdığınız her SwiftUI uygulamasında, bazen yüzlerce kez kullanacaksınız - belki yukarıda gördüğünüz biçimde olmayabilir, ancak bunu çok kullanacaksınız.

    To get an idea of why closures are so useful, I first want to introduce you to function types. You’ve seen how integers have the type Int, and decimals have the type Double, etc, and now I want you to think about how functions have types too.
    Closure'ların neden bu kadar kullanışlı olduğu hakkında bir fikir edinmek için öncelikle size fonksiyon türlerini tanıtmak istiyorum. Tamsayıların Int türüne, ondalık sayıların Double türüne vs. sahip olduğunu gördünüz ve şimdi fonksiyonların da nasıl türleri olduğunu düşünmenizi istiyorum.

    Let’s take the greetUser() function we wrote earlier: it accepts no parameters, returns no value, and does not throw errors. If we were to write that as a type annotation for greetCopy, we’d write this:
    Daha önce yazdığımız greetUser() fonksiyonunu ele alalım: hiçbir parametre kabul etmez, değer döndürmez ve hata fırlatmaz (throw). Bunu greetCopy için bir tür ek açıklaması olarak yazacak olsaydık, şunu yazardık:
*/

var greetCopy2: () -> Void = greetUser

/**
    Let’s break that down:
    Bunu biraz açalım:
     - The empty parentheses marks a function that takes no parameters.
     - Boş parantezler parametre almayan bir fonksiyonu işaret eder.

     - The arrow means just what it means when creating a function: we’re about to declare the return type for the function.
     - Ok, bir fonksiyon oluştururken ne anlama geliyorsa o anlama gelir: fonksiyonun dönüş türünü bildirmek üzereyiz.

     - Void means “nothing” – this function returns nothing. Sometimes you might see this written as (), but we usually avoid that because it can be confused with the empty parameter list.
     - Void "hiçbir şey" anlamına gelir - bu fonksiyon hiçbir şey döndürmez. Bazen bunun () olarak yazıldığını görebilirsiniz, ancak boş parametre listesiyle karıştırılabileceği için genellikle bundan kaçınırız.

    Every function’s type depends on the data it receives and sends back. That might sound simple, but it hides an important catch: the names of the data it receives are not part of the function’s type.
    Her fonksiyonun türü aldığı ve geri gönderdiği verilere bağlıdır. Bu kulağa basit gelebilir, ancak önemli bir püf noktasını gizler: aldığı verilerin adları işlevin türünün bir parçası değildir.
 */

func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989)
print(user)

/**
    That starts off easily enough: it’s a function that accepts an integer and returns a string. But when we take a copy of the function the type of function doesn’t include the for external parameter name, so when the copy is called we use data(1989) rather than data(for: 1989).
    Bu yeterince kolay başlıyor: bir tamsayı kabul eden ve bir string döndüren bir fonksiyon. Ancak fonksiyonun bir kopyasını aldığımızda, fonksiyon türü for harici parametre adını içermez, bu nedenle kopya çağrıldığında data(for: 1989) yerine data(1989) kullanırız.

    Cunningly this same rule applies to all closures – you might have noticed that I didn’t actually use the sayHello closure we wrote earlier, and that’s because I didn’t want to leave you questioning the lack of a parameter name at the call site. Let’s call it now:
    Kurnazca, aynı kural tüm closure'lar için de geçerlidir - daha önce yazdığımız sayHello closure'ını kullanmadığımı fark etmiş olabilirsiniz, bunun nedeni çağrı yerinde bir parametre adının olmamasını sorgulamanıza neden olmak istemememdir. Şimdi onu çağıralım:
*/

sayHello("Taylor")

/**
    That uses no parameter name, just like when we copy functions. So, again: external parameter names only matter when we’re calling a function directly, not when we create a closure or when we take a copy of the function first.
    Bu, tıpkı fonksiyonları kopyaladığımızda olduğu gibi parametre adı kullanmaz. Yani, tekrar: harici parametre adları yalnızca bir fonksiyonu doğrudan çağırdığımızda önemlidir, bir closure oluşturduğumuzda veya önce fonksiyonun bir kopyasını aldığımızda değil.

    You’re probably still wondering why all this matters, and it’s all about to become clear. Do you remember I said we can use sorted() with an array to have it sort its elements?
    Muhtemelen hala tüm bunların neden önemli olduğunu merak ediyorsunuz ve her şey açıklığa kavuşmak üzere. Bir dizinin elemanlarını sıralamak için sorted() fonksiyonunu kullanabileceğimizi söylediğimi hatırlıyor musunuz?
*/

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)

/**
    That’s really neat, but what if we wanted to control that sort – what if we always wanted one person to come first because they were the team captain, with the rest being sorted alphabetically?
    Bu gerçekten harika, ama ya bu sıralamayı kontrol etmek istersek - ya her zaman bir kişinin takım kaptanı olduğu için ilk sırada gelmesini ve diğerlerinin alfabetik olarak sıralanmasını istersek?

    Well, sorted() actually allows us to pass in a custom sorting function to control exactly that. This function must accept two strings, and return true if the first string should be sorted before the second, or false if the first string should be sorted after the second.
    sorted() aslında tam olarak bunu kontrol etmek için özel bir sıralama fonksiyonu geçirmemize izin verir. Bu fonksiyon iki string kabul etmeli ve ilk string ikinciden önce sıralanacaksa true, ilk string ikinciden sonra sıralanacaksa false döndürmelidir.

    If Suzanne were the captain, the function would look like this:
    Suzanne kaptan olsaydı, işlev şöyle görünürdü:
 */

func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}

/**
    So, if the first name is Suzanne, return true so that name1 is sorted before name2. On the other hand, if name2 is Suzanne, return false so that name1 is sorted after name2. If neither name is Suzanne, just use < to do a normal alphabetical sort.
    Dolayısıyla, ilk ad Suzanne ise true döndürülür, böylece ad1, ad2'den önce sıralanır. Öte yandan, ad2 Suzanne ise, ad1'in ad2'den sonra sıralanması için false döndürülür. Her iki isim de Suzanne değilse, normal bir alfabetik sıralama yapmak için kullanın.

    Like I said, sorted() can be passed a function to create a custom sort order, and as long as that function a) accepts two strings, and b) returns a Boolean, sorted() can use it.
    Dediğim gibi, sorted() özel bir sıralama düzeni oluşturmak için bir fonksiyona aktarılabilir ve bu fonksiyon a) iki string kabul ettiği ve b) bir Boolean döndürdüğü sürece sorted() bunu kullanabilir.

    That’s exactly what our new captainFirstSorted() function does, so we can use it straight away:
    Yeni captainFirstSorted() fonksiyonumuz tam olarak bunu yapıyor, bu yüzden onu hemen kullanabiliriz:
 */

let captainFirstTeam = team.sorted(by: captainFirstSorted)
print(captainFirstTeam)

/**
    When that runs it will print ["Suzanne", "Gloria", "Piper", "Tasha", "Tiffany"], exactly as we wanted.
    Bu çalıştırıldığında, tam istediğimiz gibi ["Suzanne", "Gloria", "Piper", "Tasha", "Tiffany"] yazdıracaktır.


    We’ve now covered two seemingly very different things. First, we can create closures as anonymous functions, storing them inside constants and variables:
    Şimdi görünüşte çok farklı iki şeyi ele aldık. İlk olarak, closure'ları anonim fonksiyonlar olarak oluşturabilir, sabitler ve değişkenler içinde saklayabiliriz:
*/

let sayHello3 = {
    print("Hi there!")
}

sayHello3()

/**
    And we’re also able to pass functions into other functions, just like we passed captainFirstSorted() into sorted():
    Ayrıca, tıpkı captainFirstSorted() fonksiyonunu sorted() fonksiyonuna aktardığımız gibi, fonksiyonları diğer fonksiyonlara da aktarabiliyoruz:
*/
let captainFirstTeam2 = team.sorted(by: captainFirstSorted)

/**
    The power of closures is that we can put these two together: sorted() wants a function that will accept two strings and return a Boolean, and it doesn’t care if that function was created formally using func or whether it’s provided using a closure.
    closure'ların gücü, bu ikisini bir araya getirebilmemizdir: sorted() iki string kabul edecek ve bir Boolean döndürecek bir fonksiyon ister ve bu fonksiyonun resmi olarak func kullanılarak mı oluşturulduğunu yoksa bir closure kullanılarak mı sağlandığını umursamaz.

    So, we could call sorted() again, but rather than passing in the captainFirstTeam() function, instead start a new closure: write an open brace, list its parameters and return type, write in, then put our standard function code.
    Böylece sorted() işlevini tekrar çağırabiliriz, ancak captainFirstTeam() fonksiyonunu geçirmek yerine yeni bir closure başlatırız: bir açık ayraç yazar, parametrelerini ve dönüş türünü listeler, içine yazar ve ardından standart fonksiyon kodumuzu koyarız.

    This is going to hurt your brain at first. It’s not because you’re not smart enough to understand closures or not cut out for Swift programming, only that closures are really hard. Don’t worry – we’re going to look at ways to make this easier!
    Bu ilk başta beyninizi acıtacak. Bunun nedeni closure'ları anlayacak kadar zeki olmamanız ya da Swift programlamaya uygun olmamanız değil, sadece closure'ların gerçekten zor olması. Endişelenmeyin - bunu daha kolay hale getirmenin yollarına bakacağız!

    Okay, let’s write some new code that calls sorted() using a closure:
    Tamam, sorted() işlevini bir closure kullanarak çağıran yeni bir kod yazalım:
*/

let captainFirstTeam3 = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
})

/**
    That’s a big chunk of syntax all at once, and again I want to say it’s going to get easier – in the very next chapter we’re going to look at ways to reduce the amount of code so it’s easier to see what’s going on.
    Bu bir kerede büyük bir sözdizimi yığınıdır ve tekrar söylemek istiyorum, daha kolay olacak - bir sonraki bölümde kod miktarını azaltmanın yollarına bakacağız, böylece neler olup bittiğini görmek daha kolay olacak.

    But first I want to break down what’s happening there:
    Ama önce orada neler olduğunu açıklamak istiyorum:

    - We’re calling the sorted() function as before.
    - Daha önce olduğu gibi sorted() fonksiyonunu çağırıyoruz.

    - Rather than passing in a function, we’re passing a closure – everything from the opening brace after by: down to the closing brace on the last line is part of the closure.
    - Bir fonksiyon aktarmak yerine bir closure aktarıyoruz - by:'den sonraki açılış parantezinden son satırdaki kapanış parantezine kadar her şey closure'un bir parçasıdır.

    - Directly inside the closure we list the two parameters sorted() will pass us, which are two strings. We also say that our closure will return a Boolean, then mark the start of the closure’s code by using in.
    - Doğrudan closure'un içinde sorted() fonksiyonunun bize aktaracağı iki parametreyi listeliyoruz, bunlar iki string. Ayrıca closure'ımızın bir Boolean döndüreceğini söylüyor, ardından closure kodunun başlangıcını in kullanarak işaretliyoruz.

    - Everything else is just normal function code.
    - Geri kalan her şey normal fonksiyon kodudur.

    Again, there’s a lot of syntax in there and I wouldn’t blame you if you felt a headache coming on, but I hope you can see the benefit of closures at least a little: functions like sorted() let us pass in custom code to adjust how they work, and do so directly – we don’t need to write out a new function just for that one usage.
    Yine, burada çok fazla sözdizimi var ve başınızın ağrıyacağını hissettiyseniz sizi suçlamam, ancak umarım closure'ların faydasını en azından biraz görebilirsiniz: sorted() gibi işlevler, nasıl çalışacaklarını ayarlamak için özel kod aktarmamıza izin verir ve bunu doğrudan yapar - sadece bu kullanım için yeni bir işlev yazmamız gerekmez.
*/
