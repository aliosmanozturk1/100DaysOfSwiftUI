import Cocoa

/// # Summary: Structs

/**
    Structs sit at the core of every SwiftUI app, so it’s really important you take some extra time to make sure you understand what they do and how they work.
    Struct'lar her SwiftUI uygulamasının merkezinde yer alır, bu nedenle ne yaptıklarını ve nasıl çalıştıklarını anladığınızdan emin olmak için biraz daha zaman ayırmanız gerçekten önemlidir.

    To check your knowledge, here’s a small task for you: create a struct to store information about a car, including its model, number of seats, and current gear, then add a method to change gears up or down. Have a think about variables and access control: what data should be a variable rather than a constant, and what data should be exposed publicly? Should the gear-changing method validate its input somehow?
    Bilginizi kontrol etmek için işte size küçük bir görev: modeli, koltuk sayısı ve mevcut vitesi dahil olmak üzere bir araba hakkında bilgi depolamak için bir yapı oluşturun, ardından vitesleri yukarı veya aşağı değiştirmek için bir yöntem ekleyin. Değişkenler ve erişim kontrolü hakkında düşünün: hangi veriler sabit yerine değişken olmalı ve hangi veriler herkese açık olmalı? Vites değiştirme yöntemi girdisini bir şekilde doğrulamalı mı?
*/

// ÇÖZÜM 1 //
struct Car1 {
    let model: String     // constant! probably won't change
    let seatCount: Int    // same!
    private(set) var currentGear = 1  // Bu, değişkenin değerini yalnızca belirli bir kapsam içinde ayarlayabileceğiniz, ancak diğer herhangi bir yerden okuyabileceğiniz anlamına gelir.

    enum GearDirection {
        case up, down, neutral
    }

    public mutating func changeGear(_ direction: GearDirection) {
        switch direction {
        case .down : currentGear -= 1
            if currentGear < 1 {currentGear = 1}
        case .up :   currentGear += 1
            if currentGear > 10 { currentGear = 10 }
        case .neutral:
            currentGear = 1  // arbitrary selection
        }
        print("The \(model) is in gear: \(currentGear)")
    }
}

// Test Code
var prefect = Car1(model: "Ford Prefect", seatCount: 4, currentGear: 3)
prefect.changeGear(.up)
prefect.changeGear(.neutral) // Jump right to Gear 1.
prefect.changeGear(.down)  // try this line a couple of times. try to get below zero.



// ÇÖZÜM 2 //
struct Car2 {
    let model: String // Once a car is made, the model doesn't change
    let numberOfSeats: Int // Same with the number of seats
    private(set) var currentGear = 1 // New instance will start in 1st gear

    mutating func shiftUp() {
        if currentGear + 1 > 10 { // check if shifting will exceed the top gear
            print("You are already in the top gear!")
        } else {
            currentGear += 1
        }
    }

    mutating func shiftDown() {
        if currentGear - 1 < 1 { // check if shifting will exceed the bottom gear
            print("You are alredy in the lowest gear!")
        } else {
            currentGear -= 1
        }
    }
}



// ÇÖZÜM 3 //
enum Gear: Int, CaseIterable {
    case reverse = 0
    case parking = 1
    case first = 2
    case second = 3
    case third = 4
    case fourth = 5
    case fivth = 6
    case sixth = 7
}

struct Car3 {
    let model: String
    let seats: Int
    private(set) var currentGear: Gear = Gear.parking

    func toString() -> String {
        "This model \"\(model)\" has \(seats) seats and is currently in \(currentGear) gear!"
    }

    mutating func gearUp() {
        if currentGear.rawValue < Gear.sixth.rawValue {
            currentGear = next()
        }
    }

    mutating func gearDown() {
        if currentGear.rawValue > Gear.reverse.rawValue {
            currentGear = previous()
        }
    }

    private func previous() -> Gear {
        let all = Gear.allCases
        let idx = all.firstIndex(of: currentGear)!
        let previous = all.index(before: idx)
        return Gear(rawValue: previous) ?? currentGear
    }

    private func next() -> Gear {
        let all = Gear.allCases
        let idx = all.firstIndex(of: currentGear)!
        let next = all.index(after: idx)
        return Gear(rawValue: next) ?? currentGear
    }
}

var bmw = Car3(model: "BMW 318i", seats: 4)
print(bmw.toString())
bmw.gearUp()
bmw.gearUp()
bmw.gearDown()
print(bmw.toString())



// ÇÖZÜM 4
struct Car4 {
    let model: String
    let numberOfSeats: Int
    private(set) var currentGear: Int = 10 {
        willSet {
            print("Gear \(currentGear) is now changing to \(newValue)")
        }
    }

    enum GearDirection {
        case up, down
    }

    mutating func changeGears(withDirection gearDirection: GearDirection) {
        if (1...10).contains(currentGear) {
            if gearDirection == .up && currentGear + 1 <= 10 {
                currentGear += 1
            } else if gearDirection == .up {
                print("You cannot go above the highest gear!")
            }

            if gearDirection == .down && currentGear - 1 >= 1 {
                currentGear -= 1
            } else if gearDirection == .down {
                print("You cannot go below the lowest gear!")
            }
        } else {
            print("That is not a valid gear!")
        }
    }
}

var car = Car4(model: "Mazda CX-30", numberOfSeats: 5, currentGear: 2)
car.changeGears(withDirection: .up)
car.currentGear
