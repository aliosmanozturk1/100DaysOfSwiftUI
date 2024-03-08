import Cocoa

/// # When would you use self in a method?
/// # Swift'in üyeli başlatıcıları nasıl çalışır?

/**
 Inside a method, Swift lets us refer to the current instance of a struct using self, but broadly speaking you don’t want to unless you specifically need to distinguish what you mean.
 Swift, bir metodun içinde self kullanarak bir struct'ın mevcut örneğine atıfta bulunmamıza izin verir, ancak genel olarak konuşursak, ne demek istediğinizi özellikle ayırt etmeniz gerekmedikçe bunu yapmak istemezsiniz.

 By far the most common reason for using self is inside an initializer, where you’re likely to want parameter names that match the property names of your type, like this:
 self'i kullanmanın en yaygın nedeni, parametre adlarının türünüzün özellik adlarıyla eşleşmesini isteyeceğiniz bir başlatıcının içinde kullanmaktır:
*/

struct Student {
    var name: String
    var bestFriend: String

    init(name: String, bestFriend: String) {
        print("Enrolling \(name) in class…")
        self.name = name
        self.bestFriend = bestFriend
    }
}

/**
    You don’t have to use that, of course, but it gets a little clumsy adding some sort of prefix to the parameter names:
    Elbette bunu kullanmak zorunda değilsiniz, ancak parametre adlarına bir tür önek eklemek biraz beceriksizce olur:
*/

struct Student2 {
    var name: String
    var bestFriend: String

    init(name studentName: String, bestFriend studentBestFriend: String) {
        print("Enrolling \(studentName) in class…")
        name = studentName
        bestFriend = studentBestFriend
    }
}

/**
    Outside of initializers, the main reason for using self is because we’re in a closure and Swift requires it so we’re clear we understand what’s happening. This is only needed when accessing self from inside a closure that belongs to a class, and Swift will refuse to build your code unless you add it.
    Başlatıcıların dışında, self kullanmanın ana nedeni bir closure içinde olmamız ve Swift'in ne olduğunu anladığımızdan emin olmak için bunu gerektirmesidir. Bu yalnızca bir sınıfa ait bir closure içinden self'e erişirken gereklidir ve Swift bunu eklemediğiniz sürece kodunuzu oluşturmayı reddedecektir.
*/
