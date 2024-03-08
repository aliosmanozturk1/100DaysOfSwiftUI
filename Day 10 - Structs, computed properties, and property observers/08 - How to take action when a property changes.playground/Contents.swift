import Cocoa

/// # How to take action when a property changes
/// # Bir property değiştiğinde nasıl harekete geçilir?

/**
    Swift lets us create property observers, which are special pieces of code that run when properties change. These take two forms: a didSet observer to run when the property just changed, and a willSet observer to run before the property changed.
    Swift, özellikler değiştiğinde çalışan özel kod parçaları olan özellik gözlemcileri oluşturmamıza izin verir. Bunlar iki şekilde olabilir: özellik değiştiğinde çalışan didSet gözlemcisi ve özellik değişmeden önce çalışan willSet gözlemcisi.

    To see why property observers might be needed, think about code like this:
    Özellik gözlemcilerine neden ihtiyaç duyulabileceğini görmek için aşağıdaki gibi bir kod düşünün:
*/

struct Game {
    var score = 0
}

var game = Game()
game.score += 10
print("Score is now \(game.score)")
game.score -= 3
print("Score is now \(game.score)")
game.score += 1

/**
    That creates a Game struct, and modifies its score a few times. Each time the score changes, a print() line follows it so we can keep track of the changes. Except there’s a bug: at the end the score changed without being printed, which is a mistake.
    Bu, bir Game struct'u oluşturur ve puanını birkaç kez değiştirir. Skor her değiştiğinde, bir print() satırı onu takip eder, böylece değişiklikleri takip edebiliriz. Ancak bir hata var: sonunda skor yazdırılmadan değişiyor, bu bir hata.

    With property observers we can solve this problem by attaching the print() call directly to the property using didSet, so that whenever it changes – wherever it changes – we will always run some code.
    Özellik gözlemcileri ile bu sorunu print() çağrısını didSet kullanarak doğrudan özelliğe ekleyerek çözebiliriz, böylece her değiştiğinde - nerede değişirse değişsin - her zaman bazı kodlar çalıştırırız.

    Here’s that same example, now with a property observer in place:
    İşte aynı örnek, şimdi bir özellik gözlemcisi ile birlikte:
*/

struct Game2 {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game2 = Game2()
game2.score += 10
game2.score -= 3
game2.score += 1

/**
    If you want it, Swift automatically provides the constant oldValue inside didSet, in case you need to have custom functionality based on what you were changing from. There’s also a willSet variant that runs some code before the property changes, which in turn provides the new value that will be assigned in case you want to take different action based on that.
    Eğer isterseniz, Swift otomatik olarak didSet içinde oldValue sabitini sağlar, böylece neyi değiştirdiğinize bağlı olarak özel işlevselliğe sahip olmanız gerekir. Ayrıca, özellik değişmeden önce bazı kodları çalıştıran bir willSet varyantı da vardır ve bu da buna dayalı olarak farklı bir işlem yapmak istemeniz durumunda atanacak yeni değeri sağlar.

    We can demonstrate all this functionality in action using one code sample, which will print messages as the values change so you can see the flow when the code is run:
    Tüm bu işlevselliği, kod çalıştırıldığında akışı görebilmeniz için değerler değiştikçe mesajlar yazdıracak bir kod örneği kullanarak gösterebiliriz:
 */

struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }

        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")

/**
    Yes, appending to an array will trigger both willSet and didSet, so that code will print lots of text when run.
    Evet, bir diziye ekleme yapmak hem willSet'i hem de didSet'i tetikleyecektir, dolayısıyla bu kod çalıştırıldığında çok sayıda metin yazdıracaktır.

    In practice, willSet is used much less than didSet, but you might still see it from time to time so it’s important you know it exists. Regardless of which you choose, please try to avoid putting too much work into property observers – if something that looks trivial such as game.score += 1 triggers intensive work, it will catch you out on a regular basis and cause all sorts of performance problems.
    Pratikte willSet, didSet'ten çok daha az kullanılır, ancak yine de zaman zaman görebilirsiniz, bu nedenle var olduğunu bilmeniz önemlidir. Hangisini seçerseniz seçin, lütfen özellik gözlemcilerine çok fazla iş yüklemekten kaçının - game.score += 1 gibi önemsiz görünen bir şey yoğun çalışmayı tetiklerse, sizi düzenli olarak yakalayacak ve her türlü performans sorununa neden olacaktır.
*/
