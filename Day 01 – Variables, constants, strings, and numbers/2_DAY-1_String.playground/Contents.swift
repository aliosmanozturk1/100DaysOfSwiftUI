import Cocoa

// String --> Metin dizelerdir.
//            "" veya '' arasına metinler yerleştirilir.
let actor = "Denzel Washington"
let filename = "paris.jpg"
let result = "⭐️ You win! ⭐️"

// String içinde " ' gibi karakterleri kullanmak için kaçış karakteri kullanmalıyız.
// Kaçış karakteri --> \
let quote = "Then he tapped a sign saying \"Believe\" and walked away."

// Uzun String'ler yazmak için """ tırnak kullanırız.
let movie = """
A day in
the life of an
Apple engineer
"""

// String metodları
// count() metodu ile string içinde kaç karakter olduğu sayılır.
print(actor.count)
let nameLength = actor.count
print(nameLength)

// uppercased() metodu ile bir string içindeki her şey büyük harfle yazılır.
print(result.uppercased())
print(result)

// hasPrefix() metodu bir stringin içinde verdiğimiz kelimenin olup olmadığına bakar.
print(movie.hasPrefix("A day"))
print(filename.hasSuffix(".jpg"))
