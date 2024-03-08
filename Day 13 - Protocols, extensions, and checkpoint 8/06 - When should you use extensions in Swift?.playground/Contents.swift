import Cocoa

/// # When should you use extensions in Swift?

// TAM ANLAMADIM

/**
    Extensions let us add functionality to classes, structs, and more, which is helpful for modifying types we don’t own – types that were written by Apple or someone else, for example. Methods added using extensions are indistinguishable from methods that were originally part of the type, but there is a difference for properties: extensions may not add new stored properties, only computed properties.
    Uzantılar sınıflara, yapılara ve daha fazlasına işlevsellik eklememize izin verir, bu da bize ait olmayan türleri (örneğin Apple veya başka biri tarafından yazılmış türleri) değiştirmek için yararlıdır. Uzantılar kullanılarak eklenen yöntemler, türün orijinal parçası olan yöntemlerden ayırt edilemez, ancak özellikler için bir fark vardır: uzantılar yeni depolanan özellikler ekleyemez, yalnızca hesaplanan özellikler ekleyebilir.

    Extensions are also useful for organizing our own code, and although there are several ways of doing this I want to focus on two here: conformance grouping and purpose grouping.
    Uzantılar kendi kodumuzu düzenlemek için de yararlıdır ve bunu yapmanın çeşitli yolları olmasına rağmen burada iki tanesine odaklanmak istiyorum: uygunluk gruplaması ve amaç gruplaması.

    Conformance grouping means adding a protocol conformance to a type as an extension, adding all the required methods inside that extension. This makes it easier to understand how much code a developer needs to keep in their head while reading an extension – if the current extension adds support for Printable, they won’t find printing methods mixed in with methods from other, unrelated protocols.
    Uygunluk gruplaması, bir protokol uygunluğunun bir türe uzantı olarak eklenmesi ve gerekli tüm yöntemlerin bu uzantının içine eklenmesi anlamına gelir. Bu, bir geliştiricinin bir uzantıyı okurken kafasında ne kadar kod tutması gerektiğini anlamasını kolaylaştırır - mevcut uzantı Yazdırılabilir için destek eklerse, yazdırma yöntemlerini diğer, ilgisiz protokollerden yöntemlerle karıştırmazlar.

    On the other hand, purpose grouping means creating extensions to do specific tasks, which makes it easier to work with large types. For example, you might have an extension specifically to handle loading and saving of that type.
    Öte yandan, amaç gruplaması, belirli görevleri yerine getirmek için uzantılar oluşturmak anlamına gelir ve bu da büyük türlerle çalışmayı kolaylaştırır. Örneğin, özellikle bu türün yüklenmesi ve kaydedilmesini işlemek için bir uzantınız olabilir.

    It’s worth adding here that many folks realize they have a large class and try to make it smaller by splitting it into extensions. To be quite clear: the type is exactly the same size it was before, it’s just neatly split up. This does mean it’s likely to be a little easier to understand, but it doesn’t mean the class is any smaller.
    Burada birçok kişinin büyük bir sınıfa sahip olduğunu fark ettiğini ve onu uzantılara bölerek küçültmeye çalıştığını eklemek gerekir. Oldukça açık olmak gerekirse: tip tam olarak daha önce olduğu boyuttadır, sadece düzgün bir şekilde bölünmüştür. Bu, anlaşılmasının biraz daha kolay olacağı anlamına gelir, ancak sınıfın daha küçük olduğu anlamına gelmez.
*/
