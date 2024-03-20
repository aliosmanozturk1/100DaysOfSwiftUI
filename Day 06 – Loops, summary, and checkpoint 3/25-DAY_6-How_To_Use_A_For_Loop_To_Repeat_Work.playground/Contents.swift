import Cocoa

/// # How to use a for loop to repeat work
/// # İşi tekrarlamak için for döngüsü nasıl kullanılır



/// Basit bir şeyle başlayalım: elimizde bir dizi karakter varsa, her bir karakter dizisini şu şekilde yazdırabiliriz:

let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
    print("Swift works great on \(os).")
}
/// Bu, platformlardaki tüm öğeler üzerinde döngü yaparak bunları teker teker os içine yerleştirir. Os'u başka bir yerde oluşturmadık; döngünün bir parçası olarak bizim için oluşturuldu ve yalnızca açılış ve kapanış parantezlerinin içinde kullanılabilir hale getirildi.

/// Parantezlerin içinde dizideki her öğe için çalıştırmak istediğimiz kod bulunur, bu nedenle yukarıdaki kod her döngü öğesi için bir tane olmak üzere dört satır yazdıracaktır. Önce "iOS" yazıyor ve print() fonksiyonunu çağırıyor, sonra "macOS" yazıyor ve print() fonksiyonunu çağırıyor, sonra "tvOS", sonra "watchOS".

/**
 Anlaşılmasını kolaylaştırmak için bunlara ortak isimler veriyoruz:
 - We call the code inside the braces the loop body
 - Parantezlerin içindeki koda döngü gövdesi diyoruz.
 
 - We call one cycle through the loop body a loop iteration.
 - Döngü gövdesi boyunca bir döngüye döngü yinelemesi diyoruz.
 
 - We call os the loop variable. This exists only inside the loop body, and will change to a new value in the next loop iteration.
 - Os'ye döngü değişkeni diyoruz. Bu değişken yalnızca döngü gövdesi içinde bulunur ve bir sonraki döngü yinelemesinde yeni bir değere dönüşür. Os isminin özel olmadığını söylemeliyim - bunun yerine bunu da yazabilirdik:
 */

/// Os isminin özel olmadığını söylemeliyim - bunun yerine bunu da yazabilirdik:

for name in platforms {
    print("Swift works great on \(name).")
}

/// Aslında, Xcode burada gerçekten akıllıdır: for plat yazarsanız, platformlar adında bir dizi olduğunu tanıyacak ve platformlardaki tüm for platform'ları otomatik olarak tamamlamayı önerecektir - platformların çoğul olduğunu tanır ve döngü değişkeni için tekil adı önerir. Xcode'un önerisini gördüğünüzde, seçmek için Return tuşuna basın.

for platform in platforms {
    print("Swift works great on \(platform).")
}

/// Bir array (veya set veya dictionary - sözdizimi aynıdır!) üzerinde döngü yapmak yerine, sabit bir sayı aralığı üzerinde de döngü yapabilirsiniz. Örneğin, 5 çarpım tablosunu 1'den 12'ye kadar şu şekilde yazdırabiliriz:
for i in 1...12 {
    print("5 x \(i) is \(5 * i)")
}

/**
 "Saydığınız sayı" için yaygın bir kodlama kuralı olan i döngü değişkenini kullandım. Eğer ikinci bir sayıyı sayıyorsanız j'yi, üçüncü bir sayıyı sayıyorsanız k'yı kullanırsınız, ama eğer dördüncü bir sayıyı sayıyorsanız belki de daha iyi değişken isimleri seçmelisiniz.

 The 1...12 part is a range, and means “all integer numbers between 1 and 12, as well as 1 and 12 themselves.” Ranges are their own unique data type in Swift.
 1...12 kısmı bir aralıktır ve "1 ve 12 arasındaki tüm tam sayıların yanı sıra 1 ve 12'nin kendisi" anlamına gelir. Aralıklar Swift'te kendilerine özgü bir veri tipidir.

 Yani, bu döngü ilk çalıştığında i 1 olacak, sonra 2 olacak, sonra 3 olacak, vb. 12'ye kadar gidecek ve döngü bitecektir.
 */

/// You can also put loops inside loops, called nested loops, like this:
/// İç içe döngüler olarak adlandırılan döngülerin içine de döngüler koyabilirsiniz:

for i in 1...12 {
    print("The \(i) times table:")

    for j in 1...12 {
        print("  \(j) x \(i) is \(j * i)")
    }

    print()
}

/**
 Şimdi iç içe geçmiş bir döngü var: 1'den 12'ye kadar sayıyoruz ve içindeki her sayı için tekrar 1'den 12'ye kadar sayıyoruz.
 print() işlevini metin veya değer aktarılmadan tek başına kullanmak sadece yeni bir satır başlatacaktır. Bu, ekranda daha güzel görünmesi için çıktımızı bölmemize yardımcı olur.
 */

/// Swift, son sayıya kadar sayan ancak son sayıyı hariç tutan benzer ancak farklı bir aralık türüne sahiptir:  Bu ..<
for i in 1...5 {
    print("Counting from 1 through 5: \(i)")
}

print()

for i in 1..<5 {
    print("Counting 1 up to 5: \(i)")
}

/// İpucu: ..< 0'dan itibaren saydığımız ve genellikle dizideki öğe sayısı hariç olmak üzere saymak istediğimiz dizilerle çalışmak için gerçekten yararlıdır.


/**
 Before we’re done with for loops, there’s one more thing I want to mention: sometimes you want to run some code a certain number of times using a range, but you don’t actually want the loop variable – you don’t want the i or j, because you don’t use it.
 for döngüleriyle işimiz bitmeden önce, bahsetmek istediğim bir şey daha var: bazen bir aralık kullanarak bazı kodları belirli sayıda çalıştırmak istersiniz, ancak aslında döngü değişkenini istemezsiniz - i veya j'yi istemezsiniz, çünkü onu kullanmazsınız.
 
 In this situation, you can replace the loop variable with an underscore, like this:
 Bu durumda, döngü değişkenini aşağıdaki gibi bir alt çizgi ile değiştirebilirsiniz:
 */

var lyric = "Haters gonna"

for _ in 1...5 {
    lyric += " hate"
}

print(lyric)
