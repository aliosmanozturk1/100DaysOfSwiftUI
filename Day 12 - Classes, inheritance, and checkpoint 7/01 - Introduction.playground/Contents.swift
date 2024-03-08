import Cocoa

/// # Introduction
/// # Giriş

/**
    At first, classes seem very similar to structs because we use them to create new data types with properties and methods. However, they introduce a new, important, and complex feature called inheritance – the ability to make one class build on the foundations of another.

    This is a powerful feature, there’s no doubt about it, and there is no way to avoid using classes when you start building real iOS apps. But please remember to keep your code simple: just because a feature exists, it doesn’t mean you need to use it. As Martin Fowler wrote, “any fool can write code that a computer can understand, but good programmers write code that humans can understand.”

    I’ve already said that SwiftUI uses structs extensively for its UI design. Well, it uses classes extensively for its data: when you show data from some object on the screen, or when you pass data between your layouts, you’ll usually be using classes.

    I should add: if you’ve ever worked with UIKit before, this will be a remarkable turnaround for you – in UIKit we normally use classes for UI design and structs for data. So, if you thought perhaps you could skip a day here and there I’m sorry to say that you can’t: this is all required.

    Today you have six tutorials to work through, and you’ll meet classes, inheritance, deinitializers, and more. Once you’ve watched each video and completed any optional extra reading you wanted, there are short tests to help make sure you’ve understood what was taught.
*/

/**
    Sınıflar ilk bakışta yapılara çok benzerler çünkü onları özellikleri ve metotları olan yeni veri tipleri oluşturmak için kullanırız. Ancak, kalıtım adı verilen yeni, önemli ve karmaşık bir özellik sunarlar - bir sınıfı diğerinin temelleri üzerine inşa etme yeteneği.

    Bu güçlü bir özelliktir, buna hiç şüphe yok ve gerçek iOS uygulamaları oluşturmaya başladığınızda sınıfları kullanmaktan kaçınmanın bir yolu yoktur. Ancak lütfen kodunuzu basit tutmayı unutmayın: bir özelliğin var olması, onu kullanmanız gerektiği anlamına gelmez. Martin Fowler'ın yazdığı gibi, "herhangi bir aptal bilgisayarın anlayabileceği bir kod yazabilir, ancak iyi programcılar insanların anlayabileceği kodlar yazarlar."

    SwiftUI'nin kullanıcı arayüzü tasarımı için yapıları yoğun bir şekilde kullandığını söylemiştim. Veriler için de sınıfları yoğun olarak kullanır: ekranda bir nesneden veri gösterdiğinizde ya da düzenleriniz arasında veri aktarımı yaptığınızda genellikle sınıfları kullanırsınız.

    Şunu da eklemeliyim: Daha önce UIKit ile çalıştıysanız, bu sizin için dikkate değer bir geri dönüş olacaktır - UIKit'te normalde UI tasarımı için sınıfları ve veriler için yapıları kullanırız. Yani, eğer bir günü atlayabileceğinizi düşünüyorsanız, üzülerek söylüyorum ki bunu yapamazsınız: bunların hepsi gerekli.

    Bugün üzerinde çalışmanız gereken altı ders var ve sınıflar, kalıtım, deinitializer'lar ve daha fazlasıyla tanışacaksınız. Her videoyu izledikten ve istediğiniz isteğe bağlı ekstra okumaları tamamladıktan sonra, öğretilenleri anladığınızdan emin olmanıza yardımcı olacak kısa testler var.
*/

