import Cocoa

/// # Why don’t Swift classes have a memberwise initializer?
/// # Swift sınıfları neden üye bazında başlatıcıya sahip değil?

/**
 One of the many useful features of Swift’s struct is that they come with a synthesized memberwise initializer, letting us create new instances of the struct just by specifying its properties. However, Swift’s classes don’t have this feature, which is annoying – but why don’t they have it?
 Swift'in struct'larının birçok kullanışlı özelliğinden biri, sadece özelliklerini belirterek struct'ın yeni örneklerini oluşturmamıza izin veren sentezlenmiş bir üyeli başlatıcı ile birlikte gelmeleridir. Ancak, Swift'in sınıfları bu özelliğe sahip değildir, bu da can sıkıcıdır - ama neden sahip değiller?

 The main reason is that classes have inheritance, which would make memberwise initializers difficult to work with. Think about it: if I built a class that you inherited from, then added some properties to my class later on, your code would break – all those places you relied on my memberwise initializer would suddenly no longer work.
 Bunun ana nedeni, sınıfların kalıtıma sahip olmasıdır, bu da üyeli başlatıcıların çalışmasını zorlaştırır. Bir düşünün: miras aldığınız bir sınıf oluşturup daha sonra sınıfıma bazı özellikler ekleseydim, kodunuz bozulurdu - üyeli başlatıcıma güvendiğiniz tüm o yerler aniden artık çalışmazdı.

 So, Swift has a simple solution: rather than automatically generating a memberwise initializer, authors of classes must write their own initializer by hand. This way, you can add properties as much as you want without affecting the initializer for your class, and affecting others who inherit from your class. And when you do decide to change your initializer, you’re doing so yourself, and are therefore fully aware of the implications for any inheriting classes.
 Swift'in basit bir çözümü var: otomatik olarak üye bazında bir ilklendirici oluşturmak yerine, sınıfların yazarları kendi ilklendiricilerini elle yazmalıdır. Bu şekilde, sınıfınızın başlatıcısını etkilemeden ve sınıfınızdan miras alan diğerlerini etkilemeden istediğiniz kadar özellik ekleyebilirsiniz. Ve başlatıcınızı değiştirmeye karar verdiğinizde, bunu kendiniz yaparsınız ve bu nedenle miras alan sınıflar üzerindeki etkilerinin tamamen farkındasınızdır.
*/

