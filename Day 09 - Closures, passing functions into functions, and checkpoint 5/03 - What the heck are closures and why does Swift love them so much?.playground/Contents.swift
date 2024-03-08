import Cocoa

/// # What the heck are closures and why does Swift love them so much?
/// # Closure da neyin nesi ve Swift neden onları bu kadar çok seviyor?


/**
    Go on, admit it: you asked yourself exactly this question. If you didn’t I’d be surprised, because closures are one of the most powerful features of Swift but also easily the feature that confuses people.

    So, if you’re sitting here thinking “wow, closures are really hard”, don’t be dismayed – they are hard, and you finding them hard just means your brain is operating correctly.

    One of the most common reasons for closures in Swift is to store functionality – to be able to say “here’s some work I want you to do at some point, but not necessarily now.” Some examples:

    - Running some code after a delay.
    - Running some code after an animation has finished.
    - Running some code when a download has finished.
    - Running some code when a user has selected an option from your menu.
 
    Closures let us wrap up some functionality in a single variable, then store that somewhere. We can also return it from a function, and store the closure somewhere else.

    When you’re learning, closures are a little hard to read – particularly when they accept and/or return their own parameters. But that’s OK: take small steps, and backtrack if you get stuck, and you’ll be fine.
*/

/**
    Hadi, itiraf edin: kendinize tam olarak bu soruyu sordunuz. Eğer sormadıysanız şaşırırım, çünkü closure'lar Swift'in en güçlü özelliklerinden biridir ama aynı zamanda kolayca insanların kafasını karıştıran bir özelliktir.

    Yani, eğer burada oturmuş "vay canına, closure'lar gerçekten zor" diye düşünüyorsanız, dehşete kapılmayın - zordurlar ve onları zor bulmanız sadece beyninizin doğru çalıştığı anlamına gelir.

    Swift'teki closure'ların en yaygın nedenlerinden biri işlevselliği saklamaktır - "işte bir noktada yapmanı istediğim bazı işler var, ama şimdi olması gerekmiyor" diyebilmek. Bazı örnekler:

    - Bir gecikmeden sonra bazı kodları çalıştırmak.
    - Bir animasyon bittikten sonra bazı kodların çalıştırılması.
    - Bir indirme işlemi bittiğinde bazı kodların çalıştırılması.
    - Kullanıcı menünüzden bir seçenek seçtiğinde bazı kodların çalıştırılması.
    
    Closure'lar, bazı işlevleri tek bir değişkende toplamamızı ve sonra da bunu bir yerde saklamamızı sağlar. Ayrıca bir fonksiyondan geri döndürebilir ve closure'u başka bir yerde saklayabiliriz.

    Öğrenirken, kapanışları okumak biraz zordur - özellikle de kendi parametrelerini kabul ettiklerinde ve/veya döndürdüklerinde. Ama sorun değil: küçük adımlarla ilerleyin ve takıldığınız yerde geri dönün, iyi olacaksınız.
*/
