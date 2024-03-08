import Cocoa

/// # What’s the difference between a struct and a tuple?

// ANLAMADIM AMA ÇOKTA ÖNEMLİ DEĞİL BENCE 

/**
 Swift’s tuples let us store several different named values inside a single variable, and a struct does much the same – so what’s the difference, and when should you choose one over the other?
 Swift'in tuple'ları tek bir değişken içinde birkaç farklı adlandırılmış değeri saklamamıza izin verir ve bir struct da hemen hemen aynı şeyi yapar - peki fark nedir ve ne zaman birini diğerine tercih etmelisiniz?
 
 When you’re just learning, the difference is simple: a tuple is effectively just a struct without a name, like an anonymous struct. This means you can define it as (name: String, age: Int, city: String) and it will do the same thing as the following struct:
 Yeni öğreniyorsanız, aradaki fark basittir: bir tuple, anonim bir struct gibi, adı olmayan bir struct'tır. Bu, onu (name: String, age: Int, city: String) olarak tanımlayabileceğiniz ve aşağıdaki struct ile aynı şeyi yapacağı anlamına gelir:
*/

struct User {
    var name: String
    var age: Int
    var city: String
}

/**
 However, tuples have a problem: while they are great for one-off use, particularly when you want to return several pieces of data from a single function, they can be annoying to use again and again.
 Ancak tuple'ların bir sorunu vardır: özellikle tek bir işlevden birkaç veri parçası döndürmek istediğinizde tek seferlik kullanım için harika olsalar da, tekrar tekrar kullanmak can sıkıcı olabilir.

 Think about it: if you have several functions that work with user information, would you rather write this:
 Bir düşünün: Kullanıcı bilgileriyle çalışan birkaç fonksiyonunuz varsa, bunu yazmayı tercih eder miydiniz?
 
 func authenticate(_ user: User) { ... }
 func showProfile(for user: User) { ... }
 func signOut(_ user: User) { ... }
 
 Or this:
 
 func authenticate(_ user: (name: String, age: Int, city: String)) { ... }
 func showProfile(for user: (name: String, age: Int, city: String)) { ... }
 func signOut(_ user: (name: String, age: Int, city: String)) { ... }
 
 Think about how hard it would be to add a new property to your User struct (very easy indeed), compared to how hard it would be to add another value to your tuple everywhere it was used? (Very hard, and error-prone!)
 Kullanıcı yapınıza yeni bir özellik eklemenin ne kadar zor olacağını (gerçekten çok kolay), tuple'ınıza kullanıldığı her yerde başka bir değer eklemenin ne kadar zor olacağını düşünün? (Çok zor ve hataya açık!)

 So, use tuples when you want to return two or more arbitrary pieces of values from a function, but prefer structs when you have some fixed data you want to send or receive multiple times.
 Bu nedenle, bir işlevden iki veya daha fazla rastgele değer parçası döndürmek istediğinizde tuple'ları kullanın, ancak birden çok kez göndermek veya almak istediğiniz bazı sabit verileriniz olduğunda struct'ları tercih edin.
*/

