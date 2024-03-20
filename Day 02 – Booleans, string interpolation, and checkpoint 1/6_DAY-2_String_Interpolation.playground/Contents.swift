import Cocoa

/// #String Interpolation

/**:
 Swift bize stringleri birleştirmek için iki yol sunar:
 + kullanarak onları birleştirmek ve string interpolation
 adı verilen ve herhangi bir türdeki değişkenleri doğrudan
 stringlerin içine yerleştirebilen özel bir teknik.
 */

// String'leri + ile birleştirmek
let firstPart = "Hello, "
let secondPart = "world!"
let greeting = firstPart + secondPart

let people = "Haters"
let action = "hate"
let lyric = people + " gonna " + action
print(lyric)

/**:
 İki dizeyi birleştirmek için + kullandığımıza, ancak Int ve Double kullandığımızda
 sayıları birbirine eklediğine dikkat ettiniz mi? Buna operatör aşırı yüklemesi denir
 + gibi bir operatörün nasıl kullanıldığına bağlı olarak farklı anlamlara gelebilmesi.
 Dizeler için, bir dizeyi doğrudan diğerine ekleyen += için de geçerlidir.
 */

let luggageCode = "1" + "2" + "3" + "4" + "5"

/**:
 Swift tüm bu dizeleri tek seferde birleştiremez. Bunun yerine, ilk ikisini birleştirerek "12" yapar,
 sonra "12" ve "3 "ü birleştirerek "123" yapar, sonra "123" ve "4 "ü birleştirerek "1234" yapar ve
 son olarak "1234" ve "5 "i birleştirerek "12345" yapar - kod bittiğinde nihai olarak kullanılmasalar
 bile "12", "123" ve "1234 "ü tutmak için geçici dizeler oluşturur.
 
 Swift, string interpolation adı verilen daha iyi bir çözüme sahiptir ve diğer stringlerden, aynı zamanda 
 tamsayılardan, ondalık sayılardan ve daha fazlasından verimli bir şekilde string oluşturmamızı sağlar .
 */

/**:
 String enterpolasyonu ile çok benzer bir şey kullanılır: String'inizin içine bir ters eğik çizgi yazarsınız,
 ardından bir değişkenin veya sabitin adını parantez içine yerleştirirsiniz.
 */

let name = "Taylor"
let age1 = 26
let message1 = "Hello, my name is \(name) and I'm \(age1) years old."
print(message1)

print("5 x 5 is \(5 * 5)")

var city = "Cardiff"
var message2 = "Welcome to \(city)!"

let age2 = 38
print("You are \(age2)")


