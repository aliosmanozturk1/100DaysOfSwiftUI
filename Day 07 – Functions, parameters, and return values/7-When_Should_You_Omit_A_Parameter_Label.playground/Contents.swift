import Cocoa

/// # When should you omit a parameter label?
/// # Bir parametre etiketini ne zaman atlamalısınız?

/**
 If we use an underscore for a function parameter’s external label, Swift lets us use no name for that parameter at all. This is very common practice in some parts of Swift development, particularly when building apps that don’t use SwiftUI, but there are many other times when you’ll also want to use this.

 The main reason for skipping a parameter name is when your function name is a verb and the first parameter is a noun the verb is acting on. For example:

 Greeting a person would be greet(taylor) rather than greet(person: taylor)
 Buying a product would be buy(toothbrush) rather than buy(item: toothbrush)
 Finding a customer would be find(customer) rather than find(user: customer)
 This is particularly important when the parameter label is likely to be the same as the name of whatever you’re passing in:

 Singing a song would be sing(song) rather than sing(song: song)
 Enabling an alarm would be enable(alarm) rather than enable(alarm: alarm)
 Reading a book would be read(book) rather than read(book: book)
 Before SwiftUI came along, apps were built using Apple’s UIKit, AppKit, and WatchKit frameworks, which were designed using an older language called Objective-C. In that language, the first parameter to a function was always left unnamed, and so when you use those frameworks in Swift you’ll see lots of functions that have underscores for their first parameter label to preserve interoperability with Objective-C.
 */

/**
 Eğer bir fonksiyon parametresinin harici etiketi için alt çizgi kullanırsak, Swift bu parametre için hiçbir isim kullanmamıza izin vermez. Bu, Swift geliştirmenin bazı bölümlerinde, özellikle SwiftUI kullanmayan uygulamalar oluştururken çok yaygın bir uygulamadır, ancak bunu kullanmak isteyeceğiniz başka birçok zaman da vardır.

 Bir parametre adını atlamanın ana nedeni, fonksiyon adınızın bir fiil olması ve ilk parametrenin fiilin üzerinde hareket ettiği bir isim olmasıdır. Örneğin:

 Bir kişiyi selamlamak greet(person: taylor) yerine greet(taylor) olacaktır.
 Bir ürün satın almak buy(item: toothbrush) yerine buy(toothbrush) şeklinde olacaktır
 Bir müşteriyi bulmak için find(user: customer) yerine find(customer) kullanılır
 Bu, özellikle parametre etiketinin içeri aktardığınız şeyin adıyla aynı olması muhtemel olduğunda önemlidir:

 Bir şarkı söylemek, sing(song: şarkı) yerine sing(şarkı) olacaktır.
 Bir alarmın etkinleştirilmesi enable(alarm: alarm) yerine enable(alarm) şeklinde olacaktır
 Kitap okumak, read(book: kitap) yerine read(book) olacaktır.
 SwiftUI ortaya çıkmadan önce uygulamalar, Objective-C adı verilen eski bir dil kullanılarak tasarlanan Apple'ın UIKit, AppKit ve WatchKit çerçeveleri kullanılarak oluşturuluyordu. Bu dilde, bir fonksiyonun ilk parametresi her zaman isimsiz bırakılırdı ve bu nedenle Swift'te bu çerçeveleri kullandığınızda, Objective-C ile birlikte çalışabilirliği korumak için ilk parametre etiketi için alt çizgi içeren çok sayıda fonksiyon göreceksiniz.
 */
