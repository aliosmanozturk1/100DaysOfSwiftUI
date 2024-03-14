import Cocoa

/// # How to unwrap optionals with guard

// 38. SATIRDA Bİ HATA VAR AMA ÇÖZMEYE ÇALIŞMADIM

/**
    You’ve already seen how Swift uses if let to unwrap optionals, and it’s the most common way of using optionals. But there is a second way that does much the same thing, and it’s almost as common: guard let.
    Swift'in opsiyonelleri açmak için if let'i nasıl kullandığını zaten gördünüz ve bu opsiyonelleri kullanmanın en yaygın yoludur. Ancak hemen hemen aynı şeyi yapan ikinci bir yol daha vardır ve neredeyse o kadar yaygındır: guard let.

    It looks like this:
    Şöyle görünüyor:
*/

func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        return
    }

    print("\(number) x \(number) is \(number * number)")
}

/**
    Like if let, guard let checks whether there is a value inside an optional, and if there is it will retrieve the value and place it into a constant of our choosing.
    if let gibi, guard let de bir optional içinde bir değer olup olmadığını kontrol eder ve varsa değeri alır ve seçtiğimiz bir sabite yerleştirir.

    However, the way it does so flips things around:
    Ancak, bunu yapma şekli işleri tersine çevirir:
*/

var myVar: Int? = 3

if let unwrapped = myVar {
    print("Run if myVar has a value inside")
}

guard let unwrapped = myVar else {
    print("Run if myVar doesn't have a value inside")
}

/**
 So, if let runs the code inside its braces if the optional had a value, and guard let runs the code inside its braces if the optional didn’t have a value. This explains the use of else in the code: “check that we can unwrap the optional, but if we can’t then…”
 Bu nedenle, if let, optional bir değere sahipse parantez içindeki kodu çalıştırır ve guard let, optional bir değere sahip değilse parantez içindeki kodu çalıştırır. Bu, koddaki else kullanımını açıklar: "isteğe bağlı öğeyi açıp açamayacağımızı kontrol et, ancak açamazsak..."

 I realize that sounds like a small difference, but it has important ramifications. You see, what guard provides is the ability to check whether our program state is what we expect, and if it isn’t to bail out – to exit from the current function, for example.
 Bunun küçük bir fark gibi göründüğünün farkındayım, ancak önemli sonuçları var. Gördüğünüz gibi, guard'ın sağladığı şey, program durumumuzun beklediğimiz gibi olup olmadığını kontrol etme ve eğer değilse, örneğin mevcut işlevden çıkma yeteneğidir.
 
 This is sometimes called an early return: we check that all a function’s inputs are valid right as the function starts, and if any aren’t valid we get to run some code then exit straight away. If all our checks pass, our function can run exactly as intended.
 Buna bazen erken dönüş de denir: fonksiyon başlarken tüm girdilerin geçerli olup olmadığını kontrol ederiz ve geçerli olmayanlar varsa bazı kodları çalıştırıp hemen çıkarız. Tüm kontrollerimiz geçerse, fonksiyonumuz tam olarak amaçlandığı gibi çalışabilir.
 
 guard is designed exactly for this style of programming, and in fact does two things to help:
 guard tam olarak bu tarz programlama için tasarlanmıştır ve aslında yardımcı olmak için iki şey yapar:
 - If you use guard to check a function’s inputs are valid, Swift will always require you to use return if the check fails.
 - Bir fonksiyonun girdilerinin geçerli olup olmadığını kontrol etmek için guard kullanırsanız, kontrol başarısız olursa Swift her zaman return kullanmanızı isteyecektir.

 - If the check passes and the optional you’re unwrapping has a value inside, you can use it after the guard code finishes.
 - Kontrol geçerse ve açtığınız optional'ın içinde bir değer varsa, koruma kodu bittikten sonra bunu kullanabilirsiniz.

 You can see both of these points in action if you look at the printSquare() function from earlier:
 Daha önceki printSquare() fonksiyonuna bakarsanız bu iki noktayı da iş başında görebilirsiniz:
*/

func printSquare2(_ input: Int?) {
    guard let number = number else {
        print("Missing input")

        // 1: We *must* exit the function here
        return
    }

    // 2: `number` is still available outside of `guard`
    print("\(number) x \(number) is \(number * number)")
}

/**
    So: use if let to unwrap optionals so you can process them somehow, and use guard let to ensure optionals have something inside them and exit otherwise.
    Yani: if let'i optional'ları açmak için kullanın, böylece onları bir şekilde işleyebilirsiniz ve guard let'i optional'ların içinde bir şey olduğundan emin olmak ve aksi takdirde çıkmak için kullanın.

    Tip: You can use guard with any condition, including ones that don’t unwrap optionals. For example, you might use guard someArray.isEmpty else { return }.
    İpucu: Opsiyonelleri açmayanlar da dahil olmak üzere herhangi bir koşulla guard kullanabilirsiniz. Örneğin, guard someArray.isEmpty else { return } kullanabilirsiniz.
*/
