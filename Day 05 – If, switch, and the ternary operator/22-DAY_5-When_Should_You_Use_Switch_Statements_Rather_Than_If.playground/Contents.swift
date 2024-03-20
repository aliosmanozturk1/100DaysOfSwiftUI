import Cocoa

/// # When should you use switch statements rather than if?
/// # If yerine switch kullanmayı düşünmeniz için üç neden vardır:

/**
 If yerine switch kullanmayı düşünmeniz için üç neden vardır:
 - Swift, switch deyimlerinin kapsamlı olmasını gerektirir, bu da kontrol edilecek her olası değer için bir case bloğuna sahip olmanız gerektiği anlamına gelir (örneğin, bir enum'un tüm durumları) veya varsayılan bir case'e sahip olmanız gerekir. Bu durum if ve else if için geçerli değildir, bu nedenle yanlışlıkla bir durumu gözden kaçırabilirsiniz.
 
 - Bir değeri birden fazla olası sonuç için kontrol etmek için switch kullandığınızda, bu değer yalnızca bir kez okunurken, if kullanırsanız birden çok kez okunacaktır. Fonksiyon çağrılarını kullanmaya başladığınızda bu daha önemli hale gelir, çünkü bunlardan bazıları yavaş olabilir.

 - Swift’s switch cases allow for advanced pattern matching that is unwieldy with if.
 - Swift'in switch case'leri, if ile kullanışsız olan gelişmiş desen eşleştirmesine izin verir.

 Genel olarak konuşmak gerekirse, aynı değeri üç veya daha fazla olası durum için kontrol etmek istiyorsanız, insanların if yerine switch kullanmayı tercih ettiğini göreceksiniz - farklı koşullar yazmak yerine aynı değeri tekrar tekrar kontrol ettiğimiz daha açık hale gelir.


 */
