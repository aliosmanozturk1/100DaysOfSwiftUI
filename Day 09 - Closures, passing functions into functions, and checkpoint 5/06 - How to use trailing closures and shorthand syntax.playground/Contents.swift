import Cocoa

/// # How to use trailing closures and shorthand syntax
/// # Sondaki closure'lar ve shorthand sözdizimi nasıl kullanılır

/**
    Swift has a few tricks up its sleeve to reduce the amount of syntax that comes with closures, but first let’s remind ourselves of the problem. Here’s the code we ended up with at the end of the previous chapter:
    Swift, closure'larla birlikte gelen sözdizimi miktarını azaltmak için birkaç hileye sahiptir, ancak önce kendimize sorunu hatırlatalım. İşte bir önceki bölümün sonunda elde ettiğimiz kod:
*/

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
})

print(captainFirstTeam)

/**
    If you remember, sorted() can accept any kind of function to do custom sorting, with one rule: that function must accept two items from the array in question (that’s two strings here), and return a Boolean set to true if the first string should be sorted before the second.
    Hatırlarsanız, sorted() işlevi özel sıralama yapmak için her türlü işlevi kabul edebilir, ancak bir kural vardır: bu işlev söz konusu diziden iki öğe kabul etmeli (burada iki string) ve ilk stringin ikinciden önce sıralanması gerekiyorsa true değerine ayarlanmış bir Boolean döndürmelidir.

    To be clear, the function must behave like that – if it returned nothing, or if it only accepted one string, then Swift would refuse to build our code.
    Açık olmak gerekirse, fonksiyon bu şekilde davranmalıdır - hiçbir şey döndürmezse veya yalnızca bir string kabul ederse, Swift kodumuzu oluşturmayı reddeder.

    Think it through: in this code, the function we provide to sorted() must provide two strings and return a Boolean, so why do we need to repeat ourselves in our closure?
    Şöyle düşünün: Bu kodda sorted() fonksiyonuna verdiğimiz fonksiyon iki string sağlamalı ve bir Boolean döndürmelidir, öyleyse neden closure'ımızda kendimizi tekrarlamamız gerekiyor?

    The answer is: we don’t. We don’t need to specify the types of our two parameters because they must be strings, and we don’t need to specify a return type because it must be a Boolean. So, we can rewrite the code to this:
    Cevap: Gerekmez. İki parametremizin türünü belirtmemize gerek yok çünkü string olmalılar ve dönüş türünü belirtmemize gerek yok çünkü Boolean olmalı. Böylece kodu şu şekilde yeniden yazabiliriz:
 
    When one function accepts another as its parameter, like sorted() does, Swift allows special syntax called trailing closure syntax. It looks like this:
    sorted() fonksiyonunda olduğu gibi, bir fonksiyon diğerini parametre olarak kabul ettiğinde, Swift sondaki closure sözdizimi adı verilen özel sözdizimine izin verir. Bu şuna benzer:
*/

let captainFirstTeam2 = team.sorted { name1, name2 in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}

/**
    Rather than passing the closure in as a parameter, we just go ahead and start the closure directly – and in doing so remove (by: from the start, and a closing parenthesis at the end. Hopefully you can now see why the parameter list and in come inside the closure, because if they were outside it would look even weirder!
    Closure'u bir parametre olarak geçirmek yerine, devam edip closure'u doğrudan başlatıyoruz - ve bunu yaparken (by: 'yi başlangıçtan ve kapanış parantezini sondan kaldırıyoruz. Umarım şimdi parametre listesinin ve in'in neden closure'un içine geldiğini görebilirsiniz, çünkü eğer dışarıda olsalardı daha da garip görünürlerdi!

    There’s one last way Swift can make closures less cluttered: Swift can automatically provide parameter names for us, using shorthand syntax. With this syntax we don’t even write name1, name2 in any more, and instead rely on specially named values that Swift provides for us: $0 and $1, for the first and second strings respectively.
    Swift'in closure'ları daha az karmaşık hale getirmesinin son bir yolu daha var: Swift, shorthand sözdizimini kullanarak parametre adlarını bizim için otomatik olarak sağlayabilir. Bu sözdizimi ile artık name1, name2 bile yazmıyoruz ve bunun yerine Swift'in bizim için sağladığı özel olarak adlandırılmış değerlere güveniyoruz: sırasıyla birinci ve ikinci dizeler için $0 ve $1.

    Using this syntax our code becomes even shorter:
    Bu sözdizimini kullanarak kodumuz daha da kısalır:
*/

let captainFirstTeam3 = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }

    return $0 < $1
}

/**
    I left this one to last because it’s not as clear cut as the others – some people see that syntax and hate it because it’s less clear, and that’s okay.
    Bunu sona bıraktım çünkü diğerleri kadar net değil - bazı insanlar bu sözdizimini görüyor ve daha az net olduğu için nefret ediyor ve bu sorun değil.

    Personally I wouldn’t use it here because we’re using each value more than once, but if our sorted() call was simpler – e.g., if we just wanted to do a reverse sort – then I would:
    Şahsen ben burada kullanmazdım çünkü her değeri birden fazla kez kullanıyoruz, ancak sorted() çağrımız daha basit olsaydı - örneğin, sadece ters sıralama yapmak isteseydik - o zaman kullanırdım:
*/

let reverseTeam = team.sorted {
    return $0 > $1
}

/**
    So, in is used to mark the end of the parameters and return type – everything after that is the body of the closure itself. There’s a reason for this, and you’ll see it for yourself soon enough.
    Yani, in parametre ve dönüş tipinin sonunu işaretlemek için kullanılır - bundan sonraki her şey closure'un gövdesidir. Bunun bir nedeni var ve yakında bunu kendiniz de göreceksiniz.


    There I’ve flipped the comparison from < to > so we get a reverse sort, but now that we’re down to a single line of code we can remove the return and get it down to almost nothing:
    Burada karşılaştırmayı <'den >'e çevirdim, böylece ters sıralama elde ettik, ancak şimdi tek bir kod satırına indiğimiz için geri dönüşü kaldırabilir ve neredeyse sıfıra indirebiliriz:
*/

let reverseTeam2 = team.sorted { $0 > $1 }

/**
    There are no fixed rules about when to use shorthand syntax and when not to, but in case it’s helpful I use shorthand syntax unless any of the following are true:
    Kısaltılmış sözdiziminin ne zaman kullanılacağı ve ne zaman kullanılmayacağı konusunda sabit kurallar yoktur, ancak yardımcı olması durumunda, aşağıdakilerden herhangi biri doğru olmadıkça kısaltılmış sözdizimini kullanırım:

    - The closure’s code is long.

    - $0 and friends are used more than once each.
    - 0$ ve arkadaşlar birden fazla kez kullanılmıştır.
 
    - You get three or more parameters (e.g. $2, $3, etc).
    - Üç veya daha fazla parametre alırsınız (örn. 2$, 3$, vb.).
 
    If you’re still unconvinced about the power of closures, let’s take a look at two more examples.
    Closure'ların gücü konusunda hala ikna olmadıysanız, iki örneğe daha göz atalım.

    First up, the filter() function lets us run some code on every item in the array, and will send back a new array containing every item that returns true for the function. So, we could find all team players whose name begins with T like this:
    İlk olarak, filter() fonksiyonu dizideki her öğe üzerinde bazı kodlar çalıştırmamıza izin verir ve fonksiyon için true döndüren her öğeyi içeren yeni bir dizi geri gönderir. Böylece, adı T ile başlayan tüm takım oyuncularını şu şekilde bulabiliriz:
*/

let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)

/**
    That will print ["Tiffany", "Tasha"], because those are the only two team members whose name begins with T.

    And second, the map() function lets us transform every item in the array using some code of our choosing, and sends back a new array of all the transformed items:
    İkincisi, map() fonksiyonu dizideki her öğeyi kendi seçtiğimiz bir kodu kullanarak dönüştürmemizi sağlar ve dönüştürülen tüm öğelerden oluşan yeni bir dizi gönderir:
*/

let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)

/**
    That will print ["GLORIA", "SUZANNE", "PIPER", "TIFFANY", "TASHA"], because it has uppercased every name and produced a new array from the result.
    Bu, ["GLORIA", "SUZANNE", "PIPER", "TIFFANY", "TASHA"] yazdıracaktır, çünkü her adı büyük harfle yazmış ve sonuçtan yeni bir dizi üretmiştir.

    Tip: When working with map(), the type you return doesn’t have to be the same as the type you started with – you could convert an array of integers to an array of strings, for example.
    İpucu: map() ile çalışırken, döndürdüğünüz türün başladığınız türle aynı olması gerekmez - örneğin bir tamsayı dizisini bir string dizisine dönüştürebilirsiniz.

    Like I said, you’re going to be using closures a lot with SwiftUI:
    Dediğim gibi, SwiftUI ile closure'ları çok kullanacaksınız:

    - When you create a list of data on the screen, SwiftUI will ask you to provide a function that accepts one item from the list and converts it something it can display on-screen.
    - Ekranda bir veri listesi oluşturduğunuzda, SwiftUI sizden listeden bir öğeyi kabul eden ve bunu ekranda görüntüleyebileceği bir şeye dönüştüren bir işlev sağlamanızı isteyecektir.

    - When you create a button, SwiftUI will ask you to provide one function to execute when the button is pressed, and another to generate the contents of the button – a picture, or some text, and so on.
    - Bir buton oluşturduğunuzda, SwiftUI sizden butona basıldığında çalıştırılacak bir fonksiyon ve butonun içeriğini oluşturacak bir başka fonksiyon (bir resim veya bir metin vb.) sağlamanızı isteyecektir.

    - Even just putting stacking pieces of text vertically is done using a closure.
    - Sadece metin parçalarını dikey olarak üst üste koymak bile bir closure kullanılarak yapılır.

    Yes, you can create individual functions every time SwiftUI does this, but trust me: you won’t. Closures make this kind of code completely natural, and I think you’ll be amazed at how SwiftUI uses them to produce remarkably simple, clean code.
    Evet, SwiftUI bunu her yaptığında ayrı fonksiyonlar oluşturabilirsiniz, ancak bana güvenin: bunu yapmayacaksınız. Closure'lar bu tür kodları tamamen doğal hale getiriyor ve bence SwiftUI'nin bunları kullanarak nasıl son derece basit ve temiz kodlar ürettiğine şaşıracaksınız.
*/
