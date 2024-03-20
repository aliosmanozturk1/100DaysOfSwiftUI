import Cocoa

/// # How to check multiple conditions
/// # Birden fazla koşul nasıl kontrol edilir


let isOwner = true
let isAdmin = true
let isEditingEnabled = true

/// Kullanıcıların mesaj gönderebildiği ve sahip oldukları mesajları silebildiği bir forum işlettiğimizi hayal edin. Bunun gibi bir kod yazabiliriz:
if isOwner == true || isAdmin == true {
    print("You can delete this post")
}

/// İşlerin daha da karıştığı yer, birkaç şeyi kontrol etmek istediğimiz zamandır. Örneğin, normal kullanıcıların yalnızca bizim izin verdiğimiz mesajları silebileceğini, ancak yöneticilerin her zaman mesajları silebileceğini söyleyebiliriz. Bunun gibi bir kod yazabiliriz:
if isOwner == true && isEditingEnabled || isAdmin == true {
    print("You can delete this post")
}

/// Ama bu neyi kontrol etmeye çalışıyor? && ve || kontrolleri hangi sırayla yürütülür? Bu şu anlama gelebilir:
if (isOwner == true && isEditingEnabled) || isAdmin == true {
    print("You can delete this post")
}
/// Bu, "eğer biz sahibiysek ve düzenleme etkinse gönderiyi silebilirsiniz veya eğer bir yöneticiyseniz, sahibi olmasanız bile gönderiyi silebilirsiniz" diyor. Bu mantıklı: düzenlemeye izin verilirse insanlar kendi gönderilerini silebilir, ancak yöneticiler gönderileri her zaman silebilir.



