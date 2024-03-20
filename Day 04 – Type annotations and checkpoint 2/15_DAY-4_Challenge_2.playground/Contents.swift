import Cocoa

let brands = ["Apple", "Asus", "HP", "MSI", "Lenovo", "Asus", "Dell", "MSI"]
let arrayCount = brands.count
print("Brands dizisi \(arrayCount) adet elemana sahiptir.")

let setBrands = Set(brands)
let setCount = setBrands.count
print("Brands kümesi \(setCount) adet elemana sahiptir.")

