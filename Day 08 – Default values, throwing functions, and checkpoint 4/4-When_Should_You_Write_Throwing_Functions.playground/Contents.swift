import Cocoa

/// # When should you write throwing functions?
/// # Ne zaman fırlatma (throw) fonksiyonları yazmalısınız?

/**
    Throwing functions in Swift are those that are able to encounter errors they are unable or unwilling to handle. That doesn’t mean they will throw errors, just that it’s possible they can. As a result, Swift will make sure we’re careful when we use them, so that any errors that do occur are catered for.
    Swift'te hata atan fonksiyonlar, üstesinden gelemeyecekleri veya üstesinden gelmek istemeyecekleri hatalarla karşılaşabilen fonksiyonlardır. Bu, hata fırlatacakları anlamına gelmez, sadece hata fırlatmaları mümkündür. Sonuç olarak, Swift bunları kullanırken dikkatli olmamızı sağlar, böylece meydana gelen hatalar karşılanır.

    But when you’re writing your code, chances are you’ll think to yourself “should this function throw any errors it encounters, or should it maybe handle them itself?” This is really common, and to be honest there is no single answer – you can handle the errors inside the function (thus making it not a throwing function), you can send them all back to whatever called the function (called “error propagation” or sometimes “bubbling up errors”), and you can even handle some errors in the function and send some back. All of those are valid solutions, and you will use all of them at some point.
    Ancak kodunuzu yazarken, büyük olasılıkla kendi kendinize "bu fonksiyon karşılaştığı hataları fırlatmalı mı, yoksa kendisi mi halletmeli?" diye düşünürsünüz. Bu gerçekten yaygındır ve dürüst olmak gerekirse tek bir cevap yoktur - hataları fonksiyonun içinde halledebilirsiniz (böylece fırlatan bir fonksiyon olmaz), hepsini fonksiyonu çağıran şeye geri gönderebilirsiniz ("hata yayılımı" veya bazen "hataları kabarcıklandırma" olarak adlandırılır) ve hatta bazı hataları fonksiyonun içinde halledip bazılarını geri gönderebilirsiniz. Bunların hepsi geçerli çözümlerdir ve bir noktada hepsini kullanacaksınız.

    When you’re just getting started, I would recommend you avoid throwing functions most of the time. They can feel a bit clumsy at first because you need to make sure all the errors are handled wherever you use the function, so it feels almost a bit “infectious” – suddenly you have errors needing to be handled in several places in your code, and if those errors bubble up further then the “infection” just spreads.
    Yeni başladığınızda, çoğu zaman fonksiyon atmaktan kaçınmanızı tavsiye ederim. İlk başta biraz beceriksiz hissettirebilirler çünkü fonksiyonu kullandığınız her yerde tüm hataların ele alındığından emin olmanız gerekir, bu yüzden neredeyse biraz "bulaşıcı" hissettirir - aniden kodunuzda birkaç yerde ele alınması gereken hatalarınız olur ve bu hatalar daha da artarsa "enfeksiyon" yayılır.

    So, when you’re learning start small: keep the number of throwing functions low, and work outwards from there. Over time you’ll get a get better grip on managing errors to keep your program flow smooth, and you’ll feel more confident about adding throwing functions.
    Bu nedenle, öğrenirken küçükten başlayın: fırlatma fonksiyonlarının sayısını düşük tutun ve oradan dışarı doğru çalışın. Zamanla program akışınızı sorunsuz tutmak için hataları yönetmeyi daha iyi kavrayacak ve atma işlevleri ekleme konusunda kendinize daha fazla güveneceksiniz.
 
    For a different perspective on throwing functions, see this blog post from Donny Wals: https://www.donnywals.com/working-with-throwing-functions-in-swift/
 */
