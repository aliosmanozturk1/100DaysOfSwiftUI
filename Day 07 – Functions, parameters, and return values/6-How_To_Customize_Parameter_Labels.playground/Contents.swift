import Cocoa

/// # How to customize parameter labels
/// # Parametre etiketleri nasıl özelleştirilir

/// ANLAMAZSAN SİTEYE BAK TAM ANLAYAMADIM



func isUppercase(string: String) -> Bool {
    string == string.uppercased()
}

let myString = "HELLO, WORLD"
let result = isUppercase(string: myString)

/// Buna bakıp tam olarak doğru olduğunu düşünebilirsiniz, ancak aynı zamanda string: string'e bakıp can sıkıcı bir tekrarlama görebilirsiniz. Sonuçta, oraya bir string'den başka ne geçireceğiz?
/// Parametre adının önüne bir alt çizgi eklersek, harici parametre etiketini aşağıdaki gibi kaldırabiliriz:

func isUppercase2(_ string: String) -> Bool {
    string == string.uppercased()
}

let myString2 = "HELLO, WORLD"
let result2 = isUppercase2(myString2)



/// Bu, Swift'te bir diziye öğe eklemek için append() veya bir öğenin bir dizinin içinde olup olmadığını kontrol etmek için contains() gibi birçok yerde kullanılır - her iki yerde de bir etikete sahip olmadan parametrenin ne olduğu oldukça açıktır.
/// Harici parametre adlarıyla ilgili ikinci sorun, bunların doğru olmamasıdır - bunlara sahip olmak istersiniz, bu nedenle _ iyi bir fikir değildir, ancak işlevin çağrı yerinde doğal olarak okunmazlar.



/// Örnek olarak, daha önce incelediğimiz başka bir fonksiyonu ele alalım:
func printTimesTables(number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}
printTimesTables(number: 5)
/// Bu kod geçerli bir Swift kodu ve olduğu gibi bırakabiliriz. Ancak çağrı sitesi iyi okunmuyor: printTimesTables(number: 5). Bu şekilde çok daha iyi olurdu:

func printTimesTables2(for: Int) {
    for i in 1...12 {
//        print("\(i) x \(for) is \(i * for)") // ama çalışmaz
    }
}
printTimesTables2(for: 5)

/**
 That reads much better at the call site – you can literally say “print times table for 5” aloud, and it makes sense. But now we have invalid Swift: although for is allowed and reads great at the call site, it’s not allowed inside the function.
 Bu, çağrı yerinde çok daha iyi okunur - kelimenin tam anlamıyla yüksek sesle "5 için çarpım tablosunu yazdır" diyebilirsiniz ve bu mantıklıdır. Ancak şimdi geçersiz Swift'imiz var: for'a izin verilmesine ve çağrı yerinde harika okunmasına rağmen, işlev içinde izin verilmez.

 You already saw how we can put _ before the parameter name so that we don’t need to write an external parameter name. Well, the other option is to write a second name there: one to use externally, and one to use internally.
 Harici bir parametre adı yazmamıza gerek kalmaması için parametre adının önüne nasıl _ koyabileceğimizi zaten gördünüz. Diğer bir seçenek de oraya ikinci bir isim yazmaktır: biri harici olarak kullanılacak, diğeri dahili olarak kullanılacak.
 */

func printTimesTables3(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables3(for: 5)

/**
 There are three things in there you need to look at closely:
 Burada yakından bakmanız gereken üç şey var:

 We write for number: Int: the external name is for, the internal name is number, and it’s of type Int.
 for number: Int yazıyoruz: dış ad for, iç ad number ve Int türünde.
 
 When we call the function we use the external name for the parameter: printTimesTables(for: 5).
 Fonksiyonu çağırdığımızda parametre için harici ismi kullanırız: printTimesTables(for: 5).
 
 Inside the function we use the internal name for the parameter: print("\(i) x \(number) is \(i * number)").
 Fonksiyonun içinde parametre için iç ismi kullanırız: print("\(i) x \(sayı) is \(i * sayı)").
 */

/**
 So, Swift gives us two important ways to control parameter names: we can use _ for the external parameter name so that it doesn’t get used, or add a second name there so that we have both external and internal parameter names.
 Swift bize parametre adlarını kontrol etmek için iki önemli yol sunar: harici parametre adı için _ kullanabiliriz, böylece kullanılmaz veya oraya ikinci bir ad ekleyerek hem harici hem de dahili parametre adlarına sahip olabiliriz.

 Tip: Earlier I mentioned that technically values you pass in to a function are called “arguments”, and values you receive inside the function are called parameters. This is where things get a bit muddled, because now we have argument labels and parameter names side by side, both in the function definition. Like I said, I’ll be using the term “parameter” for both, and when the distinction matters you’ll see I distinguish between them using “external parameter name” and “internal parameter name”.
 İpucu: Daha önce teknik olarak bir fonksiyona aktardığınız değerlere "argüman", fonksiyon içinde aldığınız değerlere ise parametre denildiğinden bahsetmiştim. İşte bu noktada işler biraz karışıyor, çünkü artık fonksiyon tanımında hem argüman etiketlerimiz hem de parametre isimlerimiz yan yana bulunuyor. Dediğim gibi, her ikisi için de "parametre" terimini kullanacağım ve ayrım önemli olduğunda "harici parametre adı" ve "dahili parametre adı" kullanarak bunları birbirinden ayırdığımı göreceksiniz.
 
 */
