import Cocoa

/// # When would you want to override a method?

/**
    In Swift, any class that inherits from a parent class can override the methods and sometimes the properties of that parent class, which means they can replace the parent’s method implementation with one of their own.
    Swift'te, bir üst sınıftan miras alan herhangi bir sınıf, o üst sınıfın yöntemlerini ve bazen de özelliklerini geçersiz kılabilir; bu da üst sınıfın yöntem uygulamasını kendi yöntemlerinden biriyle değiştirebilecekleri anlamına gelir.

    This level of customization is really important, and makes our lives easier as developers. Think about it: if someone has designed a brilliant class that you want to use, but it isn’t quite right, wouldn’t it be nice to just override one part of its behavior rather than having to rewrite the whole thing yourself?
    Bu düzeyde özelleştirme gerçekten önemlidir ve geliştiriciler olarak hayatımızı kolaylaştırır. Bir düşünün: Birisi kullanmak istediğiniz harika bir sınıf tasarladıysa, ancak tam olarak doğru değilse, her şeyi kendiniz yeniden yazmak zorunda kalmak yerine davranışının bir bölümünü geçersiz kılmak hoş olmaz mıydı?

    Sure it would, and that’s exactly where method overriding comes in: you can keep all the behavior you want, and just change one or two little parts in a custom subclass.
    Elbette olur ve metot geçersiz kılma tam da bu noktada devreye girer: istediğiniz tüm davranışı koruyabilir ve özel bir alt sınıfta sadece bir veya iki küçük parçayı değiştirebilirsiniz.

    In UIKit, Apple’s original user interface framework for iOS, this approach was used a lot. For example, consider some of the built-in apps such as Settings and Messages. Both of these present information in rows: Settings has rows such as General, Control Center, Display & Brightness, and so on, and Messages has individual rows for each conversation you’ve had with different people. In UIKit these are called tables, and they have some common behavior: you can scroll through all the rows, you can tap on the rows to select one, there are little gray arrows on the right side of the rows, and so on.
    Apple'ın iOS için orijinal kullanıcı arayüzü çerçevesi olan UIKit'te bu yaklaşım çok kullanıldı. Örneğin, Ayarlar ve Mesajlar gibi bazı yerleşik uygulamaları düşünün. Bunların her ikisi de bilgileri satırlar halinde sunar: Ayarlar'da Genel, Denetim Merkezi, Ekran ve Parlaklık gibi satırlar bulunurken Mesajlar'da farklı kişilerle yaptığınız her konuşma için ayrı satırlar bulunur. UIKit'te bunlar tablo olarak adlandırılır ve bazı ortak davranışları vardır: tüm satırlar arasında gezinebilirsiniz, birini seçmek için satırlara dokunabilirsiniz, satırların sağ tarafında küçük gri oklar vardır vb.

    These lists of rows are very common, so Apple provided us existing code to use them that has all that standard behavior built right in. Of course, there are some bits that actually need to change, such as how many rows the lists have and what content they have inside. So, Swift developers would create subclasses of Apple’s table and override the parts they wanted to change, giving them all the built-in functionality and lots of flexibility and control.
    Bu satır listeleri çok yaygındır, bu nedenle Apple bize bunları kullanmak için tüm bu standart davranışlara sahip mevcut kodu sağladı. Elbette, listelerin kaç satıra sahip olduğu ve içinde hangi içeriğin bulunduğu gibi gerçekten değişmesi gereken bazı kısımlar var. Bu nedenle Swift geliştiricileri Apple'ın tablosunun alt sınıflarını oluşturup değiştirmek istedikleri kısımları geçersiz kılarak tüm yerleşik işlevselliğin yanı sıra çok sayıda esneklik ve kontrol elde ediyorlardı.

    Swift makes us use the override keyword before overriding functions, which is really helpful:
    Swift, fonksiyonları geçersiz kılmadan önce override anahtar sözcüğünü kullanmamızı sağlar, bu gerçekten yararlıdır:
    - If you use it when it isn’t needed (because the parent class doesn’t declare the same method) then you’ll get an error. This stops you from mistyping things, such as parameter names or types, and also stops your override from failing if the parent class changes its method and you don’t follow suit.
    - Gerekli olmadığı halde kullanırsanız (çünkü ana sınıf aynı yöntemi bildirmez) bir hata alırsınız. Bu, parametre adları veya türleri gibi şeyleri yanlış yazmanızı önler ve ayrıca üst sınıf yöntemini değiştirirse ve siz de buna uymazsanız geçersiz kılma işleminizin başarısız olmasını önler.

    - If you don’t use it when it is needed, then you’ll also get an error. This stops you from accidentally changing behavior from the parent class.
    - Gerektiğinde kullanmazsanız, o zaman da bir hata alırsınız. Bu, ana sınıftaki davranışı yanlışlıkla değiştirmenizi engeller.
*/
