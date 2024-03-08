import Cocoa

/// # Why would you want to use closures as parameters?
/// # Neden parametre olarak closure kullanmak isteyesiniz?

/**
    Swift’s closures can be used just like any other type of data, which means you can pass them into functions, take copies of them, and so on. But when you’re just learning, this can feel very much like “just because you can, doesn’t mean you should” – it’s hard to see the benefit.

    One of the best examples I can give is the way Siri integrates with apps. Siri is a system service that runs from anywhere on your iOS device, but it’s able to communicate with apps – you can book a ride with Lyft, you can check the weather with Carrot Weather, and so on. Behind the scenes, Siri launches a small part of the app in the background to pass on our voice request, then shows the app’s response as part of the Siri user interface.

    Now think about this: what if my app behaves badly, and takes 10 seconds to respond to Siri? Remember, the user doesn’t actually see my app, just Siri, so from their perspective it looks like Siri has completely frozen.

    This would be a terrible user experience, so Apple uses closures instead: it launches our app in the background and passes in a closure that we can call when we’re done. Our app then can take as long as it wants to figure out what work needs to be done, and when we’re finished we call the closure to send back data to Siri. Using a closure to send back data rather than returning a value from the function means Siri doesn’t need to wait for the function to complete, so it can keep its user interface interactive – it won’t freeze up.

    Another common example is making network requests. Your average iPhone can do several billion things a second, but connecting to a server in Japan takes half a second or more – it’s almost glacial compared to the speed things happen on your device. So, when we request data from the internet we do so with closures: “please fetch this data, and when you’re done run this closure.” Again, it means we don’t force our user interface to freeze while some slow work is happening.
*/

/**
    Swift'in closure'ları tıpkı diğer veri türleri gibi kullanılabilir; bu da onları fonksiyonlara aktarabileceğiniz, kopyalarını alabileceğiniz vb. anlamına gelir. Ancak yeni öğrenmeye başladığınızda, bu size "yapabiliyor olmanız, yapmanız gerektiği anlamına gelmez" gibi gelebilir - faydasını görmek zordur.

    Verebileceğim en iyi örneklerden biri Siri'nin uygulamalarla entegrasyon şeklidir. Siri, iOS cihazınızın herhangi bir yerinden çalışan bir sistem hizmetidir, ancak uygulamalarla iletişim kurabilir - Lyft ile bir araç rezervasyonu yapabilir, Carrot Weather ile hava durumunu kontrol edebilirsiniz vb. Perde arkasında Siri, sesli isteğimizi iletmek için arka planda uygulamanın küçük bir bölümünü başlatır, ardından uygulamanın yanıtını Siri kullanıcı arayüzünün bir parçası olarak gösterir.

    Şimdi şunu düşünün: Ya uygulamam kötü davranırsa ve Siri'ye yanıt vermesi 10 saniye sürerse? Unutmayın, kullanıcı aslında benim uygulamamı görmüyor, sadece Siri'yi görüyor, bu yüzden onların bakış açısından Siri tamamen donmuş gibi görünüyor.

    Bu korkunç bir kullanıcı deneyimi olurdu, bu yüzden Apple bunun yerine kapanışları kullanıyor: uygulamamızı arka planda başlatıyor ve işimiz bittiğinde çağırabileceğimiz bir kapanışı iletiyor. Uygulamamız daha sonra hangi işin yapılması gerektiğini bulmak için istediği kadar sürebilir ve işimiz bittiğinde Siri'ye verileri geri göndermek için closure'ı çağırırız. Fonksiyondan bir değer döndürmek yerine verileri geri göndermek için bir closure kullanmak, Siri'nin fonksiyonun tamamlanmasını beklemesine gerek olmadığı anlamına gelir, böylece kullanıcı arayüzünü etkileşimli tutabilir - donmaz.

    Bir başka yaygın örnek de ağ istekleri yapmaktır. Ortalama bir iPhone'unuz saniyede birkaç milyar şey yapabilir, ancak Japonya'daki bir sunucuya bağlanmak yarım saniye veya daha fazla sürer - bu, cihazınızda gerçekleşen şeylerin hızıyla karşılaştırıldığında neredeyse buzul gibidir. Dolayısıyla, internetten veri talep ettiğimizde bunu closure'larla yapıyoruz: "lütfen bu veriyi getirin ve işiniz bittiğinde bu closure'u çalıştırın." Yine bu, bazı yavaş işler gerçekleşirken kullanıcı arayüzümüzü donmaya zorlamadığımız anlamına geliyor.
*/
