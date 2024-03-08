import Cocoa

/// # Checkpoint 7

/**
    Your challenge is this: make a class hierarchy for animals, starting with Animal at the top, then Dog and Cat as subclasses, then Corgi and Poodle as subclasses of Dog, and Persian and Lion as subclasses of Cat.
    Göreviniz şu: Hayvanlar için bir sınıf hiyerarşisi oluşturun, en üstte Hayvan ile başlayın, sonra alt sınıflar olarak Köpek ve Kedi, sonra Köpek'in alt sınıfları olarak Corgi ve Kaniş ve Kedi'nin alt sınıfları olarak Fars ve Aslan.

    But there’s more:
    Ama dahası da var:
    - The Animal class should have a legs integer property that tracks how many legs the animal has.
    - Animal sınıfı, hayvanın kaç bacağı olduğunu izleyen bir legs integer özelliğine sahip olmalıdır.

    - The Dog class should have a speak() method that prints a generic dog barking string, but each of the subclasses should print something slightly different.
    - Dog sınıfı, genel bir köpek havlaması dizesi yazdıran bir speak() yöntemine sahip olmalıdır, ancak alt sınıfların her biri biraz farklı bir şey yazdırmalıdır.

    - The Cat class should have a matching speak() method, again with each subclass printing something different.
    - Cat sınıfının eşleşen bir speak() yöntemi olmalıdır ve yine her alt sınıf farklı bir şey yazdırmalıdır.

    - The Cat class should have an isTame Boolean property, provided using an initializer.
    - Cat sınıfı, bir başlatıcı kullanılarak sağlanan isTame Boolean özelliğine sahip olmalıdır.
*/

/**
    Still here? Okay, here are some hints:
    - You’ll need seven independent classes here, of which only one has no parent class.
    - Burada yedi bağımsız sınıfa ihtiyacınız olacak, bunlardan yalnızca birinin ana sınıfı yok.

    - To make one class inherit from another, write it like this: class SomeClass: OtherClass
    - Bir sınıfın diğerinden miras almasını sağlamak için şu şekilde yazın: class SomeClass: OtherClass.

    - You can make subclasses have a different speak() method to their parent by using the override keyword.
    - Override anahtar sözcüğünü kullanarak alt sınıfların üst sınıflardan farklı bir speak() yöntemine sahip olmasını sağlayabilirsiniz.

    - All our subclasses have four legs, but you still need to make sure you pass that data up to the Animal class inside the Cat initializer.
    - Tüm alt sınıflarımızın dört ayağı vardır, ancak yine de bu verileri Cat başlatıcısının içindeki Animal sınıfına aktardığınızdan emin olmanız gerekir.
*/

/**
 Başına kodları do { } bloğunun arasına koydum, böylelikle farklı çözümleri yazarken aynı değişken ismi kullanınca sorun olmuyor.
 */

// ÇÖZÜM 1
print("----- ÇÖZÜM 1 -----")
do {
    
    class Animal {
        let legs: Int  // typically attached to feet
        init (legs : Int) { self.legs = max(legs, 0)  } // cannot be negative
    }
    
    class Dog: Animal {
        init() { super.init( legs: 4 ) }       // dogs are quadrupeds.
        public func speak() { print("bark") }  // standard implementation
    }
    
    class Cat: Animal {
        let isTame: Bool
        init ( isTame isTameFromInit: Bool) {
            isTame = isTameFromInit
            super.init(legs: 4) // cats are quadrupeds.
        }
        public func speak() { print("meow?") }
    }
    
    class Corgi:  Dog { override func speak() { print ("YAP YAP YAP!")     }}
    class Poodle: Dog { override func speak() { print ("WOOF!")            }}
    
    class Persian: Cat {
        init() { super.init(isTame: true)}
        override func speak() { print("Yowwwww Yowwwwww") }}
    class Lion:    Cat {
        init() { super.init(isTame: false)}
        override func speak() { print("Roooooooar")       }}
    
    // ====================================
    // Test cases to try in Playground
    let larry = Corgi()    // create an instance of the Corgi class
    let moe   = Poodle()
    let curly = Persian()
    let shemp = Lion()
    
    print ("Larry is a dog with \(larry.legs) legs. Larry says ")
    larry.speak() ; print("\n")
    print ("Moe is a dog with \(moe.legs) legs. Moe says ")
    moe.speak() ; print("\n")
    print ("Curly is a " + (curly.isTame ? "tame " : "wild ") + "cat with \(curly.legs) legs. Curly says ")
    curly.speak() ; print ("\n")
    print ("Shemp is a " + (shemp.isTame ? "tame " : "wild ") + "cat with \(shemp.legs) legs. Shemp says")
    shemp.speak() ; print("\n")
}



// ÇÖZÜM 2
print("\n----- ÇÖZÜM 2 -----")

do {
    class Animal { let legs = 4 }

    class Dog: Animal {
        var voice: String

        init(voice: String = "Woof") { self.voice = voice }

        func speak() { print("\(voice)!") }
    }

    class Cat: Animal {
        var voice: String
        var isTame: Bool

        init(voice: String = "Meow", isTame: Bool) {
            self.voice = voice
            self.isTame = isTame
        }

        func speak() { print("\(voice)!") }
    }

    class Persian: Cat {
        init() { super.init(voice: "Yowl", isTame: true) }
    }
    class Lion: Cat {
        init() { super.init(voice: "Roar", isTame: false) }
    }
    class Corgi: Dog {
        init() { super.init(voice: "Ruff") }
    }
    class Poodle: Dog {
        init() { super.init(voice: "Yip yip") }
    }
}



// ÇÖZÜM 3
print("\n----- ÇÖZÜM 3 -----")
do {
    class Animal {
        var legs : Int
        init(legs:Int){
            self.legs = legs
        }
    }
    class Dog:Animal {
        func speak() {
            print("The dog is barking")
        }
    }
    class Corgi : Dog {
        override func speak() {
            print("Corgi barks")
        }
    }
    class Poodle: Dog {
        override func speak() {
            print("Poodle barks")
        }
    }
    class Cat:Animal {
        let isTame : Bool
        func speak(){
            print("Cat says meow")
        }
        init(legs: Int,isTame: Bool) {
            self.isTame = isTame
            super.init(legs: legs)
        }
    }
    class Persian: Cat {
        override func speak() {
            print("Persian says meow")
        }
    }
    class Lion:Cat {
        override func speak() {
            print("Lion says meow")
        }
    }
}
