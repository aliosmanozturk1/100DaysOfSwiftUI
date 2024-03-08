import Cocoa

/// # When should you use willSet rather than didSet?
/// # Ne zaman didSet yerine willSet kullanmalısınız?

/**
    Both willSet and didSet let us attach observers to properties, meaning that Swift will run some code when they change so that we have a chance to respond to the change. The question is: do you want to know before the property changes, or after?
    Hem willSet hem de didSet, özelliklere gözlemci eklememize izin verir, yani Swift değiştiklerinde bazı kodlar çalıştırır, böylece değişikliğe yanıt verme şansımız olur. Soru şu: Özellik değişmeden önce mi bilmek istiyorsunuz, yoksa değiştikten sonra mı?

    The simple answer is this: most of the time you will be using didSet, because we want to take action after the change has happened so we can update our user interface, save changes, or whatever. That doesn’t mean willSet isn’t useful, it’s just that in practice it is significantly less popular than its counterpart.
    Basit cevap şudur: Çoğu zaman didSet kullanacaksınız, çünkü değişiklik gerçekleştikten sonra harekete geçmek istiyoruz, böylece kullanıcı arayüzümüzü güncelleyebilir, değişiklikleri kaydedebilir veya başka bir şey yapabiliriz. Bu willSet'in kullanışlı olmadığı anlamına gelmez, sadece pratikte muadiline göre önemli ölçüde daha az popülerdir.

    The most common time willSet is used is when you need to know the state of your program before a change is made. For example, SwiftUI uses willSet in some places to handle animations so that it can take a snapshot of the user interface before a change. When it has both the “before” and “after” snapshot, it can compare the two to see all the parts of the user interface that need to be updated.
    willSet'in en yaygın kullanıldığı zaman, bir değişiklik yapılmadan önce programınızın durumunu bilmeniz gereken zamandır. Örneğin, SwiftUI animasyonları işlemek için bazı yerlerde willSet kullanır, böylece bir değişiklikten önce kullanıcı arayüzünün anlık görüntüsünü alabilir. Hem "önce" hem de "sonra" anlık görüntüsüne sahip olduğunda, kullanıcı arayüzünün güncellenmesi gereken tüm bölümlerini görmek için ikisini karşılaştırabilir.
*/

