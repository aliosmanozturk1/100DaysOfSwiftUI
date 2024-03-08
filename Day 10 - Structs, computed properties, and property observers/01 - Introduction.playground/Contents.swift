import Cocoa

/// # Introduction
/// # Giriş

/**
    I know some of you might be keen to charge on with today’s new Swift learning, but hold up: you just finished learning about closures, which are a difficult topic. And you came back for more. Seriously, that deserves a lot of respect.

    And I have some good news for you. First, not only can you avoid thinking about closures for the next few days, but once you’ve had a break we’ll start putting them into practice in real iOS projects. So, even if you aren’t 100% sure of how they work or why they are needed, it will all become clear – stick with it!

    Anyway, today’s topic is structs. Structs are one of the ways Swift lets us create our own data types out of several small types. For example, you might put three strings and a Boolean together and say that represents a user in your app. In fact, most of Swift’s own types are implemented as structs, including String, Int, Bool, Array, and more.

    These custom types – users, games, documents, and more – form the real core of the software we build. If you get those right then often your code will follow.

    As Fred Brooks, the author of the hugely influential book The Mythical Man-Month, once said, “the programmer at wit’s end... can often do best by disentangling themself from their code, rearing back, and contemplating their data. Representation is the essence of programming.”

    What’s more, structs are extremely common in SwiftUI, because every piece of UI we design is built on a struct, with lots of structs inside. They aren’t difficult to learn, but to be fair after closures almost everything seems easier!

    Today you have four tutorials to follow, where you’ll meet custom structs, computed properties, property observers, and more. Once you’ve watched each video and optionally gone through the extra reading, there are short tests to help make sure you’ve understood what was taught.
*/

/**
    Bazılarınızın bugünün yeni Swift öğrenimine devam etmek için istekli olabileceğini biliyorum, ancak bekleyin: zor bir konu olan closure'ları öğrenmeyi daha yeni bitirdiniz. Ve daha fazlası için geri geldiniz. Cidden, bu büyük bir saygıyı hak ediyor.

    Ve size bazı iyi haberlerim var. Öncelikle, önümüzdeki birkaç gün boyunca yalnızca closure'lar hakkında düşünmekten kaçınmakla kalmayacak, aynı zamanda bir mola verdikten sonra onları gerçek iOS projelerinde uygulamaya başlayacağız. Yani, nasıl çalıştıklarından veya neden gerekli olduklarından %100 emin olmasanız bile, her şey netleşecek - buna bağlı kalın!

    Her neyse, bugünün konusu struct'lar. Yapılar, Swift'in birkaç küçük tipten kendi veri tiplerimizi oluşturmamıza izin verdiği yollardan biridir. Örneğin, üç string ve bir Boolean'ı bir araya getirebilir ve bunun uygulamanızdaki bir kullanıcıyı temsil ettiğini söyleyebilirsiniz. Aslında, Swift'in kendi türlerinin çoğu String, Int, Bool, Array ve daha fazlası dahil olmak üzere struct olarak uygulanır.

    Bu özel tipler - kullanıcılar, oyunlar, belgeler ve daha fazlası - oluşturduğumuz yazılımın gerçek çekirdeğini oluşturur. Eğer bunları doğru yaparsanız, kodunuz da bunu takip edecektir.

    Oldukça etkili bir kitap olan The Mythical Man-Month'un yazarı Fred Brooks'un bir keresinde söylediği gibi, "Aklını kaçıran programcı... genellikle kendini kodundan ayırarak, arkasına yaslanarak ve verilerini düşünerek en iyisini yapabilir. Temsil, programlamanın özüdür."

    Dahası, yapılar SwiftUI'de son derece yaygındır, çünkü tasarladığımız her kullanıcı arayüzü parçası, içinde çok sayıda yapı bulunan bir yapı üzerine inşa edilmiştir. Öğrenmesi zor değiller, ama dürüst olmak gerekirse closure'lardan sonra neredeyse her şey daha kolay görünüyor!

    Bugün özel yapılar, hesaplanmış özellikler, özellik gözlemcileri ve daha fazlasıyla tanışacağınız dört eğitim videosu izleyeceksiniz. Her videoyu izledikten ve isteğe bağlı olarak ekstra okumaları yaptıktan sonra, öğretilenleri anladığınızdan emin olmanıza yardımcı olacak kısa testler var.
*/
