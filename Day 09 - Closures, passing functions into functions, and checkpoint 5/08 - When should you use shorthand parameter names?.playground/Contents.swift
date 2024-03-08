import Cocoa

/// # When should you use shorthand parameter names?
/// # Kısaltılmış parametre adlarını ne zaman kullanmalısınız?

/**
    When working with closures, Swift gives us a special shorthand parameter syntax that makes it extremely concise to write closures. This syntax automatically numbers parameter names as $0, $1, $2, and so on – we can’t use names such as these in our own code, so when you see them it’s immediately clear these are shorthand syntax for closures.
    Swift, closure'larla çalışırken bize closure'ları yazmayı son derece kısa ve öz hale getiren özel bir shorthand parametre sözdizimi sunar. Bu sözdizimi parametre adlarını otomatik olarak $0, $1, $2 ve benzeri şekilde numaralandırır - kendi kodumuzda bu gibi adları kullanamayız, bu nedenle bunları gördüğünüzde bunların closure'lar için shorthand sözdizimi olduğu hemen anlaşılır.

    As for when you should use them it’s really a big “it depends”:
    Bunları ne zaman kullanmanız gerektiğine gelince, bu gerçekten büyük bir "değişir":

    - Are there many parameters? If so, shorthand syntax stops being useful and in fact starts being counterproductive – was it $3 or $4 that you need to compare against $0 Give them actual names and their meaning becomes clearer.
    - Çok sayıda parametre var mı? Eğer öyleyse, kısaltılmış sözdizimi kullanışlı olmaktan çıkar ve aslında ters etki yaratmaya başlar - $0 ile karşılaştırmanız gereken $3 mıydı yoksa $4 mıydı Onlara gerçek isimler verin ve anlamları daha net hale gelsin.

    - Is the function commonly used? As your Swift skills progress, you’ll start to realize that there are a handful – maybe 10 or so – extremely common functions that use closures, so others reading your code will easily understand what $0 means.
    - Fonksiyon yaygın olarak kullanılıyor mu? Swift becerileriniz ilerledikçe, closure'ları kullanan bir avuç - belki 10 kadar - son derece yaygın fonksiyon olduğunu fark etmeye başlayacaksınız, böylece kodunuzu okuyan diğerleri $0'ın ne anlama geldiğini kolayca anlayacaktır.

    - Are the shorthand names used several times in your method? If you need to refer to $0 more than maybe two or three times, you should probably just give it a real name.
    - Kısaltılmış isimler yönteminizde birkaç kez mi kullanılıyor? Eğer 0$'a iki veya üç kereden fazla atıfta bulunmanız gerekiyorsa, muhtemelen ona gerçek bir isim vermelisiniz.

    What matters is that your code is easy to read and easy to understand. Sometimes that means making it short and simple, but not always – choose shorthand syntax on a case by case basis.
    Önemli olan kodunuzun kolay okunabilir ve kolay anlaşılabilir olmasıdır. Bazen bu, kısa ve basit hale getirmek anlamına gelir, ancak her zaman değil - duruma göre kısa sözdizimini seçin.
*/

