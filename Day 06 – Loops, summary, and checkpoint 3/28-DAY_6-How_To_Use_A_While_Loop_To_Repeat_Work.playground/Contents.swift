import Cocoa

/// # How to use a while loop to repeat work
/// # İşi tekrarlamak için while döngüsü nasıl kullanılır



/**
 Swift'in while adı verilen ikinci bir döngü türü vardır: bir koşul sağlayın ve while döngüsü koşul yanlış olana kadar döngü gövdesini sürekli olarak çalıştıracaktır.
 Zaman zaman while döngülerini görmeye devam etseniz de for döngüleri kadar yaygın değillerdir. Sonuç olarak, var olduklarını bilmeniz için onları ele almak istiyorum, ancak çok uzun süre üzerinde durmayalım, tamam mı?
*/

var countdown = 10

while countdown > 0 {
    print("\(countdown)…")
    countdown -= 1
}

print("Blast off!")
/// Bu, 10'dan başlayan bir tamsayı sayacı oluşturur, ardından geri sayım > 0 koşuluyla bir while döngüsü başlatır. Böylece, döngü gövdesi - sayıyı yazdırma ve 1 çıkarma - geri sayım 0'a eşit veya 0'ın altında olana kadar sürekli olarak çalışacak, bu noktada döngü bitecek ve son mesaj yazdırılacaktır.



/// while döngüleri, döngünün kaç kez döneceğini bilmediğiniz durumlarda gerçekten kullanışlıdır. Bunu göstermek için, size Int ve Double'ın sahip olduğu gerçekten kullanışlı bir işlevsellik parçasını tanıtmak istiyorum: random(in:). Bu fonksiyona çalışacağı bir sayı aralığı verdiğinizde, bu aralığın içinde bir yere rastgele bir Int veya Double gönderecektir.

///Örneğin, bu 1 ile 1000 arasında yeni bir tamsayı oluşturur
let id = Int.random(in: 1...1000)

/// Bu da 0 ile 1 arasında rastgele bir ondalık oluşturur:
let amount = Double.random(in: 0...1)



// create an integer to store our roll
var roll = 0

// carry on looping until we reach 20
while roll != 20 {
    // roll a new dice and print what it was
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
}

// if we're here it means the loop ended – we got a 20!
print("Critical hit!")

/// Kendi kodunuzda hem for hem de while döngülerini kullandığınızı göreceksiniz: for döngüleri, bir aralık veya dizi gibi üzerinden geçilecek sınırlı miktarda veriniz olduğunda daha yaygındır, ancak while döngüleri özel bir koşula ihtiyacınız olduğunda gerçekten yararlıdır.


