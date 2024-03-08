import Cocoa

/// # How to accept functions as parameters
/// # Fonksiyonlar parametre olarak nasıl kabul edilir

/**
    There’s one last closure-related topic I want to look at, which is how to write functions that accept other functions as parameters. This is particularly important for closures because of trailing closure syntax, but it’s a useful skill to have regardless.
    Closure ile ilgili son bir konuya daha değinmek istiyorum, o da diğer fonksiyonları parametre olarak kabul eden fonksiyonların nasıl yazılacağı. Bu, closure sözdizimi nedeniyle özellikle closure'lar için önemlidir, ancak ne olursa olsun sahip olunması gereken yararlı bir beceridir.

    Previously we looked at this code:
    Daha önce bu kodu incelemiştik:
*/

func greetUser() {
    print("Hi there!")
}

greetUser()

var greetCopy: () -> Void = greetUser
greetCopy()


/**
    I’ve added the type annotation in there intentionally, because that’s exactly what we use when specifying functions as parameters: we tell Swift what parameters the function accepts, as well its return type.
    Tip ek açıklamasını bilerek ekledim, çünkü fonksiyonları parametre olarak belirtirken tam olarak bunu kullanıyoruz: Swift'e fonksiyonun hangi parametreleri kabul ettiğini ve dönüş tipini söylüyoruz.

    Once again, brace yourself: the syntax for this is a little hard on the eyes at first! Here’s a function that generates an array of integers by repeating a function a certain number of times:
    Bir kez daha, kendinizi hazırlayın: bunun sözdizimi ilk başta gözler için biraz zor! İşte bir fonksiyonu belirli sayıda tekrarlayarak bir dizi tamsayı üreten bir fonksiyon:
*/

func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()

    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }

    return numbers
}

/**
    Let’s break that down:
    Bunu biraz açalım:
    - The function is called makeArray(). It takes two parameters, one of which is the number of integers we want, and also returns an array of integers.
    - Fonksiyonun adı makeArray(). Biri istediğimiz tamsayı sayısı olmak üzere iki parametre alır ve ayrıca bir tamsayı dizisi döndürür.

    - The second parameter is a function. This accepts no parameters itself, but will return one integer every time it’s called.
    - İkinci parametre bir fonksiyondur. Bu fonksiyonun kendisi parametre kabul etmez, ancak her çağrıldığında bir tamsayı döndürür.

    - Inside makeArray() we create a new empty array of integers, then loop as many times as requested.
    - makeArray() içinde yeni bir boş tamsayı dizisi oluştururuz, ardından istenildiği kadar döngü yaparız.

 
    - Each time the loop goes around we call the generator function that was passed in as a parameter. This will return one new integer, so we put that into the numbers array.
    - Döngü her döndüğünde, parametre olarak aktarılan generator fonksiyonunu çağırırız. Bu, yeni bir tamsayı döndürecektir, bu yüzden bunu sayılar dizisine koyarız.
 
    - Finally the finished array is returned.
    - Son olarak bitmiş dizi döndürülür.

    The body of the makeArray() is mostly straightforward: repeatedly call a function to generate an integer, adding each value to an array, then send it all back.
    makeArray() işlevinin gövdesi çoğunlukla basittir: bir tamsayı oluşturmak için bir işlevi tekrar tekrar çağırın, her değeri bir diziye ekleyin ve ardından hepsini geri gönderin.

    The complex part is the very first line:
    Karmaşık olan kısım ilk satırdır:
 */

// func makeArray2(size: Int, using generator: () -> Int) -> [Int] {

/**
    There we have two sets of parentheses and two sets of return types, so it can be a bit of a jumble at first. If you split it up you should be able to read it linearly:
    Burada iki parantez seti ve iki dönüş tipi seti vardır, bu nedenle ilk başta biraz karışık olabilir. Eğer bölerseniz doğrusal olarak okuyabilirsiniz:

    - We’re creating a new function.
    - Yeni bir fonksiyon oluşturuyoruz.

    - The function is called makeArray().
    - Fonksiyonun adı makeArray()'dir.
 
    - The first parameter is an integer called size.
    - İlk parametre "size" adı verilen bir tamsayıdır.
 
    - The second parameter is a function called generator, which itself accepts no parameters and returns an integer.
    - İkinci parametre, kendisi parametre kabul etmeyen ve bir tamsayı döndüren generator adlı bir işlevdir.

    - The whole thing – makeArray() – returns an array of integers.
    - Her şey - makeArray() - bir tamsayı dizisi döndürür.
 
    The result is that we can now make arbitrary-sized integer arrays, passing in a function that should be used to generate each number:
    Sonuç olarak, artık her bir sayıyı oluşturmak için kullanılması gereken bir fonksiyonu ileterek keyfi boyutta tamsayı dizileri oluşturabiliriz:
*/

let rolls = makeArray(size: 50) {
    Int.random(in: 1...20)
}

print(rolls)

/**
    And remember, this same functionality works with dedicated functions too, so we could write something like this:
    Ve unutmayın, aynı işlevsellik özel fonksiyonlarla da çalışır, bu nedenle şöyle bir şey yazabiliriz:
*/

func generateNumber() -> Int {
    Int.random(in: 1...20)
}

let newRolls = makeArray(size: 50, using: generateNumber)
print(newRolls)

/**
    That will call generateNumber() 50 times to fill the array.
    Bu, diziyi doldurmak için generateNumber() işlevini 50 kez çağıracaktır.

    While you’re learning Swift and SwiftUI, there will only be a handful of times when you need to know how to accept functions as parameters, but at least now you have an inkling of how it works and why it matters.
    Swift ve SwiftUI öğrenirken, fonksiyonları parametre olarak nasıl kabul edeceğinizi bilmeniz gereken yalnızca birkaç zaman olacaktır, ancak en azından şimdi nasıl çalıştığına ve neden önemli olduğuna dair bir fikriniz var.

    There’s one last thing before we move on: you can make your function accept multiple function parameters if you want, in which case you can specify multiple trailing closures. The syntax here is very common in SwiftUI, so it’s important to at least show you a taste of it here.
    Devam etmeden önce son bir şey daha var: İsterseniz fonksiyonunuzun birden fazla fonksiyon parametresi almasını sağlayabilirsiniz, bu durumda birden fazla sondaki closure belirtebilirsiniz. Buradaki sözdizimi SwiftUI'de çok yaygındır, bu nedenle en azından burada size bir tadımlık göstermek önemlidir.

    To demonstrate this here’s a function that accepts three function parameters, each of which accept no parameters and return nothing:
    Bunu göstermek için, her biri parametre kabul etmeyen ve hiçbir şey döndürmeyen üç işlev parametresi kabul eden bir işlev:
*/

func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}

/**
    I’ve added extra print() calls in there to simulate specific work being done in between first, second, and third being called.
    Birinci, ikinci ve üçüncü çağrılar arasında belirli bir işin yapıldığını simüle etmek için buraya fazladan print() çağrıları ekledim.


    When it comes to calling that, the first trailing closure is identical to what we’ve used already, but the second and third are formatted differently: you end the brace from the previous closure, then write the external parameter name and a colon, then start another brace.
    Bunu çağırmaya gelince, ilk  closure daha önce kullandığımızla aynıdır, ancak ikinci ve üçüncü farklı biçimlendirilir: önceki closure'dan gelen parantezi bitirirsiniz, ardından harici parametre adını ve iki nokta üst üste işaretini yazarsınız, ardından başka bir parantez başlatırsınız.
*/

doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}

/**
    Having three trailing closures is not as uncommon as you might expect. For example, making a section of content in SwiftUI is done with three trailing closures: one for the content itself, one for a head to be put above, and one for a footer to be put below.

    Üç closure olması beklediğiniz kadar nadir bir durum değildir. Örneğin, SwiftUI'de bir içerik bölümü oluşturmak üç  closure ile yapılır: biri içeriğin kendisi için, biri yukarıya konulacak bir başlık için ve biri de aşağıya konulacak bir altbilgi için.
*/
