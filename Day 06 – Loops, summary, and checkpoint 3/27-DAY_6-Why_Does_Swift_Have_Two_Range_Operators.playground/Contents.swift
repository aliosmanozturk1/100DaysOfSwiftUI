import Cocoa

/// # Why does Swift have two range operators?
/// # Swift'in neden iki range operatörü var?



// ..< is the half-open range that specifies “up to but excluding”
// ..< "hariç olmak üzere en fazla" ifadesini belirten yarı açık aralıktır.

// ... is the closed range operator that specifies “up to and including”.
// ... "kadar ve dahil" ifadesini belirten kapalı aralık operatörüdür.

let names = ["Piper", "Alex", "Suzanne", "Gloria"]

print(names[0])

print(names[0...3])

print(names[1...3])

print(names[1..<3])

print(names[0...])

print(names[1...])

/// Bu nedenle, aralıklar belirli değerler arasında saymak için harikadır, ancak aynı zamanda dizilerden öğe gruplarını okumak için de yararlıdır.


