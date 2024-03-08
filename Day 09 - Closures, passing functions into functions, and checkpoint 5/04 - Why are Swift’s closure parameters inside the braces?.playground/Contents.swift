import Cocoa

/// # Introduction
/// # Giriş

/**
    Both closures and functions can take parameters, but the way they take parameters is very different. Here’s a function that accepts a string and an integer:
    Hem closure'lar hem de fonksiyonlar parametre alabilir, ancak parametre alma şekilleri çok farklıdır. İşte bir string ve bir integer kabul eden bir fonksiyon:
*/

func pay(user: String, amount: Int) {
    // code
}

/**
    And here’s exactly the same thing written as a closure:
    Burada da Closure olarak yazılmış aynı şey var:
*/

let payment = { (user: String, amount: Int) in
    // code
}

/**
    As you can see, the parameters have moved inside the braces, and the in keyword is there to mark the end of the parameter list and the start of the closure’s body itself.
    Gördüğünüz gibi, parametreler parantezlerin içine taşındı ve in anahtar sözcüğü parametre listesinin sonunu ve closure'un gövdesinin başlangıcını işaretlemek için orada.

    Closures take their parameters inside the brace to avoid confusing Swift: if we had written let payment = (user: String, amount: Int) then it would look like we were trying to create a tuple, not a closure, which would be strange.
    Closure'lar Swift'in kafasını karıştırmamak için parametrelerini parantezin içine alır: let payment = (user: String, amount: Int) yazsaydık, bir closure değil de bir tuple oluşturmaya çalışıyormuşuz gibi görünürdü ve bu da garip olurdu.

    If you think about it, having the parameters inside the braces also neatly captures the way that whole thing is one block of data stored inside the variable – the parameter list and the closure body are all part of the same lump of code, and stored in our variable.
    Düşünürseniz, parametrelerin parantezler içinde olması, tüm bu şeyin değişken içinde depolanan bir veri bloğu olduğunu da düzgün bir şekilde yakalar - parametre listesi ve closure gövdesi aynı kod yığınının bir parçasıdır ve değişkenimizde depolanır.

    Having the parameter list inside the braces shows why the in keyword is so important – without that it’s hard for Swift to know where your closure body actually starts, because there’s no second set of braces.
    Parametre listesinin parantezler içinde olması, in anahtar kelimesinin neden bu kadar önemli olduğunu gösterir - bu olmadan Swift'in closure gövdenizin gerçekte nerede başladığını bilmesi zordur, çünkü ikinci bir parantez seti yoktur.
*/
