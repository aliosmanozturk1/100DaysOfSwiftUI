import Cocoa

/// # When should you use property observers?

/**
    Swift’s property observers let us attach functionality to be run before or after a property is changed, using willSet and didSet respectively. Most of the time property observers aren’t required, just nice to have – we could just update a property normally then call a function ourselves in code. So why bother? When would you actually use property observers?
    Swift'in özellik gözlemcileri, sırasıyla willSet ve didSet kullanarak bir özellik değiştirilmeden önce veya sonra çalıştırılacak işlevleri eklememize izin verir. Çoğu zaman özellik gözlemcileri gerekli değildir, sadece olması güzeldir - bir özelliği normal şekilde güncelleyebilir ve ardından kodda kendimiz bir işlev çağırabiliriz. Öyleyse neden uğraşalım? Özellik gözlemcilerini gerçekten ne zaman kullanırsınız?

    The most important reason is convenience: using a property observer means your functionality will be executed whenever the property changes. Sure, you could use a function to do that, but would you remember? Always? In every place you change the property?
    En önemli neden kolaylıktır: bir özellik gözlemcisi kullanmak, işlevselliğinizin özellik her değiştiğinde yürütüleceği anlamına gelir. Elbette, bunu yapmak için bir fonksiyon kullanabilirsiniz, ancak hatırlar mısınız? Her zaman mı? Özelliği değiştirdiğiniz her yerde?

    This is where the function approach goes sour: it’s on you to remember to call that function whenever the property changes, and if you forget then you’ll have mysterious bugs in your code. On the other hand, if you attach your functionality directly to the property using didSet, it will always happen, and you’re transferring the work of ensuring that to Swift so your brain can focus on more interesting problems.
    Fonksiyon yaklaşımının kötü gittiği yer burasıdır: özellik her değiştiğinde bu fonksiyonu çağırmayı hatırlamak size bağlıdır ve unutursanız kodunuzda gizemli hatalar olacaktır. Öte yandan, didSet kullanarak işlevselliğinizi doğrudan özelliğe bağlarsanız, bu her zaman gerçekleşir ve bunu sağlama işini Swift'e aktarırsınız, böylece beyniniz daha ilginç sorunlara odaklanabilir.

    There is one place where using a property observer is a bad idea, and that’s if you put slow work in there. If you had a User struct with an age integer, you would expect that changing age would take place virtually instantly – it’s just a number, after all. If you attach a didSet property observer that does all sorts of slow work, then suddenly changing a single integer could take way longer than you expected, and it could cause all sorts of problems for you.
    Özellik gözlemcisi kullanmanın kötü bir fikir olduğu tek bir yer vardır, o da oraya yavaş iş koymanızdır. Yaş tamsayısı içeren bir User yapınız varsa, yaş değişikliğinin neredeyse anında gerçekleşmesini beklersiniz - sonuçta bu sadece bir sayıdır. Her türlü yavaş işi yapan bir didSet özellik gözlemcisi eklerseniz, aniden tek bir tamsayıyı değiştirmek beklediğinizden çok daha uzun sürebilir ve bu sizin için her türlü soruna neden olabilir.
*/
