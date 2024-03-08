import Cocoa

/// # How to work with variables inside classes

// TAM ANLAMADIM YA

/**
    Swift’s classes work a bit like signposts: every copy of a class instance we have is actually a signpost pointing to the same underlying piece of data. Mostly this matters because of the way changing one copy changes all the others, but it also matters because of how classes treat variable properties.
    Swift'in sınıfları biraz işaret levhaları gibi çalışır: sahip olduğumuz bir sınıf örneğinin her kopyası aslında aynı temel veri parçasına işaret eden bir işaret levhasıdır. Bu çoğunlukla bir kopyayı değiştirmenin diğerlerini de değiştirmesi nedeniyle önemlidir, ancak aynı zamanda sınıfların değişken özellikleri nasıl ele aldığı nedeniyle de önemlidir.

    This one small code sample demonstrates how things work:
    Bu küçük kod örneği işlerin nasıl yürüdüğünü göstermektedir:
*/

class User {
    var name = "Paul"
}

let user = User()
user.name = "Taylor"
print(user.name)

/**
    That creates a constant User instance, but then changes it – it changes the constant value. That’s bad, right?
    Bu, sabit bir Kullanıcı örneği oluşturur, ancak daha sonra onu değiştirir - sabit değeri değiştirir. Bu kötü, değil mi?

    Except it doesn’t change the constant value at all. Yes, the data inside the class has changed, but the class instance itself – the object we created – has not changed, and in fact can’t be changed because we made it constant.
    Ancak sabit değeri hiç değiştirmez. Evet, sınıfın içindeki veriler değişti, ancak sınıf örneğinin kendisi - yarattığımız nesne - değişmedi ve aslında değiştirilemez çünkü onu sabit yaptık.

    Think of it like this: we created a constant signpoint pointing towards a user, but we erased that user’s name tag and wrote in a different name. The user in question hasn’t changed – the person still exists – but a part of their internal data has changed.
    Şöyle düşünün: Bir kullanıcıyı işaret eden sabit bir işaret noktası oluşturduk, ancak bu kullanıcının isim etiketini sildik ve farklı bir isim yazdık. Söz konusu kullanıcı değişmedi - kişi hala var - ancak dahili verilerinin bir kısmı değişti.

    Now, if we had made the name property a constant using let, then it could not be changed – we have a constant signpost pointing to a user, but we’ve written their name in permanent ink so that it can’t be erased.
    Şimdi, let kullanarak name özelliğini sabit yapsaydık, o zaman değiştirilemezdi - bir kullanıcıyı işaret eden sabit bir tabelamız var, ancak adını silinemeyecek şekilde kalıcı mürekkeple yazdık.

    In contrast, what happens if we made both the user instance and the name property variables? Now we’d be able to change the property, but we’d also be able to change to a wholly new User instance if we wanted. To continue the signpost analogy, it would be like turning the signpost to point at wholly different person.
    Buna karşılık, hem kullanıcı örneğini hem de name özelliğini değişken yaparsak ne olur? Şimdi özelliği değiştirebiliriz, ancak istersek tamamen yeni bir Kullanıcı örneğine de geçebiliriz. Tabela benzetmesine devam edecek olursak, bu, tabelayı tamamen farklı bir kişiyi gösterecek şekilde çevirmek gibi olacaktır.

    Try it with this code:
    Bu kod ile deneyin:
 */

class User2 {
    var name2 = "Paul"
}

var user2 = User2()
user2.name2 = "Taylor"
user2 = User2()
print(user2.name2)

/**
    That would end up printing “Paul”, because even though we changed name to “Taylor” we then overwrote the whole user object with a new one, resetting it back to “Paul”.
    Bunun sonucunda "Paul" yazdırılacaktır, çünkü adı "Taylor" olarak değiştirmiş olsak da, tüm kullanıcı nesnesinin üzerine yeni bir tane yazarak onu "Paul" olarak sıfırladık.

    The final variation is having a variable instance and constant properties, which would mean we can create a new User if we want, but once it’s done we can’t change its properties.
    Son varyasyon, değişken bir örneğe ve sabit özelliklere sahip olmaktır; bu, istersek yeni bir Kullanıcı oluşturabileceğimiz, ancak bir kez yapıldığında özelliklerini değiştiremeyeceğimiz anlamına gelir.

    So, we end up with four options:
    Yani, elimizde dört seçenek var:
    - Constant instance, constant property – a signpost that always points to the same user, who always has the same name.
    - Sabit örnek, sabit özellik - her zaman aynı kullanıcıya işaret eden, her zaman aynı isme sahip bir tabela.

    - Constant instance, variable property – a signpost that always points to the same user, but their name can change.
    - Sabit örnek, değişken özellik - her zaman aynı kullanıcıyı işaret eden bir tabela, ancak adı değişebilir.

    - Variable instance, constant property – a signpost that can point to different users, but their names never change.
    - Değişken örnek, sabit özellik - farklı kullanıcıları işaret edebilen bir tabela, ancak isimleri asla değişmez.

    - Variable instance, variable property – a signpost that can point to different users, and those users can also change their names.
    - Değişken örnek, değişken özellik - farklı kullanıcılara işaret edebilen bir tabela ve bu kullanıcılar da isimlerini değiştirebilir.

    This might seem awfully confusing, and perhaps even pedantic. However, it serves an important purpose because of the way class instances get shared.
    Bu son derece kafa karıştırıcı ve hatta belki de bilgiçlik taslıyor gibi görünebilir. Ancak, sınıf örneklerinin paylaşılma şekli nedeniyle önemli bir amaca hizmet eder.

    Let’s say you’ve been given a User instance. Your instance is constant, but the property inside was declared as a variable. This tells you not only that you can change that property if you want to, but more importantly tells you there’s the possibility of the property being changed elsewhere – that class you have could be a copy from somewhere else, and because the property is variable it means some other part of code could change it by surprise.
    Diyelim ki size bir User örneği verildi. Örneğiniz sabittir, ancak içindeki özellik değişken olarak bildirilmiştir. Bu size sadece isterseniz bu özelliği değiştirebileceğinizi değil, daha da önemlisi özelliğin başka bir yerde değiştirilme olasılığı olduğunu söyler - sahip olduğunuz sınıf başka bir yerden kopyalanmış olabilir ve özellik değişken olduğu için kodun başka bir kısmı bunu sürpriz bir şekilde değiştirebilir.

    When you see constant properties it means you can be sure neither your current code nor any other part of your program can change it, but as soon as you’re dealing with variable properties – regardless of whether the class instance itself is constant or not – it opens up the possibility that the data could change under your feet.
    Sabit özellikler gördüğünüzde, ne mevcut kodunuzun ne de programınızın başka bir bölümünün bunu değiştiremeyeceğinden emin olabileceğiniz anlamına gelir, ancak değişken özelliklerle uğraştığınız anda - sınıf örneğinin kendisinin sabit olup olmadığına bakılmaksızın - verilerin ayaklarınızın altında değişebileceği olasılığını ortaya çıkarır.

    This is different from structs, because constant structs cannot have their properties changed even if the properties were made variable. Hopefully you can now see why this happens: structs don’t have the whole signpost thing going on, they hold their data directly. This means if you try to change a value inside the struct you’re also implicitly changing the struct itself, which isn’t possible because it’s constant.
    Bu struct'lardan farklıdır, çünkü sabit struct'ların özellikleri değişken yapılsa bile özellikleri değiştirilemez. Umarım şimdi bunun neden olduğunu anlayabilirsiniz: struct'larda işaret levhası gibi bir şey yoktur, verilerini doğrudan tutarlar. Bu, struct içindeki bir değeri değiştirmeye çalıştığınızda dolaylı olarak struct'ın kendisini de değiştirmiş olacağınız anlamına gelir ki bu da sabit olduğu için mümkün değildir.

    One upside to all this is that classes don’t need to use the mutating keyword with methods that change their data. This keyword is really important for structs because constant structs cannot have their properties changed no matter how they were created, so when Swift sees us calling a mutating method on a constant struct instance it knows that shouldn’t be allowed.
    Tüm bunların bir iyi yanı, sınıfların verilerini değiştiren yöntemlerde mutating anahtar sözcüğünü kullanmalarına gerek kalmamasıdır. Bu anahtar sözcük struct'lar için gerçekten önemlidir, çünkü sabit struct'lar nasıl oluşturulmuş olurlarsa olsunlar özellikleri değiştirilemez, bu nedenle Swift bir sabit struct örneği üzerinde mutating metodu çağırdığımızı gördüğünde buna izin verilmemesi gerektiğini bilir.

    With classes, how the instance itself was created no longer matters – the only thing that determines whether a property can be modified or not is whether the property itself was created as a constant. Swift can see that for itself just by looking at how you made the property, so there’s no more need to mark the method specially.
    Sınıflarda, örneğin kendisinin nasıl oluşturulduğu artık önemli değildir - bir özelliğin değiştirilip değiştirilemeyeceğini belirleyen tek şey, özelliğin kendisinin bir sabit olarak oluşturulup oluşturulmadığıdır. Swift, özelliği nasıl oluşturduğunuza bakarak bunu kendisi görebilir, bu nedenle yöntemi özel olarak işaretlemeye artık gerek yoktur.
*/

// AŞAĞIDAKİ KISMI KENDİM YAZIYOM ANLAMAK İÇİN
print("***************************************")

class Kullanici1 {
    var isim1 = "Ali"
}

let kullanici1 = Kullanici1()
kullanici1.isim1 = "Beyza"
//kullanici1 = Kullanici1() // Bu satır çalışmaz çünkü kullanici1 let olarak tanımlandı. kullanici1'e başka bişey atanamaz.
print(kullanici1.isim1)



class Kullanici2 {
    var isim2 = "Ali"
}

var kullanici2 = Kullanici2()
kullanici2.isim2 = "Beyza"
kullanici2 = Kullanici2() // İlk olarak "Ali" olarak atanıyor, ardından "Beyza" olarak güncelleniyor. Ancak, daha sonra tekrar kullanici2'ye yeni bir Kullanici2 örneği atanıyor. Bu durumda, kullanici2 önceki referansını kaybediyor ve yeni bir nesne referansı alıyor. Yani, kullanici2'nin isim2 özelliği "Ali" olarak yeniden atanıyor, çünkü yeni oluşturulan Kullanici2 nesnesinin varsayılan değeri olan "Ali" kullanılıyor. Bu yüzden print ifadesi "Ali"yi yazdırıyor.
print(kullanici2.isim2)
