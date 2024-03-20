import Cocoa

/// # Why does Swift use underscores with loops?
/// # Swift neden döngülerde alt çizgi kullanır?



let names = ["Sterling", "Cyril", "Lana", "Ray", "Pam"]

for name in names {
    print("\(name) is a secret agent")
}

/**
 Döngü her döndüğünde, Swift names dizisinden bir öğe alır, onu name sabitine koyar ve ardından döngümüzün gövdesini çalıştırır - bu print() yöntemidir.

 Ancak, bazen o anda okunan değere gerçekten ihtiyacınız olmaz, işte bu noktada alt çizgi devreye girer: Swift aslında değişkene ihtiyacınız olmadığını anlayacak ve sizin için geçici bir sabit oluşturmayacaktır.

 Tabii ki, Swift bunu zaten görebiliyor - döngü içinde name kullanıp kullanmadığınızı görebiliyor, bu yüzden aynı işi alt çizgi olmadan da yapabiliyor. Bununla birlikte, alt çizgi kullanmak beynimiz için çok benzer bir şey yapar: koda bakabilir ve döngü gövdesinin içinde kaç satır kod olursa olsun, döngü değişkeninin kullanılmadığını hemen görebiliriz.

 Dolayısıyla, gövde içinde bir döngü değişkeni kullanmazsanız, Swift sizi bu şekilde yeniden yazmanız için uyaracaktır:
 */

let names2 = ["Sterling", "Cyril", "Lana", "Ray", "Pam"]

for _ in names2 {
    print("[CENSORED] is a secret agent!")
}

