import Cocoa

/// # Why can variable properties in constant classes be changed?
/// # Sabit sınıflardaki değişken özellikler neden değiştirilebilir?

/**
    One of the small but important differences between structs and classes is the way they handle mutability of properties:
    Yapılar ve sınıflar arasındaki küçük ama önemli farklardan biri, özelliklerin değiştirilebilirliğini ele alma şekilleridir:
    - Variable classes can have variable properties changed
    - Değişken sınıfların değişken özellikleri değiştirilebilir

    - Constant classes can have variable properties changed
    - Sabit sınıfların değişken özellikleri değiştirilebilir

    - Variable structs can have variable properties changed
    - Değişken yapıların değişken özellikleri değiştirilebilir

    - Constant structs cannot have variable properties changed
    - Sabit yapıların değişken özellikleri değiştirilemez

    The reason for this lies in the fundamental difference between a class and a struct: one points to some data in memory, whereas the other is one value such as the number 5.
    Bunun nedeni, bir class ile struct arasındaki temel farkta yatmaktadır: biri bellekteki bazı verilere işaret ederken, diğeri 5 sayısı gibi bir değerdir.

    Consider code such as this:
    Bunun gibi bir kod düşünün:
*/

var number = 5
number = 6

/**
    We can’t simply define the number 5 to be 6, because that wouldn’t make sense – it would break everything we know about mathematics. Instead, that code removes the existing value assigned to number and gives it the number 6 instead.
    Basitçe 5 sayısını 6 olarak tanımlayamayız, çünkü bu mantıklı olmaz - matematik hakkında bildiğimiz her şeyi bozar. Bunun yerine, bu kod sayıya atanmış mevcut değeri kaldırır ve onun yerine 6 sayısını verir.

    That’s how structs work in Swift: when we change one of its properties, we are in fact changing the entire struct. Sure, behind the scenes Swift can do some optimization so that it isn’t really throwing away the whole value every time we change just one part of it, but that’s how it’s treated from our perspective.
    Swift'te struct'lar bu şekilde çalışır: özelliklerinden birini değiştirdiğimizde, aslında tüm struct'ı değiştirmiş oluruz. Elbette, Swift perde arkasında bazı optimizasyonlar yapabilir, böylece sadece bir parçasını her değiştirdiğimizde tüm değeri gerçekten atmaz, ancak bizim bakış açımızdan bu şekilde ele alınır.

    So, if changing one part of a struct effectively means destroying and recreating the entire struct, hopefully you can see why constant structs don’t allow their variable properties to be changed – it would mean destroying and recreating something that is supposed to be constant, which isn’t possible.
    Dolayısıyla, bir yapının bir parçasını değiştirmek tüm yapıyı yok etmek ve yeniden oluşturmak anlamına geliyorsa, sabit yapıların değişken özelliklerinin değiştirilmesine neden izin vermediğini umarım anlayabilirsiniz - bu, sabit olması gereken bir şeyi yok etmek ve yeniden oluşturmak anlamına gelir ki bu mümkün değildir.

    Classes don’t work this way: you can change any part of their properties without having to destroy and recreate the value. As a result, constant classes can have their variable properties changed freely.
    Sınıflar bu şekilde çalışmaz: değeri yok etmek ve yeniden oluşturmak zorunda kalmadan özelliklerinin herhangi bir bölümünü değiştirebilirsiniz. Sonuç olarak, sabit sınıfların değişken özellikleri serbestçe değiştirilebilir.
*/
