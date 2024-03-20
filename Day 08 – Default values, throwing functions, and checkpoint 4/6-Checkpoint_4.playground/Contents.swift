import Cocoa

/// # Why does Swift make us use try before every throwing function?
/// # Swift neden her throw fonksiyonundan önce try kullanmamızı istiyor?

/**
     The challenge is this: write a function that accepts an integer from 1 through 10,000, and returns the integer square root of that number. That sounds easy, but there are some catches:

     You can’t use Swift’s built-in sqrt() function or similar – you need to find the square root yourself.
     If the number is less than 1 or greater than 10,000 you should throw an “out of bounds” error.
     You should only consider integer square roots – don’t worry about the square root of 3 being 1.732, for example.
     If you can’t find the square root, throw a “no root” error.
     As a reminder, if you have number X, the square root of X will be another number that, when multiplied by itself, gives X. So, the square root of 9 is 3, because 3x3 is 9, and the square root of 25 is 5, because 5x5 is 25.

     I’ll give you some hints in a moment, but as always I encourage you to try it yourself first – struggling to remember how things work, and often having to look them up again, is a powerful way to make progress.
*/
/**
     Zorluk şu: 1'den 10.000'e kadar bir tamsayı kabul eden ve bu sayının tamsayı karekökünü döndüren bir fonksiyon yazın. Kulağa kolay geliyor, ancak bazı püf noktaları var:

     Swift'in yerleşik sqrt() fonksiyonunu veya benzerini kullanamazsınız - karekökü kendiniz bulmanız gerekir.
     Eğer sayı 1'den küçük veya 10.000'den büyükse "sınırların dışında" hatası vermelisiniz.
     Yalnızca tamsayı kareköklerini dikkate almalısınız - örneğin 3'ün karekökünün 1,732 olması konusunda endişelenmeyin.
     Eğer karekökü bulamazsanız, "kök yok" hatası verin.
     Bir hatırlatma olarak, elinizde X sayısı varsa, X'in karekökü kendisiyle çarpıldığında X'i veren başka bir sayı olacaktır. 9'un karekökü 3'tür, çünkü 3x3 9'dur ve 25'in karekökü 5'tir, çünkü 5x5 25'tir.

     Birazdan size bazı ipuçları vereceğim, ancak her zaman olduğu gibi önce kendiniz denemenizi tavsiye ederim - işlerin nasıl yürüdüğünü hatırlamak için mücadele etmek ve sık sık tekrar bakmak zorunda kalmak, ilerleme kaydetmek için güçlü bir yoldur.
*/

enum SqrtError: Error {
    case tooSmallNumber, tooBigNumber, noRoot
}

func mySqrt(_ number: Int) throws -> Int {
    if number < 1 {
        throw SqrtError.tooSmallNumber
    }
    
    if number > 10000 {
        throw SqrtError.tooBigNumber
    }
    
    for i in 1...100 {
        if number == i * i {
            return i
        }
    }
    throw SqrtError.noRoot
}

let number = 3
do {
    let result = try mySqrt(number)
    print("Girdiğiniz sayının karekökü: \(result)")
} catch SqrtError.tooSmallNumber {
    print("Girdiğiniz sayı 1'den küçüktür.")
} catch SqrtError.tooBigNumber {
    print("Girdiğiniz sayı 10000'den büyüktür.")
} catch SqrtError.noRoot {
    print("Girdiğiniz sayının tam karekökü yoktur.")
} catch {
    print("Bilinmedik bir hatayla karşılaşıldı.")
}


/**
    Still here? Okay, here are some hints:

    This is a problem you should “brute force” – create a loop with multiplications inside, looking for the integer you were passed in.
    The square root of 10,000 – the largest number I want you to handle – is 100, so your loop should stop there.
    If you reach the end of your loop without finding a match, throw the “no root” error.
    You can define different out of bounds errors for “less than 1” and “greater than 10,000” if you want, but it’s not really necessary – just having one is fine.
*/
/**
    Hâlâ burada mısın? Tamam, işte bazı ipuçları:

    Bu "kaba kuvvet" uygulamanız gereken bir problemdir - içinde çarpmalar olan bir döngü oluşturun ve size iletilen tamsayıyı arayın.
    Ele almanızı istediğim en büyük sayı olan 10.000'in karekökü 100'dür, bu nedenle döngünüz orada durmalıdır.
    Eğer bir eşleşme bulamadan döngünün sonuna ulaşırsanız, "kök yok" hatası verirsiniz.
    İsterseniz "1'den küçük" ve "10.000'den büyük" için farklı sınır dışı hatalar tanımlayabilirsiniz, ancak bu gerçekten gerekli değildir - sadece bir tane olması yeterlidir.
 */
