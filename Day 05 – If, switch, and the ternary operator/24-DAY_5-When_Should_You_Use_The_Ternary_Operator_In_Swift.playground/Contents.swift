import Cocoa

/// # When should you use the ternary operator in Swift?
/// # Swift'te üçlü işleci ne zaman kullanmalısınız?



/// Bazı insanlar çok kısa bir kod sağladığı için üçlü operatöre çok güvenirken, bazıları da kodun okunmasını zorlaştırabileceği için mümkün olduğunca uzak durur.
let isAuthenticated = true

print(isAuthenticated ? "Welcome!" : "Who are you?")

if isAuthenticated {
    print("Welcome")
} else {
    print("Who are you?")
}

/// Ben "mümkün olduğunca kaçın" kampındayım çünkü bu kod daha uzun olsa da takip etmeyi daha kolay buluyorum:

/// Şimdi, üçlü operatörün çok fazla kullanıldığı bir zaman var ve bu SwiftUI ile. Burada kod örnekleri vermek istemiyorum çünkü biraz bunaltıcı olabilir, ancak isterseniz orada üçlü operatörle gerçekten şehre gidebilirsiniz. O zaman bile, kodumun okunmasını kolaylaştırmak için mümkün olduğunda bunları kaldırmayı tercih ediyorum, ancak kendiniz denemeli ve kendi sonuçlarınıza varmalısınız.


