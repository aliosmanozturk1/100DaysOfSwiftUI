import Cocoa

/// # How to return values from functions
/// # Fonksiyonlardan değerler nasıl döndürülür



/**
 You’ve seen how to create functions and how to add parameters to them, but functions often also send data back – they perform some computation, then return the result of that work back to the call site.
 Fonksiyonları nasıl oluşturacağınızı ve onlara nasıl parametre ekleyeceğinizi gördünüz, ancak fonksiyonlar genellikle geri veri de gönderir - bazı hesaplamalar yapar, ardından bu çalışmanın sonucunu çağrı sitesine geri döndürürler.

 Swift has lots of these functions built in, and there are tens of thousands more in Apple’s frameworks. For example, our playground has always had import Cocoa at the very top, and that includes a variety of mathematical functions such as sqrt() for calculating the square root of a number.
 Swift'te bu işlevlerin birçoğu yerleşik olarak bulunur ve Apple'ın çerçevelerinde on binlerce daha vardır. Örneğin, oyun alanımızda her zaman en üstte import Cocoa bulunur ve bu, bir sayının karekökünü hesaplamak için sqrt() gibi çeşitli matematiksel fonksiyonları içerir.

 The sqrt() function accepts one parameter, which is the number we want to calculate the square root of, and it will go ahead and do the work then send back the square root.
 sqrt() fonksiyonu bir parametre kabul eder, bu da karekökünü hesaplamak istediğimiz sayıdır ve devam edip işi yaptıktan sonra karekökü geri gönderir.
 */

let root = sqrt(169)
print(root)

/**
 If you want to return your own value from a function, you need to do two things:
    - Write an arrow then a data type before your function’s opening brace, which tells Swift what kind of data will get sent back.
    - Fonksiyonunuzun açılış parantezinden önce bir ok ve ardından Swift'e ne tür bir verinin geri gönderileceğini söyleyen bir veri türü yazın.

    - Use the return keyword to send back your data.
    - Verilerinizi geri göndermek için return anahtar sözcüğünü kullanın.
 */


/// Örneğin, belki de programınızın çeşitli bölümlerinde zar atmak istiyorsunuz, ancak zar atmayı her zaman 6 yüzlü zar kullanmaya zorlamak yerine bunu bir fonksiyon haline getirebilirsiniz:
func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)



/// Important: When you say your function will return an Int, Swift will make sure it always returns an Int – you can’t forget to send back a value, because your code won’t build.
/// Önemli: Fonksiyonunuzun bir Int döndüreceğini söylediğinizde, Swift her zaman bir Int döndürdüğünden emin olacaktır - kodunuz oluşturulmayacağı için bir değer geri göndermeyi unutamazsınız.



/// Daha karmaşık bir örnek deneyelim: iki dize, sıraları ne olursa olsun aynı harfleri içeriyor mu? Bu fonksiyon iki dize parametresi almalı ve harfleri aynıysa true döndürmelidir - yani, "abc" ve "cab" true döndürmelidir çünkü her ikisi de bir "a", bir "b" ve bir "c" içerir.
/// Herhangi bir string üzerinde sorted() fonksiyonunu çağırırsanız, tüm harfleri alfabetik sırada olan yeni bir string elde edersiniz. Yani, bunu her iki dize için de yaparsanız, harflerinin aynı olup olmadığını görmek için == ile karşılaştırabilirsiniz.
func areLettersIdentical(string1: String, string2: String) -> Bool {
    let first = string1.sorted()
    let second = string2.sorted()
    return first == second
}
/// Bu kod hem string1'i hem de string2'yi sıralar ve sıralanmış değerlerini first ve second adlı yeni sabitlere atar. Ancak, buna gerek yoktur - bu geçici sabitleri atlayabilir ve sorted() işlevinin sonuçlarını aşağıdaki gibi doğrudan karşılaştırabiliriz:
func areLettersIdentical2(string1: String, string2: String) -> Bool {
    return string1.sorted() == string2.sorted()
}
/// That’s less code, but we can do even better. You see, we’ve told Swift that this function must return a Boolean, and because there’s only one line of code in the function Swift knows that’s the one that must return data. Because of this, when a function has only one line of code, we can remove the return keyword entirely, like this:
/// Bu daha az kod, ancak daha da iyisini yapabiliriz. Gördüğünüz gibi, Swift'e bu fonksiyonun bir Boolean döndürmesi gerektiğini söyledik ve fonksiyonda yalnızca bir satır kod olduğu için Swift, veri döndürmesi gerekenin bu olduğunu biliyor. Bu nedenle, bir fonksiyonda yalnızca bir satır kod olduğunda, return anahtar sözcüğünü aşağıdaki gibi tamamen kaldırabiliriz:
func areLettersIdentical3(string1: String, string2: String) -> Bool {
    string1.sorted() == string2.sorted()
}
/// Unutmayın, bu yalnızca işleviniz tek bir kod satırı içerdiğinde ve özellikle bu kod satırı gerçekten döndürmeyi vaat ettiğiniz verileri döndürdüğünde çalışır.




/// We can go back and do the same for the rollDice() function too:
/// Geri dönüp aynı işlemi rollDice() fonksiyonu için de yapabiliriz:
func rollDice2() -> Int {
    Int.random(in: 1...6)
}
/// Unutmayın, bu yalnızca işleviniz tek bir kod satırı içerdiğinde ve özellikle bu kod satırı gerçekten döndürmeyi vaat ettiğiniz verileri döndürdüğünde çalışır.



/// Pisagor
func pythagoras(a: Double, b: Double) -> Double {
    let input = a * a + b * b
    let root = sqrt(input)
    return root
}

let c = pythagoras(a: 3, b: 4)
print(c)
/// That function can also be boiled down to a single line, and have its return keyword removed – give it a try. As usual I’ll show you my solution afterwards, but it’s important you try.

func pythagoras2(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b)
}



/// There’s one last thing I want to mention before we move on: if your function doesn’t return a value, you can still use return by itself to force the function to exit early. For example, perhaps you have a check that the input matches what you expected, and if it doesn’t you want to exit the function immediately before continuing.
/// Devam etmeden önce bahsetmek istediğim son bir şey var: eğer fonksiyonunuz bir değer döndürmüyorsa, fonksiyonu erken çıkmaya zorlamak için return'ü tek başına kullanabilirsiniz. Örneğin, belki de girdinin beklediğinizle eşleşip eşleşmediğini kontrol ediyorsunuz ve eşleşmiyorsa devam etmeden önce fonksiyondan hemen çıkmak istiyorsunuz.



