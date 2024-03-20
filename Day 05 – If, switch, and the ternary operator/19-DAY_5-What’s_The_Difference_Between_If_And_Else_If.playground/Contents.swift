import Cocoa

/// # What’s the difference between if and else if?
/// # if ve else if arasındaki fark nedir?

let score = 9001

if score > 9000 {
    print("It's over 9000!")
}

if score <= 9000 {
    print("It's not over 9000!")
}

/// Bu mükemmel bir şekilde çalışır ve kodunuz tam olarak beklediğiniz şeyi yapar. Ancak şimdi Swift'e yapması için daha fazla iş verdik: score değerini iki kez kontrol etmesi gerekiyor. Burada basit bir tamsayı ile bu çok hızlıdır, ancak verilerimiz daha karmaşık olsaydı o zaman daha yavaş olurdu.

if score > 9000 {
    print("It's over 9000!")
} else {
    print("It's not over 9000!")
}

/// Burada else devreye girer, çünkü "kontrol ettiğimiz koşul doğru değilse, bunun yerine bu kodu çalıştır" anlamına gelir.
/// Bu değişiklikle Swift skoru yalnızca bir kez kontrol edecek, ayrıca kodumuz daha kısa ve okunması daha kolay olacak.



/// Şimdi üç mesaj istediğimizi düşünün: biri skor 9000'in üzerinde olduğunda, biri tam olarak 9000 olduğunda ve biri de 9000'in altında olduğunda. Bunu yazabiliriz:

if score > 9000 {
    print("It's over 9000!")
} else {
    if score == 9000 {
        print("It's exactly 9000!")
    } else {
        print("It's not over 9000!")
    }
}

/// Yine, bu tamamen iyidir ve tam da umduğunuz gibi çalışır. Ancak, else if kullanarak kodu daha kolay okunabilir hale getirebiliriz, bu da else ile hemen ardından gelen if'i aşağıdaki gibi birleştirmemizi sağlar:

if score > 9000 {
    print("It's over 9000!")
} else if score == 9000 {
    print("It's exactly 9000!")
} else {
    print("It's not over 9000!")
}

/// Bu, kodumuzun okunmasını ve anlaşılmasını biraz daha kolaylaştırır, çünkü iç içe geçmiş koşullara sahip olmak yerine okuyabileceğimiz tek bir akışımız vardır.
/// You can have as many else if checks as you want, but you need exactly one if and either zero or one else.
/// İstediğiniz kadar else if kontrolüne sahip olabilirsiniz, ancak tam olarak bir if ve ya sıfır ya da bir else kontrolüne ihtiyacınız vardır.






