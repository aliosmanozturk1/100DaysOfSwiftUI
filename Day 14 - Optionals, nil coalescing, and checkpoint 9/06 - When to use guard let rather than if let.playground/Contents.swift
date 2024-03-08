import Cocoa

/// # When to use guard let rather than if let
/// # Giriş

/**
    Swift gives us an alternative to if let called guard let, which also unwraps optionals if they contain a value, but works slightly differently: guard let is designed to exit the current function, loop, or condition if the check fails, so any values you unwrap using it will stay around after the check.
    Swift bize if let'e alternatif olarak guard let adında bir seçenek sunar, bu seçenek de bir değer içeriyorsa açılır, ancak biraz farklı çalışır: guard let, kontrol başarısız olursa mevcut işlevden, döngüden veya koşuldan çıkmak üzere tasarlanmıştır, bu nedenle onu kullanarak açtığınız tüm değerler kontrolden sonra da kalır.

    To demonstrate the difference, here’s a function that returns the meaning of life as an optional integer:
    Farkı göstermek için, hayatın anlamını opsiyonel bir tamsayı olarak döndüren bir fonksiyon:
*/

func getMeaningOfLife() -> Int? {
    42
}

/**
    And here’s that function being used inside another function, called printMeaningOfLife():
    Ve işte bu fonksiyon printMeaningOfLife() adlı başka bir fonksiyonun içinde kullanılıyor:
*/

func printMeaningOfLife_ifLet() {
    if let name = getMeaningOfLife() {
        print(name)
    }
}

/**
    That uses if let, so that the result of getMeaningOfLife() will only be printed if it returned an integer rather than nil.
    Bu, if let kullanır, böylece getMeaningOfLife() işlevinin sonucu yalnızca nil yerine bir tamsayı döndürürse yazdırılır.

    If we had written that using guard let, it would look like this:
    Bunu guard let kullanarak yazmış olsaydık, şöyle görünürdü:
*/

func printMeaningOfLife_guardLet() {
    guard let name = getMeaningOfLife() else {
        return
    }

    print(name)
}

/**
 Yes, that’s a little longer, but two important things have changed:
 Evet, bu süre biraz daha uzun ama iki önemli şey değişti:

 - It lets us focus on the “happy path” – the behavior of our function when everything has gone to plan, which is to print the meaning of life.
 - "Mutlu yola" odaklanmamızı sağlar - her şey plana uygun gittiğinde fonksiyonumuzun davranışı, yani hayatın anlamını yazdırmak.

 - guard requires that we exit the current scope when it’s used, which in this case means we must return from the function if it fails. This is not optional: Swift won’t compile our code without the return.
 - guard, kullanıldığında mevcut kapsamdan çıkmamızı gerektirir; bu durumda, başarısız olursa fonksiyondan geri dönmemiz gerektiği anlamına gelir. Bu isteğe bağlı değildir: Swift kodumuzu return olmadan derlemeyecektir.

 It’s common to see guard used one or more times at the start of methods, because it’s used to verify some conditions are correct up front. This makes our code easier to read than if we tried to check a condition then run some code, then check another condition and run some different code.
 Metotların başında bir veya daha fazla kez guard kullanıldığını görmek yaygındır, çünkü bazı koşulların önceden doğru olduğunu doğrulamak için kullanılır. Bu, kodumuzun okunmasını, bir koşulu kontrol ettikten sonra bazı kodları çalıştırmaya, ardından başka bir koşulu kontrol etmeye ve farklı bir kodu çalıştırmaya çalıştığımızdan daha kolay hale getirir.

 So, use if let if you just want to unwrap some optionals, but prefer guard let if you’re specifically checking that conditions are correct before continuing.
 Bu nedenle, sadece bazı opsiyonelleri açmak istiyorsanız if let kullanın, ancak devam etmeden önce koşulların doğru olup olmadığını özellikle kontrol ediyorsanız guard let'i tercih edin.
*/
