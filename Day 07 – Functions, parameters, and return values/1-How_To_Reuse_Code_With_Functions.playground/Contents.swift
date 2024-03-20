import Cocoa

/// # How to reuse code with functions
/// # Fonksiyonlarla kod nasıl yeniden kullanılır?

func showWelcome() {
    print("Welcome to my app!")
    print("By default This prints out a conversion")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want.")
}
/// Bu () işaretleri fonksiyonlarla birlikte kullanılır. Yukarıda gördüğünüz gibi fonksiyonu oluşturduğunuzda ve aynı zamanda fonksiyonu çağırdığınızda - Swift'ten kodunu çalıştırmasını istediğinizde kullanılırlar. Bizim durumumuzda, fonksiyonumuzu şu şekilde çağırabiliriz:

showWelcome()

/**
 That’s known as the function’s call site, which is a fancy name meaning “a place where a function is called.”
 Bu, "bir fonksiyonun çağrıldığı yer" anlamına gelen süslü bir isim olan fonksiyonun çağrı bölgesi olarak bilinir.
 
 So what do the parentheses actually do? Well, that’s where we add configuration options for our functions – we get to pass in data that customizes the way the function works, so the function becomes more flexible.
 Peki parantezler aslında ne işe yarar? İşlevlerimiz için yapılandırma seçenekleri eklediğimiz yer burasıdır - işlevin çalışma şeklini özelleştiren verileri aktarırız, böylece işlev daha esnek hale gelir.
 */

let number = 139

if number.isMultiple(of: 2) {
    print("Even")
} else {
    print("Odd")
}
/// isMultiple(of:) tamsayılara ait bir fonksiyondur. Herhangi bir özelleştirmeye izin vermeseydi, bir anlam ifade etmezdi - neyin katı?

let roll = Int.random(in: 1...20)
/// Yine, random() bir fonksiyondur ve (in: 1...20) kısmı yapılandırma seçeneklerini işaretler - bu olmadan rastgele sayılarımızın aralığı üzerinde hiçbir kontrolümüz olmazdı, bu da önemli ölçüde daha az kullanışlı olurdu.

/// Fonksiyonumuzu oluştururken parantezler arasına ekstra kod koyarak yapılandırmaya açık kendi fonksiyonlarımızı oluşturabiliriz. Bu fonksiyona 8 gibi tek bir tamsayı verilmeli ve 1'den 12'ye kadar olan çarpım tabloları hesaplanmalıdır.
func printTimesTables(number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5)
/// Parantezlerin içine nasıl number: Int yerleştirdiğime dikkat ettiniz mi? Buna parametre denir ve bizim özelleştirme noktamızdır. Bu fonksiyonu çağıran kişinin buraya bir tamsayı girmesi gerektiğini ve Swift'in bunu uygulayacağını söylüyoruz. Fonksiyonun içinde, number diğer sabitler gibi kullanılabilir, bu nedenle print() çağrısının içinde görünür.



func printTimesTables(number: Int, end: Int) { // Parameter/Placeholder
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5, end: 20) // Argument/Actual Value

/// Bu isim ayrımının bir önemi var mı? Pek değil: Ben her ikisi için de "parametre" kullanıyorum ve diğer insanların her ikisi için de "argüman" kullandığını biliyorum ve dürüst olmak gerekirse kariyerim boyunca bir kez bile en ufak bir soruna neden olmadı. Aslında, Swift'te birazdan göreceğiniz gibi, bu ayrım ekstra kafa karıştırıcıdır, bu yüzden üzerinde düşünmeye değmez.

/// İster "argüman" ister "parametre" olarak adlandırın, Swift'ten fonksiyonu çağırmasını istediğinizde parametreleri her zaman fonksiyonu oluşturduğunuzda listelendikleri sırayla geçirmeniz gerekir.

// printTimesTables(end: 20, number: 5) // --> Geçerli değil



/// Tip: Any data you create inside a function is automatically destroyed when the function is finished.
/// İpucu: Bir fonksiyon içinde oluşturduğunuz tüm veriler, fonksiyon tamamlandığında otomatik olarak yok edilir.

/**
 Swift lets us build new functions out of existing functions, which is a technique called function composition. By splitting your work into multiple small functions, function composition lets us build big functions by combining those small functions in various ways, a bit like Lego bricks.
 
 Swift, fonksiyon bileşimi adı verilen bir teknikle mevcut fonksiyonlardan yeni fonksiyonlar oluşturmamızı sağlar. İşinizi birden fazla küçük fonksiyona bölerek, fonksiyon bileşimi, bu küçük fonksiyonları çeşitli şekillerde birleştirerek, biraz Lego tuğlaları gibi büyük fonksiyonlar oluşturmamızı sağlar.
 */
