import Cocoa

/// # How to use switch statements to check multiple conditions
/// # Birden fazla koşulu kontrol etmek için switch deyimleri nasıl kullanılır?

enum Weather {
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.sun

switch forecast {
case .sun:
    print("It should be a nice day.")
case .rain:
    print("Pack an umbrella.")
case .wind:
    print("Wear something warm")
case .snow:
    print("School is cancelled.")
case .unknown:
    print("Our forecast generator is broken!")
}

/// Eğer yukarda switch-case yerine if - else if kullansaydıkda olurdu. Ama burdaki olay Swift oluşturduğumuz enum'un bütün case'lerini biliyor. Bu sayede switch-case in içinde bu case'lerden birini yazmayı unutursak o bizi uyarıyor. If-else'de böyle bir şey yok.
/// Tüm switch ifadeleri kapsamlı olmalıdır, yani olası tüm değerler orada ele alınmalıdır, böylece kazara birini atlayamazsınız.



/// İlk olarak, evet tüm switch deyimleri kapsamlı olmalıdır: tüm olası değerlerin kapsandığından emin olmalısınız. Eğer bir string üzerinde switch yapıyorsanız, tüm olası stringleri kapsamlı bir şekilde kontrol etmeniz mümkün değildir, çünkü sonsuz sayıda string vardır, bu nedenle bunun yerine varsayılan bir durum sağlamamız gerekir - diğer durumlardan hiçbiri eşleşmezse çalıştırılacak kod.
let place = "Metropolis"

switch place {
case "Gotham":
    print("You're Batman!")
case "Mega-City One":
    print("You're Judge Dredd!")
case "Wakanda":
    print("You're Black Panther!")
default:
    print("Who are you?")
}
///  Unutmayın: Swift case'leri sırayla kontrol eder ve eşleşen ilk case'i çalıştırır. Default'u başka bir durumdan önce yerleştirirseniz, o durum hiçbir zaman eşleşmeyeceği için işe yaramaz ve Swift kodunuzu oluşturmayı reddeder.



/// İkinci olarak, Swift'in sonraki vakaları yürütmeye devam etmesini açıkça istiyorsanız, fallthrough kullanın. Bu yaygın olarak kullanılmaz, ancak bazen - sadece bazen - işi tekrarlamaktan kaçınmanıza yardımcı olabilir.
let day = 5
print("My true love gave to me…")

switch day {
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 French hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("A partridge in a pear tree")
}
/// Bu, ilk durumla eşleşecek ve "5 altın yüzük" yazdıracaktır, ancak fallthrough satırı, durum 4'ün yürütüleceği ve "4 çağıran kuş" yazdıracağı anlamına gelir, bu da fallthrough'u tekrar kullanır, böylece "3 Fransız tavuğu" yazdırılır ve bu böyle devam eder. Şarkıyla mükemmel bir eşleşme değil ama en azından işlevselliği iş başında görebilirsiniz!



