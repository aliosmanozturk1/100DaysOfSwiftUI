import Cocoa

/// # Why does Swift make us use try before every throwing function?
/// # Swift neden her throw fonksiyonundan önce try kullanmamızı istiyor?

// PEK ANLAMADIM

/**
    Using Swift’s throwing functions relies on three unique keywords: do, try, and catch. We need all three to be able to call a throwing function, which is unusual – most other languages use only two, because they don’t need to write try before every throwing function.
    Swift'in fırlatma fonksiyonlarını kullanmak üç benzersiz anahtar kelimeye dayanır: do, try ve catch. Bir fırlatma fonksiyonunu çağırabilmek için üçüne de ihtiyacımız var ki bu alışılmadık bir durumdur - diğer dillerin çoğu sadece iki tanesini kullanır, çünkü her fırlatma fonksiyonundan önce try yazmaları gerekmez.

    The reason Swift is different is fairly simple: by forcing us to use try before every throwing function, we’re explicitly acknowledging which parts of our code can cause errors. This is particularly useful if you have several throwing functions in a single do block, like this:
    Swift'in farklı olmasının nedeni oldukça basittir: bizi her fırlatma fonksiyonundan önce try kullanmaya zorlayarak, kodumuzun hangi bölümlerinin hataya neden olabileceğini açıkça kabul etmiş oluruz. Bu, özellikle bunun gibi tek bir do bloğunda birkaç fırlatma fonksiyonunuz varsa kullanışlıdır:
*/

/**
    do {
        try throwingFunction1()
        nonThrowingFunction1()
        try throwingFunction2()
        nonThrowingFunction2()
        try throwingFunction3()
    } catch {
        // handle errors
    }
*/

/// Gördüğünüz gibi, try kullanımı birinci, üçüncü ve beşinci fonksiyon çağrılarının hata atabileceğini, ancak ikinci ve dördüncünün atamayacağını açıkça ortaya koymaktadır.


