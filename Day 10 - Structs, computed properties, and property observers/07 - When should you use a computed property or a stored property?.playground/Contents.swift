import Cocoa

/// # When should you use a computed property or a stored property?

/**
 Properties let us attach information to structs, and Swift gives us two variations: stored properties, where a value is stashed away in some memory to be used later, and computed properties, where a value is recomputed every time it’s called. Behind the scenes, a computed property is effectively just a function call that happens to belong to your struct.
 Properties'ler struct'lara bilgi eklememizi sağlar ve Swift bize iki çeşit özellik sunar: bir değerin daha sonra kullanılmak üzere bellekte saklandığı stored properties ve bir değerin her çağrıldığında yeniden hesaplandığı computed properties. Perde arkasında, hesaplanan bir özellik etkili bir şekilde sadece yapınıza ait olan bir fonksiyon çağrısıdır.

 Deciding which to use depends partly on whether your property’s value depends on other data, and partly also on performance. The performance part is easy: if you regularly read the property when its value hasn’t changed, then using a stored property will be much faster than using a computed property. On the other hand, if your property is read very rarely and perhaps not at all, then using a computed property saves you from having to calculate its value and store it somewhere.
 Hangisinin kullanılacağına karar vermek kısmen özelliğinizin değerinin diğer verilere bağlı olup olmadığına ve kısmen de performansa bağlıdır. Performans kısmı kolaydır: değeri değişmediğinde özelliği düzenli olarak okuyorsanız, depolanan bir özellik kullanmak hesaplanan bir özellik kullanmaktan çok daha hızlı olacaktır. Öte yandan, özelliğiniz çok nadiren okunuyorsa ve belki de hiç okunmuyorsa, hesaplanmış bir özellik kullanmak sizi değerini hesaplamak ve bir yerde saklamak zorunda kalmaktan kurtarır.

 When it comes to dependencies – whether your property’s value relies on the values of your other properties – then the tables are turned: this is a place where computed properties are useful, because you can be sure the value they return always takes into account the latest program state.
 Bağımlılıklar söz konusu olduğunda - özelliğinizin değerinin diğer özelliklerinizin değerlerine bağlı olup olmadığı - o zaman tablolar değişir: bu, hesaplanan özelliklerin yararlı olduğu bir yerdir, çünkü döndürdükleri değerin her zaman en son program durumunu dikkate aldığından emin olabilirsiniz.

 Lazy properties help mitigate the performance issues of rarely read stored properties, and property observers mitigate the dependency problems of stored properties – we’ll be looking at them soon.
 Tembel özellikler, nadiren okunan depolanmış özelliklerin performans sorunlarını azaltmaya yardımcı olur ve özellik gözlemcileri depolanmış özelliklerin bağımlılık sorunlarını azaltır - yakında bunlara bakacağız.
*/

