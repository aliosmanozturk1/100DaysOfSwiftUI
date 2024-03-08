import Cocoa

/// # How do you return a value from a closure that takes no parameters?
/// # Parametre almayan bir closure'dan nasıl değer döndürürsünüz?

/**
    Closures in Swift have a distinct syntax that really separates them from simple functions, and one place that can cause confusion is how we accept and return parameters.
    Swift'teki Closure'lar, onları basit fonksiyonlardan gerçekten ayıran farklı bir sözdizimine sahiptir ve kafa karışıklığına neden olabilecek bir yer, parametreleri nasıl kabul ettiğimiz ve döndürdüğümüzdür.

    First, here’s a closure that accepts one parameter and returns nothing:
    İlk olarak, burada bir parametre kabul eden ve hiçbir şey döndürmeyen bir closure var:
*/

let payment = { (user: String) in
    print("Paying \(user)…")
}

/**
    Now here’s a closure that accepts one parameter and returns a Boolean:
    Şimdi bir parametre kabul eden ve bir Boolean döndüren bir closure var:
*/

let payment2 = { (user: String) -> Bool in
    print("Paying \(user)…")
    return true
}

/**
    If you want to return a value without accepting any parameters, you can’t just write -> Bool in – Swift won’t understand what you mean. Instead, you should use empty parentheses for your parameter list, like this:
    Herhangi bir parametre kabul etmeden bir değer döndürmek istiyorsanız, sadece -> Bool yazamazsınız - Swift ne demek istediğinizi anlamayacaktır. Bunun yerine, parametre listeniz için aşağıdaki gibi boş parantezler kullanmalısınız:
*/

let payment3 = { () -> Bool in
    print("Paying an anonymous person…")
    return true
}

/**
    If you think about it, that works just the same as a standard function where’d write func payment() -> Bool.
    Eğer düşünürseniz, bu func payment() -> Bool yazabileceğiniz standart bir fonksiyonla aynı şekilde çalışır.
 */
