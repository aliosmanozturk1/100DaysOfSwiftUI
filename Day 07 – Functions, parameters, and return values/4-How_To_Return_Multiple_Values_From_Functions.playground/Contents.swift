import Cocoa

/// # How to return multiple values from functions
/// # Fonksiyonlardan birden çok değer döndürme



/// Bir fonksiyondan iki veya daha fazla değer döndürmek istiyorsanız, bir dizi kullanabilirsiniz. Örneğin, burada bir kullanıcının bilgilerini geri gönderen bir fonksiyon var:
func getUser() -> [String] {
    ["Taylor", "Swift"]
}

let user = getUser()
print("Name: \(user[0]) \(user[1])")
/// Bu sorunludur, çünkü user[0] ve user[1]'in ne olduğunu hatırlamak zordur ve bu dizideki verileri değiştirirsek, user[0] ve user[1] başka bir şey olabilir veya belki de hiç mevcut olmayabilir.



/// Bunun yerine bir sözlük kullanabiliriz, ancak bunun da kendine has sorunları vardır:
func getUser2() -> [String: String] {
    [
        "firstName": "Taylor",
        "lastName": "Swift"
    ]
}
let user2 = getUser2()
print("Name: \(user2["firstName", default: "Anonymous"]) \(user2["lastName", default: "Anonymous"])")
/// Evet, artık kullanıcı verilerimizin çeşitli bölümlerine anlamlı isimler verdik, ancak print() çağrısına bakın - hem firstName hem de lastName'in var olacağını bilmemize rağmen, yine de işler beklediğimiz gibi gitmezse diye varsayılan değerler sağlamamız gerekiyor.



/// Bu çözümlerin her ikisi de oldukça kötüdür, ancak Swift'in tuple şeklinde bir çözümü vardır. Diziler, sözlükler ve kümeler gibi, tuple'lar da birden fazla veri parçasını tek bir değişkene koymamıza izin verir, ancak diğer seçeneklerden farklı olarak tuple'ların sabit bir boyutu vardır ve çeşitli veri türlerine sahip olabilirler.
/// Fonksiyonumuz bir tuple döndürdüğünde şu şekilde görünür:
func getUser3() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let user3 = getUser3()
print("Name: \(user3.firstName) \(user3.lastName)")

/**
 Dönüş tipimiz artık (firstName: String, lastName: String), yani iki string içeren bir tuple.
 Tuple'ımızdaki her string'in bir adı vardır. Bunlar tırnak içinde değildir: sözlüklerde sahip olduğumuz rastgele anahtar türlerinin aksine, tuplelarımızdaki her öğe için özel adlardır.
 Fonksiyonun içinde, söz verdiğimiz tüm öğeleri içeren bir tuple'ı isimlere eklenmiş olarak geri gönderiyoruz: firstName "Taylor" olarak ayarlanıyor, vb.
 getUser() işlevini çağırdığımızda, anahtar adlarını kullanarak tuple'ın değerlerini okuyabiliriz: firstName, lastName, vb
 
 Tuple'ların sözlüklere çok benzediğini biliyorum, ancak farklılar:

 Bir sözlükteki değerlere eriştiğinizde, Swift bunların mevcut olup olmadığını önceden bilemez. Evet, user["firstName"]'in orada olacağını biliyorduk, ancak Swift emin olamaz ve bu yüzden varsayılan bir değer sağlamamız gerekir.
 Bir tuple'daki değerlere eriştiğinizde, Swift bu değerin mevcut olduğunu önceden bilir çünkü tuple bu değerin mevcut olacağını söyler.
 Değerlere user.firstName kullanarak erişiyoruz: bu bir string değil, bu yüzden yazım hatası şansı da yok.
 Sözlüğümüz "firstName "in yanı sıra yüzlerce başka değer içerebilir, ancak tuple'ımız bunu yapamaz - içereceği tüm değerleri listelemeliyiz ve sonuç olarak hepsini içermesi ve başka hiçbir şey içermemesi garanti edilir.
 
 Dolayısıyla, tuple'ların sözlüklere göre önemli bir avantajı vardır: hangi değerlerin var olacağını ve hangi türlere sahip olduklarını tam olarak belirtiriz, oysa sözlükler istediğimiz değerleri içerebilir veya içermeyebilir.
 */


/// Tuple'ları kullanırken bilmeniz gereken üç önemli şey daha vardır.
/// İlk olarak, bir fonksiyondan bir tuple döndürüyorsanız, Swift tuple'daki her bir öğeye verdiğiniz isimleri zaten biliyordur, bu nedenle return'ü kullanırken bunları tekrarlamanıza gerek yoktur. Yani, bu kod önceki tuple'ımızla aynı şeyi yapar:
func getUser4() -> (firstName: String, lastName: String) {
    ("Taylor", "Swift")
}

/// İkinci olarak, bazen size elemanlarının isimleri olmayan tuple'lar verildiğini görürsünüz. Bu durumda, tuple'ın elemanlarına 0'dan başlayan sayısal indisleri kullanarak erişebilirsiniz:
func getUser5() -> (String, String) {
    ("Taylor", "Swift")
}
let user5 = getUser5()
print("Name: \(user5.0) \(user5.1)")
/// Bu sayısal indeksler, adlandırılmış öğelere sahip tuple'larla da kullanılabilir, ancak ben her zaman adları kullanmayı tercih ettim.



/// Son olarak, bir fonksiyon bir tuple döndürüyorsa, isterseniz tuple'ı ayrı ayrı değerlere ayırabilirsiniz.
func getUser6() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let user6 = getUser6()
let firstName = user6.firstName
let lastName = user6.lastName

print("Name: \(firstName) \(lastName)")

/// Bununla birlikte, tuple'ı user'a atamak ve ardından değerleri tek tek kopyalamak yerine, ilk adımı atlayabiliriz - getUser() işlevinden dönen değeri aşağıdaki gibi iki ayrı sabite ayırabiliriz:

let (firstName2, lastName2) = getUser6()
print("Name: \(firstName2) \(lastName2)")

/// Bu sözdizimi ilk başta başınızı ağrıtabilir, ancak aslında daha önce sahip olduğumuz şeyin kısaltmasıdır: getUser() işlevinden geri aldığımız iki öğeden oluşan tuple'ı iki ayrı sabite dönüştürmek.

/// Aslında, tuple'daki tüm değerlere ihtiyacınız yoksa, Swift'e tuple'ın o kısmını yok saymasını söylemek için _ kullanarak bir adım daha ileri gidebilirsiniz:
let (firstName3, _) = getUser6()
print("Name: \(firstName3)")

