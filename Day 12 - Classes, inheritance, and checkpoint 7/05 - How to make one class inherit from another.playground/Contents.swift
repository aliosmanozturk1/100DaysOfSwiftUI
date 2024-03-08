import Cocoa

/// # How to make one class inherit from another
/// # Bir sınıfın başka bir sınıftan miras alması nasıl sağlanır

/**
    Swift lets us create classes by basing them on existing classes, which is a process known as inheritance. When one class inherits functionality from another class (its “parent” or “super” class), Swift will give the new class access (the “child class” or “subclass”) to the properties and methods from that parent class, allowing us to make small additions or changes to customize the way the new class behaves.
    Swift, kalıtım olarak bilinen bir süreç olan mevcut sınıfları temel alarak sınıflar oluşturmamızı sağlar. Bir sınıf başka bir sınıftan ("üst" veya "süper" sınıf) işlevsellik miras aldığında, Swift yeni sınıfa ("alt sınıf" veya "alt sınıf") üst sınıftaki özelliklere ve yöntemlere erişim vererek yeni sınıfın davranış biçimini özelleştirmek için küçük eklemeler veya değişiklikler yapmamıza olanak tanır.

    To make one class inherit from another, write a colon after the child class’s name, then add the parent class’s name. For example, here is an Employee class with one property and an initializer:
    Bir sınıfın diğerinden miras almasını sağlamak için, alt sınıfın adından sonra iki nokta üst üste yazın ve ardından üst sınıfın adını ekleyin. Örneğin, burada bir özelliği ve başlatıcısı olan bir Employee sınıfı bulunmaktadır:
*/

class Employee {
    let hours: Int

    init(hours: Int) {
        self.hours = hours
    }
}

/**
    We could make two subclasses of Employee, each of which will gain the hours property and initializer:
    Employee'nin iki alt sınıfını oluşturabiliriz, bunların her biri hours özelliğini ve başlatıcısını kazanacaktır:
*/

class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
}

class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

/**
    Notice how those two child classes can refer directly to hours – it’s as if they added that property themselves, except we don’t have to keep repeating ourselves.
    Bu iki alt sınıfın doğrudan saatlere nasıl başvurabildiğine dikkat edin - sanki bu özelliği kendileri eklemişler gibi, ancak kendimizi tekrarlamamız gerekmiyor.

    Each of those classes inherit from Employee, but each then adds their own customization. So, if we create an instance of each and call work(), we’ll get a different result:
    Bu sınıfların her biri Employee'den miras alır, ancak her biri daha sonra kendi özelleştirmelerini ekler. Dolayısıyla, her birinin bir örneğini oluşturup work() işlevini çağırırsak farklı bir sonuç elde ederiz:
*/

let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)
robert.work()
joseph.work()

/**
    As well as sharing properties, you can also share methods, which can then be called from the child classes. As an example, try adding this to the Employee class:
    Özellikleri paylaşmanın yanı sıra, daha sonra alt sınıflardan çağrılabilecek yöntemleri de paylaşabilirsiniz. Örnek olarak, bunu Employee sınıfına eklemeyi deneyin:
 
     func printSummary() {
         print("I work \(hours) hours a day.")
     }
*/

class Employee2 {
    let hours: Int

    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

/**
    Because Developer inherits from Employee, we can immediately start calling printSummary() on instances of Developer, like this:
    Developer, Employee'den miras aldığı için, Developer örneklerinde printSummary() işlevini hemen çağırmaya başlayabiliriz:
*/

class Developer2: Employee2 {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
}

let novall = Developer2(hours: 8)
novall.printSummary()

/**
    Things get a little more complicated when you want to change a method you inherited. For example, we just put printSummary() into Employee, but maybe one of those child classes wants slightly different behavior.
    Miras aldığınız bir yöntemi değiştirmek istediğinizde işler biraz daha karmaşık hale gelir. Örneğin, Employee'ye printSummary() metodunu koyduk, ancak belki de alt sınıflardan biri biraz farklı bir davranış istiyordur.

    This is where Swift enforces a simple rule: if a child class wants to change a method from a parent class, you must use override in the child class’s version. This does two things:
    Bu noktada Swift basit bir kuralı uygulamaya koyar: Eğer bir alt sınıf üst sınıftaki bir yöntemi değiştirmek istiyorsa, alt sınıfın sürümünde override kullanmanız gerekir. Bu iki şey yapar:
    - If you attempt to change a method without using override, Swift will refuse to build your code. This stops you accidentally overriding a method.
    - Override kullanmadan bir yöntemi değiştirmeye çalışırsanız, Swift kodunuzu oluşturmayı reddeder. Bu, bir yöntemi yanlışlıkla geçersiz kılmanızı önler.

    - If you use override but your method doesn’t actually override something from the parent class, Swift will refuse to build your code because you probably made a mistake.
    - Override kullanıyorsanız ancak yönteminiz aslında üst sınıftan bir şeyi override etmiyorsa, Swift kodunuzu oluşturmayı reddedecektir çünkü muhtemelen bir hata yapmışsınızdır.

    So, if we wanted developers to have a unique printSummary() method, we’d add this to the Developer class:
    Dolayısıyla, geliştiricilerin benzersiz bir printSummary() yöntemine sahip olmasını istiyorsak, bunu Developer sınıfına ekleriz:
*/

class Developer3: Employee2 {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
    }
}

let novall2 = Developer3(hours: 8)
novall2.printSummary()

/**
    Swift is smart about how method overrides work: if your parent class has a work() method that takes no parameters, but the child class has a work() method that accepts a string to designate where the work is being done, that does not require override because you aren’t replacing the parent method.
    Swift, metot override'larının nasıl çalıştığı konusunda akıllıdır: eğer ana sınıfınızda parametre almayan bir work() metodu varsa, ancak alt sınıfta işin nerede yapıldığını belirtmek için bir string kabul eden bir work() metodu varsa, bu override gerektirmez çünkü ana metodu değiştirmiyorsunuzdur.

    Tip: If you know for sure that your class should not support inheritance, you can mark it as final. This means the class itself can inherit from other things, but can’t be used to inherit from – no child class can use a final class as its parent.
    İpucu: Sınıfınızın kalıtımı desteklememesi gerektiğinden eminseniz, onu final olarak işaretleyebilirsiniz. Bu, sınıfın kendisinin başka şeylerden miras alabileceği, ancak miras almak için kullanılamayacağı anlamına gelir - hiçbir alt sınıf, nihai bir sınıfı ebeveyni olarak kullanamaz.
*/

