import Cocoa

/// # How to provide default values for parameters
/// # Parametreler için varsayılan değerler nasıl sağlanır



func printTimesTables(for number: Int, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}
printTimesTables(for: 5, end: 20)



/// Swift lets us specify default values for any or all of our parameters. In this case, we could set end to have the default value of 12, meaning that if we don’t specify it 12 will be used automatically.
/// Swift, parametrelerimizden herhangi biri veya tümü için varsayılan değerler belirlememize izin verir. Bu durumda, end'i varsayılan değeri 12 olacak şekilde ayarlayabiliriz, yani belirtmezsek 12 otomatik olarak kullanılacaktır.



func printTimesTables2(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables2(for: 5, end: 20)
printTimesTables2(for: 8)

/// Şimdi printTimesTables() işlevini nasıl iki farklı şekilde çağırabildiğimize dikkat edin: istediğimiz zaman zamanlar için her iki parametreyi de sağlayabiliriz, ancak bunu yapmazsak - sadece printTimesTables(for: 8) yazarsak - o zaman varsayılan değer olan 12 end için kullanılacaktır.



/// Aslında daha önce kullandığımız bazı kodlarda varsayılan bir parametreyi çalışırken görmüştük:
var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.removeAll()
print(characters.count)

/// Bu, bir diziye bazı dizeler ekler, sayısını yazdırır, sonra hepsini kaldırır ve sayıyı tekrar yazdırır.

/// Bir performans optimizasyonu olarak Swift, dizilere öğelerini tutmaya yetecek kadar bellek ve zaman içinde biraz büyüyebilmeleri için biraz daha fazla bellek verir. Diziye daha fazla öğe eklenirse, Swift otomatik olarak daha fazla bellek ayırır, böylece mümkün olduğunca az bellek harcanır.

/// When we call removeAll(), Swift will automatically remove all the items in the array, then free up all the memory that was assigned to the array. That’s usually what you’ll want, because after all you’re removing the objects for a reason. But sometimes – just sometimes – you might be about to add lots of new items back into the array, and so there’s a second form of this function that removes the items while also keeping the previous capacity:
/// removeAll() işlevini çağırdığımızda, Swift otomatik olarak dizideki tüm öğeleri kaldıracak ve ardından diziye atanmış olan tüm belleği boşaltacaktır. Bu genellikle istediğiniz şeydir, çünkü sonuçta nesneleri bir nedenden dolayı kaldırıyorsunuz. Ancak bazen - sadece bazen - diziye çok sayıda yeni öğe eklemek üzere olabilirsiniz ve bu nedenle bu işlevin öğeleri kaldırırken önceki kapasiteyi de koruyan ikinci bir biçimi vardır:

characters.removeAll(keepingCapacity: true)

/// This is accomplished using a default parameter value: keepingCapacity is a Boolean with the default value of false so that it does the sensible thing by default, while also leaving open the option of us passing in true for times we want to keep the array’s existing capacity.
/// Bu, varsayılan bir parametre değeri kullanılarak gerçekleştirilir: keepingCapacity, varsayılan değeri false olan bir Boolean'dır, böylece varsayılan olarak mantıklı olanı yapar ve aynı zamanda dizinin mevcut kapasitesini korumak istediğimiz zamanlar için true değerini geçme seçeneğini açık bırakır.

/// As you can see, default parameter values let us keep flexibility in our functions without making them annoying to call most of the time – you only need to send in some parameters when you need something unusual.
/// Gördüğünüz gibi, varsayılan parametre değerleri, fonksiyonlarımızı çoğu zaman çağırmak için can sıkıcı hale getirmeden esnekliği korumamızı sağlar - yalnızca olağandışı bir şeye ihtiyacınız olduğunda bazı parametreler göndermeniz gerekir.







