import Cocoa

/// # How to create a deinitializer for a class

/**
    Swift’s classes can optionally be given a deinitializer, which is a bit like the opposite of an initializer in that it gets called when the object is destroyed rather than when it’s created.
    Swift'in sınıflarına isteğe bağlı olarak bir deinitializer verilebilir; bu, nesne oluşturulduğunda değil yok edildiğinde çağrıldığı için initializer'ın tersi gibidir.

    This comes with a few small provisos:
    Bunun birkaç küçük şartı var:
    - Just like initializers, you don’t use func with deinitializers – they are special.
    - Tıpkı initializer'larda olduğu gibi, deinitializer'larda da func kullanmazsınız - bunlar özeldir.
 
    - Deinitializers can never take parameters or return data, and as a result aren’t even written with parentheses.
    - Deinitializer'lar asla parametre alamaz veya veri döndüremez ve sonuç olarak parantezle bile yazılmazlar.

    - Your deinitializer will automatically be called when the final copy of a class instance is destroyed. That might mean it was created inside a function that is now finishing, for example.
    - Bir sınıf örneğinin son kopyası yok edildiğinde deinitializer'ınız otomatik olarak çağrılacaktır. Bu, örneğin artık sonlandırılan bir işlevin içinde oluşturulduğu anlamına gelebilir.

    - We never call deinitializers directly; they are handled automatically by the system.
    - Hiçbir zaman deinitializer'ları doğrudan çağırmayız; bunlar sistem tarafından otomatik olarak işlenir.

    - Structs don’t have deinitializers, because you can’t copy them.
    - Yapıların deinitializer'ları yoktur, çünkü onları kopyalayamazsınız.

    Exactly when your deinitializers are called depends on what you’re doing, but really it comes down to a concept called scope. Scope more or less means “the context where information is available”, and you’ve seen lots of examples already:
    Deinitializer'larınızın tam olarak ne zaman çağrılacağı ne yaptığınıza bağlıdır, ancak aslında kapsam adı verilen bir kavrama bağlıdır. Kapsam aşağı yukarı "bilginin mevcut olduğu bağlam" anlamına gelir ve zaten birçok örnek gördünüz:
    - If you create a variable inside a function, you can’t access it from outside the function.
    - Bir fonksiyonun içinde bir değişken oluşturursanız, ona fonksiyonun dışından erişemezsiniz.

    - If you create a variable inside an if condition, that variable is not available outside the condition.
    - Eğer bir if koşulunun içinde bir değişken oluşturursanız, bu değişken koşulun dışında kullanılamaz.

    - If you create a variable inside a for loop, including the loop variable itself, you can’t use it outside the loop.
    - Döngü değişkeninin kendisi de dahil olmak üzere bir for döngüsü içinde bir değişken oluşturursanız, bunu döngü dışında kullanamazsınız.

    If you look at the big picture, you’ll see each of those use braces to create their scope: conditions, loops, and functions all create local scopes.
    Büyük resme bakarsanız, bunların her birinin kendi kapsamlarını oluşturmak için parantez kullandığını görürsünüz: koşullar, döngüler ve fonksiyonların tümü yerel kapsamlar oluşturur.

    When a value exits scope we mean the context it was created in is going away. In the case of structs that means the data is being destroyed, but in the case of classes it means only one copy of the underlying data is going away – there might still be other copies elsewhere. But when the final copy goes away – when the last constant or variable pointing at a class instance is destroyed – then the underlying data is also destroyed, and the memory it was using is returned back to the system.
    Bir değer kapsamdan çıktığında, içinde oluşturulduğu bağlamın ortadan kalktığı anlamına gelir. Yapılar söz konusu olduğunda bu, verilerin yok edildiği anlamına gelir, ancak sınıflar söz konusu olduğunda bu, altta yatan verilerin yalnızca bir kopyasının yok edildiği anlamına gelir - başka yerlerde hala başka kopyalar olabilir. Ancak son kopya yok olduğunda - bir sınıf örneğine işaret eden son sabit veya değişken yok edildiğinde - temel veri de yok edilir ve kullandığı bellek sisteme geri döndürülür.

    To demonstrate this, we could create a class that prints a message when it’s created and destroyed, using an initializer and deinitializer:
    Bunu göstermek için, bir initializer ve deinitializer kullanarak oluşturulduğunda ve yok edildiğinde bir mesaj yazdıran bir sınıf oluşturabiliriz:
*/

class User {
    let id: Int

    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }

    deinit {
        print("User \(id): I'm dead!")
    }
}

/**
    Now we can create and destroy instances of that quickly using a loop – if we create a User instance inside the loop, it will be destroyed when the loop iteration finishes:
    Artık bir döngü kullanarak bunun örneklerini hızlı bir şekilde oluşturabilir ve yok edebiliriz - döngü içinde bir User örneği oluşturursak, döngü yinelemesi bittiğinde yok edilecektir:
*/

for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control!")
}

/**
    When that code runs you’ll see it creates and destroys each user individually, with one being destroyed fully before another is even created.
    Bu kod çalıştığında, her bir kullanıcıyı ayrı ayrı oluşturduğunu ve yok ettiğini göreceksiniz, biri daha oluşturulmadan diğeri tamamen yok edilecektir.

    Remember, the deinitializer is only called when the last remaining reference to a class instance is destroyed. This might be a variable or constant you have stashed away, or perhaps you stored something in an array.
    Unutmayın, deinitializer yalnızca bir sınıf örneğine kalan son referans yok edildiğinde çağrılır. Bu, sakladığınız bir değişken veya sabit olabilir ya da bir dizide bir şey saklamış olabilirsiniz.

    For example, if we were adding our User instances as they were created, they would only be destroyed when the array is cleared:
    Örneğin, Kullanıcı örneklerimizi oluşturuldukça ekliyor olsaydık, bunlar yalnızca dizi temizlendiğinde yok edilirdi:
*/

var users = [User]()

for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control!")
    users.append(user)
}

print("Loop is finished!")
users.removeAll()
print("Array is clear!")
