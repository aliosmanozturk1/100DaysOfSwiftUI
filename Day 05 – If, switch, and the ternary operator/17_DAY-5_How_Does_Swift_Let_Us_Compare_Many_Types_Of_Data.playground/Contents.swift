import Cocoa

/// # How does Swift let us compare many types of data?
/// # Swift birçok veri türünü karşılaştırmamıza nasıl izin veriyor?



/// Swift, birçok türde değeri kutudan çıkar çıkmaz karşılaştırmamıza izin verir, bu da eşitlik ve karşılaştırma için çeşitli değerleri kontrol edebileceğimiz anlamına gelir.

let firstName = "Paul"
let secondName = "Sophie"

let firstAge = 40
let secondAge = 10

print(firstName == secondName)
print(firstName != secondName)
print(firstName < secondName)
print(firstName >= secondName)

print(firstAge == secondAge)
print(firstAge != secondAge)
print(firstAge < secondAge)
print(firstAge >= secondAge)

/// Swift, perde arkasında bunu oldukça akıllıca bir şekilde uygular ve aslında çok çeşitli şeyleri karşılaştırmasına olanak tanır. Örneğin, Swift'in tarihleri saklamak için Date adında özel bir türü vardır ve aynı operatörleri kullanarak tarihleri karşılaştırabilirsiniz: someDate < someOtherDate, örneğin.
/// We can even ask Swift to make our enums comparable, like this:
/// Swift'ten enum'larımızı karşılaştırılabilir hale getirmesini bile isteyebiliriz, bunun gibi:

enum Sizes: Comparable {
    case small
    case medium
    case large
}

let first = Sizes.small
let second = Sizes.large
print(first < second)

// Bu "true" yazdıracaktır, çünkü enum durum listesinde small, large'dan önce gelir.




