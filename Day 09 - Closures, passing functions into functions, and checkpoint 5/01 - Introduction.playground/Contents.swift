import Cocoa

/// # Introduction
/// # Giriş

/**
    Brace yourself, because today we’re covering the first thing in Swift that many people have a hard time understanding. Please keep in mind Flip Wilson's law: “you can't expect to hit the jackpot if you don't put a few nickels in the machine.”

    Today the topic is closures, which are a bit like anonymous functions – functions we can create and assign directly to a variable, or pass into other functions to customize how they work. Yes, you read that right: passing one function into another as a parameter.

    Closures are really difficult. I’m not saying that to put you off, only so that you know in advance if you’re finding closures hard to understand or hard to remember, it’s okay – we’ve all been there!

    Sometimes the syntax for closures can be a bit hard on your eyes, and this will really be apparent as you work through today’s lessons. If you find it a bit overwhelming – if you’re staring at some code and aren’t 100% sure of what it means – just go back one video and watch it again to give your memory a little nudge. You’ll find there are more tests and optional reading links than usual below, hopefully helping to solidify your knowledge.

    SwiftUI uses closures extensively so it’s worth taking the time to understand what’s going on here. Yes, closures are probably the most complex feature of Swift, but it’s a bit like cycling up a hill – once you’ve reached the top, once you’ve mastered closures, it all gets much easier.

    Today you have three tutorials to follow, plus a summary and another checkpoint. As always once you’ve completed each video there’s some optional extra reading and short tests to help make sure you’ve understood what was taught. This time you’ll notice there’s quite a bit of each of those because closures really can take some time to understand, so don’t be afraid to explore!
*/

/**
    Kendinizi hazırlayın, çünkü bugün Swift'te birçok insanın anlamakta zorlandığı ilk şeyi ele alıyoruz. Lütfen Flip Wilson'ın yasasını aklınızda tutun: "Eğer makineye birkaç kuruş atmazsanız büyük ikramiyeyi kazanmayı bekleyemezsiniz."

    Bugünkü konumuz, anonim fonksiyonlara benzeyen closure'lar - oluşturup doğrudan bir değişkene atayabileceğimiz ya da çalışma şekillerini özelleştirmek için diğer fonksiyonlara aktarabileceğimiz fonksiyonlar. Evet, doğru okudunuz: bir fonksiyonu diğerine parametre olarak aktarmak.

    Closure'lar gerçekten zordur. Bunu sizi vazgeçirmek için söylemiyorum, sadece eğer closure'ları anlamakta ya da hatırlamakta zorlanıyorsanız önceden bilmeniz için söylüyorum, sorun değil - hepimiz o yollardan geçtik!

    Bazen Closure'lar için sözdizimi gözünüze biraz zor gelebilir ve bugünkü derslerde çalışırken bu gerçekten belli olacak. Eğer biraz bunaltıcı buluyorsanız - eğer bir koda bakıyorsanız ve ne anlama geldiğinden %100 emin değilseniz - sadece bir video geri gidin ve hafızanızı biraz dürtmek için tekrar izleyin. Aşağıda her zamankinden daha fazla test ve isteğe bağlı okuma bağlantıları olduğunu göreceksiniz, umarım bilginizi sağlamlaştırmaya yardımcı olur.

    SwiftUI closure'ları yoğun bir şekilde kullanır, bu nedenle burada neler olup bittiğini anlamak için zaman ayırmaya değer. Evet, closure'lar muhtemelen Swift'in en karmaşık özelliğidir, ancak bu biraz tepeye bisikletle çıkmak gibidir - bir kez zirveye ulaştığınızda, closure'larda ustalaştığınızda, her şey çok daha kolay hale gelir.

    Bugün takip etmeniz gereken üç eğitim, bir özet ve bir kontrol noktası daha var. Her zaman olduğu gibi, her videoyu tamamladıktan sonra, öğretilenleri anladığınızdan emin olmanıza yardımcı olmak için isteğe bağlı bazı ekstra okumalar ve kısa testler var. Bu sefer bunların her birinden biraz olduğunu fark edeceksiniz çünkü kapanışları anlamak gerçekten biraz zaman alabilir, bu yüzden keşfetmekten korkmayın!
*/
