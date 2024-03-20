import Cocoa

/// # How to skip loop items with break and continue
/// # Break ve continue ile döngü öğeleri nasıl atlanır

/// Swift bize bir döngüdeki bir veya daha fazla öğeyi atlamak için iki yol sunar: continue mevcut döngü yinelemesini atlar ve break kalan tüm yinelemeleri atlar.



/// Şimdi continue ile başlayarak bunlara ayrı ayrı bakalım. Bir veri dizisi üzerinde döngü oluştururken, Swift diziden bir öğe alır ve bunu kullanarak döngü gövdesini yürütür. Bu döngü gövdesi içinde continue komutunu çağırırsanız, Swift geçerli döngü yinelemesini yürütmeyi hemen durdurur ve döngüdeki bir sonraki öğeye atlayarak normal şekilde devam eder. Bu genellikle, seçtiğiniz bir testi geçemeyen döngü değişkenlerini ortadan kaldırdığınız döngülerin başlangıcına yakın yerlerde kullanılır.

let filenames = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]

for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue
    }

    print("Found picture: \(filename)")
}



/// break ise bir döngüden hemen çıkar ve kalan tüm yinelemeleri atlar.
let number1 = 4
let number2 = 14
var multiples = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)

        if multiples.count == 10 {
            break
        }
    }
}

print(multiples)



/// Bu nedenle, mevcut döngü yinelemesinin geri kalanını atlamak istediğinizde continue kullanın ve kalan tüm döngü yinelemelerini atlamak istediğinizde break kullanın.


