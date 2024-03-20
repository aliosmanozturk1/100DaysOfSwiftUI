import Cocoa

// Double --> Ondalıklı sayı tutan veri tipidir.
let number1 = 0.1
let number2 = 0.2
print(number1)
print(number2)

// Swift verdiğiniz sayıya göre bir Double mı yoksa bir Int mi oluşturmak istediğinize karar verir.
// Orada bir nokta varsa, bir Double elde edersiniz, aksi takdirde bu bir Int olur.
// Evet, noktadan sonraki sayılar 0 olsa bile.
let double1 = 3.1
let double2 = 3131.3131
let double3 = 3.0
let int1 = 3

// Bir Int ile bir Double toplanamaz.
// Veri tiplerini birbirine dönüştürmek gerekir.
let a = 1 // Int
let b = 2.0 // Double
let c = Double(a) + b
let d = a + Int(b)

// Bir veri tipi başlangıçta neyse o öyle devam eder.
// Yani bir değişken oluşturduğumuzda başlangıçta Int bir değer verirsek
// sonrasında bu değişkene String, Double veya başka bir veri tipi veremeyiz.
var num1 = 5
// num1 = 5.2
// Bu kod çalışmayacaktır.

// num1 = "Ali"
// Bu kod çalışmayacaktır.

// Double veri tipide aritmetik operatörler ve bileşik atama operatörlerüne sahiptir.
var sum = number1 + number2

var rating = 5.0
rating *= 2
