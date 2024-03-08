import Cocoa

/// # Checkpoint 8

/**
    Now that you understand how protocols and extensions work, it’s time to pause our learning and take on a challenge so you can put it all into practice.
    Artık protokollerin ve uzantıların nasıl çalıştığını anladığınıza göre, öğrenmemize ara vermenin ve tüm bunları uygulamaya koyabilmeniz için bir görev üstlenmenin zamanı geldi.

    Your challenge is this: make a protocol that describes a building, adding various properties and methods, then create two structs, House and Office, that conform to it. Your protocol should require the following:
    Göreviniz şu: Bir binayı tanımlayan, çeşitli özellikler ve yöntemler ekleyen bir protokol oluşturun, ardından buna uygun House ve Office adında iki yapı oluşturun. Protokolünüz aşağıdakileri gerektirmelidir:
    - A property storing how many rooms it has.
    - Bir mülkün kaç odası olduğunu saklama

    - A property storing the cost as an integer (e.g. 500,000 for a building costing $500,000.)
    - Maliyeti tam sayı olarak saklayan bir özellik (örneğin 500.000 $ maliyetli bir bina için 500.000).

    - A property storing the name of the estate agent responsible for selling the building.
    - Bir özellik, binanın satışından sorumlu emlak acentesinin adını saklar.

    - A method for printing the sales summary of the building, describing what it is along with its other properties.
    - Binanın diğer özellikleriyle birlikte ne olduğunu açıklayan satış özetini yazdırmak için bir yöntem.
*/

// KENDİ ÇÖZÜMÜM
protocol Building {
    var room: Int { get set }
    var cost: Int { get set }
    var estateAgency: String { get set }
}

extension Building {
    func describeBuild() {
        print("Room count: \(room)")
        print("Cost: $\(cost)")
        print("Estate Agency: \(estateAgency)")
    }
}

struct House : Building {
    var room: Int
    var cost: Int
    var estateAgency: String
    
    var kitchenCount: Int
    var garageCount: Int
}

struct Office : Building {
    var room: Int
    var cost: Int
    var estateAgency: String
    
    var deskCount: Int
    var chairCount: Int
}

var myHouse = House(room: 4, cost: 300000, estateAgency: "ÖZTÜRKLER", kitchenCount: 2, garageCount: 1)
var myOffice = Office(room: 10, cost: 950000, estateAgency: "ZENGİNLER", deskCount: 50, chairCount: 200)

myHouse.describeBuild()
myOffice.describeBuild()



// ÇÖZÜM 1
//Describe a building with a protocol
protocol Building2 {
    var type: String { get }
    var rooms: Int { get set }
    var price: Int { get }
    var agent: String { get }
}

//Add an extension to Building protocol to access function from structs
extension Building2 {
    func salesSummary() {
        print("\(rooms) room \(type) sold for $\(price) by \(agent)")
    }
}

//Create two structs to conform to Building protocol
struct House2: Building2 {
    let type: String
    var rooms: Int
    let price: Int
    let agent: String

}

struct Office2: Building2 {
    let type: String
    var rooms: Int
    let price: Int
    let agent: String

}

//Create copy of House
var house2 = House2(type: "House", rooms: 3, price: 500_000, agent: "Harvey")

//Update rooms
house2.rooms = 4

house2.salesSummary()

//Create copy of Office
var office2 = Office2(type: "Office", rooms: 22, price: 10_000_000, agent: "Suzanne")

//Update rooms
office2.rooms = 24

office2.salesSummary()
