import Cocoa

/// # When should you use a while loop
/// # Ne zaman while döngüsü kullanmalısınız?



/// Temel fark, for döngülerinin genellikle sonlu dizilerle kullanılmasıdır: örneğin, 1'den 10'a kadar olan sayılar veya bir dizideki öğeler arasında döngü yaparız. Öte yandan while döngüleri, herhangi bir rastgele koşul yanlış olana kadar döngü yapabilir, bu da onlara durmalarını söyleyene kadar izin verir.

/// Bir düşünün: Eğer sizden 10 zar atmanızı ve sonuçlarını yazdırmanızı isteseydim, bunu 1'den 10'a kadar sayarak basit bir for döngüsü ile yapabilirdiniz. Ancak sizden 10 zar atmanızı ve sonuçları yazdırmanızı, aynı zamanda önceki zarın aynı sonucu vermesi durumunda otomatik olarak başka bir zar atmanızı isteseydim, o zaman kaç zar atmanız gerektiğini önceden bilemezsiniz. Belki şansınız yaver gider ve sadece 10 zar atmanız gerekir, ama belki de birkaç mükerrer zar atarsınız ve 15 zara ihtiyacınız olur. Ya da belki de çok sayıda mükerrer zar atacaksınız ve 30 zara ihtiyacınız olacak. İşte burada while döngüsü işe yarar: çıkmaya hazır olana kadar döngüyü devam ettirebiliriz.

