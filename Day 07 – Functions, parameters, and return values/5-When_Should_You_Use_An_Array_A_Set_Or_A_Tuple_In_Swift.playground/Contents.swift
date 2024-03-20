import Cocoa

/// # When should you use an array, a set, or a tuple in Swift?
/// # Swift'te ne zaman dizi, küme veya tuple kullanmalısınız? (Array, set, tuple)

/**
 Diziler, kümeler ve tuple'lar biraz farklı şekillerde çalıştığından, verilerinizin doğru ve verimli bir şekilde depolanması için doğru olanı seçtiğinizden emin olmanız önemlidir.

 Unutmayın: diziler sırayı korur ve yinelenebilir, kümeler sırasızdır ve yinelenemez ve tuple'lar içlerinde sabit türlerde sabit sayıda değere sahiptir.

 Yani:

 Bir oyun için sözlükteki tüm kelimelerin bir listesini saklamak istiyorsanız, bunun kopyası yoktur ve sıra önemli değildir, bu nedenle bir set seçersiniz.
 
 Bir kullanıcı tarafından okunan tüm makaleleri saklamak istiyorsanız, sıralama önemli değilse (tek önemsediğiniz okuyup okumadıklarıysa) bir küme kullanırsınız veya sıralama önemliyse bir dizi kullanırsınız.
 
 Bir video oyunu için yüksek puanların bir listesini saklamak istiyorsanız, bunun önemli bir sırası vardır ve yinelemeler içerebilir (iki oyuncu aynı puanı alırsa), bu nedenle bir dizi kullanırsınız.
 
 Bir yapılacaklar listesi için öğeleri saklamak istiyorsanız, bu en iyi sıralama tahmin edilebilir olduğunda işe yarar, bu nedenle bir dizi kullanmalısınız.
 
 Tam olarak iki string'i veya tam olarak iki string'i ve bir tamsayıyı veya tam olarak üç Boole'u veya benzerini tutmak istiyorsanız, bir tuple kullanmalısınız.
 */
