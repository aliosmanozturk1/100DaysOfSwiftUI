import Cocoa

/// # Which classes should be declared as final?
/// # Hangi sınıflar final olarak bildirilmelidir?


/**
    Final classes are ones that cannot be inherited from, which means it’s not possible for users of your code to add functionality or change what they have. This is not the default: you must opt in to this behavior by adding the final keyword to your class.
    Final sınıflar miras alınamayan sınıflardır, yani kodunuzu kullananların işlevsellik eklemesi veya sahip olduklarını değiştirmesi mümkün değildir. Bu varsayılan değildir: sınıfınıza final anahtar sözcüğünü ekleyerek bu davranışı seçmeniz gerekir.

    Remember, anyone who subclasses your class can override your properties and perhaps also your methods, which offers them incredible power. If you do something they don’t like, bam – they can just replace that. They might still call your original method as well as their replacement, but they might not.
    Unutmayın, sınıfınızın alt sınıflarını oluşturan herkes özelliklerinizi ve belki de yöntemlerinizi geçersiz kılabilir, bu da onlara inanılmaz bir güç sunar. Eğer hoşlarına gitmeyen bir şey yaparsanız, bam - bunu değiştirebilirler. Değiştirdikleri metodun yanı sıra orijinal metodunuzu da çağırabilirler, ancak çağırmayabilirler de.

    This can be problematic: perhaps your class does something really important that mustn’t be replaced, or perhaps you have clients on a support contract and you don’t want them breaking the way your code works.
    Bu sorunlu olabilir: belki de sınıfınız değiştirilmemesi gereken gerçekten önemli bir şey yapıyor veya belki de bir destek sözleşmesi kapsamında müşterileriniz var ve kodunuzun çalışma şeklini bozmalarını istemiyorsunuz.

    Much of Apple’s own code was written before Swift came along, in an earlier language called Objective-C. Objective-C didn’t have great support for final classes, so Apple usually resorted to large warnings on their site. For example, there’s a very important class called AVPlayerViewController that is designed to play movies, and its documentation page has a large yellow warning saying: “Subclassing AVPlayerViewController and overriddng its methods isn’t supported, and results in undefined behavior.” We don’t know why, only that we shouldn’t do it. There’s another class called Timer that handles timed events like an alarm, and there the warning is even simpler: “Do not subclass Timer”.
    Apple'ın kendi kodlarının çoğu Swift ortaya çıkmadan önce Objective-C adı verilen daha eski bir dilde yazılmıştı. Objective-C'nin son sınıflar için büyük bir desteği yoktu, bu nedenle Apple genellikle sitelerinde büyük uyarılara başvuruyordu. Örneğin, AVPlayerViewController adında film oynatmak için tasarlanmış çok önemli bir sınıf var ve dokümantasyon sayfasında büyük sarı bir uyarı var: "AVPlayerViewController'ı alt sınıflara ayırmak ve yöntemlerini aşmak desteklenmez ve tanımlanmamış davranışlara neden olur." Nedenini bilmiyoruz, sadece bunu yapmamamız gerektiğini biliyoruz. Alarm gibi zamanlanmış olayları işleyen Timer adında başka bir sınıf daha var ve orada uyarı daha da basit: "Timer'ı alt sınıf yapmayın".

    In Swift it used to be the case that final classes were more performant than non-final classes, because we were providing a little bit more information about how our code would run and Swift would use that to make some optimizations.
    Swift'te eskiden final sınıflar final olmayan sınıflardan daha performanslıydı, çünkü kodumuzun nasıl çalışacağı hakkında biraz daha fazla bilgi veriyorduk ve Swift bunu bazı optimizasyonlar yapmak için kullanıyordu.

    That hasn’t been true for a while, but even today I think many people instinctively declare their classes as final to mean “you shouldn’t subclass from this unless I specifically allow it.” I certainly do this a lot, because it’s another way I can help folks understand how my code works.
    Bu bir süredir doğru değil, ancak bugün bile birçok insanın içgüdüsel olarak sınıflarını "ben özellikle izin vermedikçe bundan alt sınıf oluşturmamalısınız" anlamına gelecek şekilde final olarak bildirdiğini düşünüyorum. Bunu kesinlikle çok yapıyorum, çünkü insanların kodumun nasıl çalıştığını anlamalarına yardımcı olabilmemin bir başka yolu da bu.
*/
