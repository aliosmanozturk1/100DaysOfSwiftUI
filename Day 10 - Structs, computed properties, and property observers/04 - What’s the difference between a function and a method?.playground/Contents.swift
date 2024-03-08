import Cocoa

/// # What’s the difference between a function and a method?

/**
    Swift’s functions let us name a piece of functionality and run it repeatedly, and Swift’s methods do much the same thing, so what’s the difference?
    Swift'in fonksiyonları bir işlev parçasını adlandırmamıza ve tekrar tekrar çalıştırmamıza izin verir ve Swift'in yöntemleri de hemen hemen aynı şeyi yapar, peki fark nedir?

    Honestly, the only real difference is that methods belong to a type, such as structs, enums, and classes, whereas functions do not. That’s it – that’s the only difference. Both can accept any number of parameters, including variadic parameters, and both can return values. Heck, they are so similar that Swift still uses the func keyword to define a method.
    Dürüst olmak gerekirse, tek gerçek fark metotların struct, enum ve sınıf gibi bir türe ait olması, fonksiyonların ise olmamasıdır. Hepsi bu - tek fark bu. Her ikisi de değişken parametreler de dahil olmak üzere herhangi bir sayıda parametre kabul edebilir ve her ikisi de değer döndürebilir. Hatta o kadar benzerdirler ki Swift hala bir metot tanımlamak için func anahtar sözcüğünü kullanır.

    Of course, being associated with a specific type such as a struct means that methods gain one important super power: they can refer to the other properties and methods inside that type, meaning that you can write a describe() method for a User type that prints the user’s name, age, and city.
    Elbette, struct gibi belirli bir türle ilişkili olmak, metotların önemli bir süper güç kazanması anlamına gelir: bu türün içindeki diğer özelliklere ve metotlara başvurabilirler, yani bir User türü için kullanıcının adını, yaşını ve şehrini yazdıran bir describe() metodu yazabilirsiniz.

    There is one more advantage to methods, but it’s quite subtle: methods avoid namespace pollution. Whenever we create a function, the name of that function starts to have meaning in our code – we can write wakeUp() and have it do something. So, if you write 100 functions you end up with 100 reserved names, and if you write 1000 functions you have 1000 reserved names.
    Metotların bir avantajı daha vardır, ancak oldukça inceliklidir: metotlar isim alanı kirliliğini önler. Bir fonksiyon oluşturduğumuzda, bu fonksiyonun adı kodumuzda bir anlam ifade etmeye başlar - wakeUp() yazabilir ve bir şeyler yapmasını sağlayabiliriz. Dolayısıyla, 100 fonksiyon yazarsanız 100 ayrılmış adınız olur ve 1000 fonksiyon yazarsanız 1000 ayrılmış adınız olur.

    That can get messy quickly, but by putting functionality into methods we restrict where those names are available – wakeUp() isn’t a reserved name any more unless we specifically write someUser.wakeUp(). This reduces the so-called pollution, because if most of our code is in methods then we won’t get name clashes by accident.
    Bu hızlı bir şekilde karışıklığa neden olabilir, ancak işlevselliği yöntemlere koyarak bu adların nerede kullanılabileceğini kısıtlarız - özellikle someUser.wakeUp() yazmadığımız sürece wakeUp() artık ayrılmış bir ad değildir. Bu, sözde kirliliği azaltır, çünkü kodumuzun çoğu yöntemlerdeyse, kazara isim çakışmaları yaşamayız.
*/
