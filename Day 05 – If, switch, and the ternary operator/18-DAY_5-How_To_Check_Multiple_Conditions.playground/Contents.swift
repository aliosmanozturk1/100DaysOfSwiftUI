import Cocoa

/// # How to check multiple conditions
/// # Birden fazla koşul nasıl kontrol edilir


let age = 16

if age >= 18 {
    print("You can vote in the next election.")
} else {
    print("Sorry, you're too young to vote.")
}
/// Artık Swift'in yaşı yalnızca bir kez kontrol etmesi gerekiyor: 18'den büyük veya eşitse ilk print() kodu çalıştırılır, ancak 18'den küçük herhangi bir değer ise ikinci print() kodu çalıştırılır.



/// İlk If başarısız olursa yeni bir kontrol yapmanızı sağlayan else if adında daha da gelişmiş bir koşul vardır.
let a = false
let b = true

if a {
    print("Code to run if a is true")
} else if b {
    print("Code to run if a is false but b is true")
} else {
    print("Code to run if both a and b are false")
}



/// "Bugünün sıcaklığı 20 santigrat derecenin üzerinde ancak 30'un altındaysa bir mesaj yazdır" demek isteyebiliriz.
let temp = 25

if temp > 20 {
    if temp < 30 {
        print("It's a nice day.")
    }
}



/// Bu yeterince iyi çalışsa da, Swift daha kısa bir alternatif sunar: iki koşulu birleştirmek için && kullanabiliriz ve tüm koşul yalnızca koşulun içindeki iki parça doğruysa doğru olur.
if temp > 20 && temp < 30 {
    print("It's a nice day.")
}
/// You should read && as “and”,
/// It’s called a logical operator because it combines Booleans to make a new Boolean.
/// Buna mantıksal operatör denir çünkü Boolean'ları birleştirerek yeni bir Boolean oluşturur.



/// && has a counterpart that is two pipe symbols, ||, which means “or”. Whereas && will only make a condition be true if both subconditions are true, || will make a condition be true if either subcondition is true.
/// && iki boru sembolü olan bir karşılığı vardır, ||, "veya" anlamına gelir. && yalnızca her iki alt koşul da doğruysa bir koşulun doğru olmasını sağlarken, || her iki alt koşuldan biri bile doğruysa bir koşulun doğru olmasını sağlar.
/// Örneğin, bir kullanıcının en az 18 yaşındaysa bir oyun satın alabileceğini veya 18 yaşın altındaysa bir ebeveynden izin alması gerektiğini söyleyebiliriz. Bunu || kullanarak şu şekilde yazabiliriz:
let userAge = 14
let hasParentalConsent = true

if userAge >= 18 || hasParentalConsent == true {
    print("You can buy the game")
}



/// Unutmayın, bir koşulda == true kullanımı kaldırılabilir, çünkü zaten bir Boolean'ı kontrol ettiğimiz açıktır. Yani, bunun yerine şunu yazabiliriz:
if userAge >= 18 || hasParentalConsent {
    print("You can buy the game")
}



/// Karışık bir örnek yapalım.
enum TransportOption {
    case airplane, helicopter, bicycle, car, scooter
}

let transport = TransportOption.airplane

if transport == .airplane || transport == .helicopter {
    print("Let's fly!")
} else if transport == .bicycle {
    print("I hope there's a bike path…")
} else if transport == .car {
    print("Time to get stuck in traffic.")
} else {
    print("I'm going to hire a scooter now!")
}
/// When we set the value for transport we need to be explicit that we’re referring to TransportOption.airplane. We can’t just write .airplane because Swift doesn’t understand we mean the TransportOption enum.
/// Transport için değer belirlediğimizde, TransportOption.airplane'e atıfta bulunduğumuzu açıkça belirtmemiz gerekir. Sadece .airplane yazamayız çünkü Swift, TransportOption enum'unu kastettiğimizi anlamaz.
/// Once that has happened, we don’t need to write TransportOption any more because Swift knows transport must be some kind of TransportOption. So, we can check whether it’s equal to .airplane rather than TransportOption.airplane.
/// Bu gerçekleştiğinde, artık TransportOption yazmamıza gerek kalmaz çünkü Swift transport'un bir tür TransportOption olması gerektiğini bilir. Böylece, TransportOption.airplane yerine .airplane'e eşit olup olmadığını kontrol edebiliriz.

