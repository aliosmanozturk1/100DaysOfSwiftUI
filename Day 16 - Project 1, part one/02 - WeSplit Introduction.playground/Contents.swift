import Cocoa

/// # Introduction
/// # Giriş

/**
    In this project we’re going to be building a check-splitting app that you might use after eating at a restaurant – you enter the cost of your food, select how much of a tip you want to leave, and how many people you’re with, and it will tell you how much each person needs to pay.
    Bu projede, bir restoranda yemek yedikten sonra kullanabileceğiniz bir hesap bölme uygulaması geliştireceğiz - yemeğinizin maliyetini giriyorsunuz, ne kadar bahşiş bırakmak istediğinizi ve kaç kişiyle birlikte olduğunuzu seçiyorsunuz ve size her bir kişinin ne kadar ödemesi gerektiğini söylüyor.

    This project isn’t trying to build anything complicated, because its real purpose is to teach you the basics of SwiftUI in a useful way while also giving you a real-world project you can expand on further if you want.
    Bu proje karmaşık bir şey inşa etmeye çalışmıyor, çünkü asıl amacı size SwiftUI'nin temellerini yararlı bir şekilde öğretmek ve aynı zamanda isterseniz daha da genişletebileceğiniz gerçek bir dünya projesi vermektir.


    You’ll learn the basics of UI design, how to let users enter values and select from options, and how to track program state. As this is the first project, we’ll be going nice and slow and explaining everything along the way – subsequent projects will slowly increase the speed, but for now we’re taking it easy.
    Kullanıcı arayüzü tasarımının temellerini, kullanıcıların değer girmesini ve seçenekler arasından seçim yapmasını nasıl sağlayacağınızı ve program durumunu nasıl takip edeceğinizi öğreneceksiniz. Bu ilk proje olduğu için, yavaş yavaş ilerleyeceğiz ve yol boyunca her şeyi açıklayacağız - sonraki projeler yavaş yavaş hızı artıracak, ancak şimdilik yavaştan alıyoruz.


    This project – like all the projects that involve building a complete app – is broken down into three stages:
    Bu proje - eksiksiz bir uygulama oluşturmayı içeren tüm projeler gibi - üç aşamaya ayrılmıştır:
    - A hands-on introduction to all the techniques you’ll be learning.
    - Öğreneceğiniz tüm tekniklere uygulamalı bir giriş.

    - A step-by-step guide to build the project.
    - Projeyi oluşturmak için adım adım bir kılavuz.

    - Challenges for you to complete on your own, to take the project further.
    - Projeyi daha ileriye taşımak için kendi başınıza tamamlayabileceğiniz zorluklar.


    Each of those are important, so don’t try to rush past any of them.
    Bunların her biri önemlidir, bu nedenle hiçbirini aceleyle geçmeye çalışmayın.

    In the first step I’ll be teaching you each of the individual new components in isolation, so you can understand how they work individually. There will be lots of code, but also some explanation so you can see how everything works just by itself. This step is an overview: here are the things we’re going to be using, here is how they work, and here is how you use them.
    İlk adımda size yeni bileşenlerin her birini ayrı ayrı öğreteceğim, böylece tek tek nasıl çalıştıklarını anlayabilirsiniz. Çok sayıda kod olacak, ancak her şeyin kendi başına nasıl çalıştığını görebilmeniz için bazı açıklamalar da olacak. Bu adım genel bir bakış: işte kullanacağımız şeyler, işte nasıl çalıştıkları ve işte onları nasıl kullanacağınız.

    In the second step we’ll be taking those concepts and applying them in a real project. This is where you’ll see how things work in practice, but you’ll also get more context – here’s why we want to use them, and here’s how they fit together with other components.
    İkinci adımda bu kavramları alıp gerçek bir projede uygulayacağız. Burada işlerin pratikte nasıl yürüdüğünü görecek, aynı zamanda daha fazla bağlam elde edeceksiniz - işte bunları neden kullanmak istediğimiz ve işte diğer bileşenlerle nasıl bir araya geldikleri.

    In the final step we’ll be summarizing what you learned, and then you’ll be given a short test to make sure you’ve really understood what was covered. You’ll also be given three challenges: three wholly new tasks that you need to complete yourself, to be sure you’re able to apply the skills you’ve learned. We don’t provide solutions for these challenges (so please don’t write an email asking for them!), because they are there to test you rather than following along with a solution.
    Son adımda öğrendiklerinizi özetleyeceğiz ve ardından anlatılanları gerçekten anladığınızdan emin olmak için size kısa bir test vereceğiz. Ayrıca size üç görev verilecek: öğrendiğiniz becerileri uygulayabildiğinizden emin olmak için kendi başınıza tamamlamanız gereken tamamen yeni üç görev. Bu görevler için çözüm sunmuyoruz (bu nedenle lütfen bunları soran bir e-posta yazmayın!), çünkü bunlar bir çözümle birlikte takip etmekten ziyade sizi test etmek için var.

    Anyway, enough chat: it’s time to begin the first project. We’re going to look at the techniques required to build our check-sharing app, then use those in a real project.
    Her neyse, bu kadar sohbet yeter: ilk projeye başlama zamanı. Çek paylaşımı uygulamamızı oluşturmak için gereken tekniklere bakacağız ve ardından bunları gerçek bir projede kullanacağız.

    So, launch Xcode now, and choose Create A New Xcode Project. You’ll be shown a list of options, and I’d like you to choose iOS and App, then press Next. On the subsequent screen you need to do the following:
    Şimdi Xcode'u başlatın ve Yeni Bir Xcode Projesi Oluştur'u seçin. Size bir seçenekler listesi gösterilecek ve ben sizden iOS ve App'i seçmenizi ve ardından Next'e basmanızı istiyorum. Sonraki ekranda aşağıdakileri yapmanız gerekir:

    - For Product Name please enter “WeSplit”.
    - Ürün Adı için lütfen "WeSplit" girin.

    - For Organization Identifier you can enter whatever you want, but if you have a website you should enter it with the components reversed: “hackingwithswift.com” would be “com.hackingwithswift”. If you don’t have a domain, make one up – “me.yourlastname.yourfirstname” is perfectly fine.
    - Organizasyon Tanımlayıcısı için istediğinizi girebilirsiniz, ancak bir web siteniz varsa bileşenleri ters çevrilmiş olarak girmelisiniz: "hackingwithswift.com", "com.hackingwithswift" olacaktır. Eğer bir alan adınız yoksa, bir tane oluşturun - "me.yourlastname.yourfirstname" gayet uygundur.

    - For Interface please select SwiftUI.
    - For Language please make sure you have Swift selected.
    - For Storage please select None.
    - Make sure all the checkboxes at the bottom are not checked.

    In case you were curious about the organization identifier, you should look at the text just below: “Bundle Identifier”. Apple needs to make sure all apps can be identified uniquely, and so it combines the organization identifier – your website domain name in reverse – with the name of the project. So, Apple might have the organization identifier of “com.apple”, so Apple’s Keynote app might have the bundle identifier “com.apple.keynote”.
    Kuruluş tanımlayıcısını merak ettiyseniz, hemen altındaki metne bakmalısınız: "Bundle Identifier". Apple, tüm uygulamaların benzersiz bir şekilde tanımlanabildiğinden emin olmak ister ve bu nedenle kuruluş tanımlayıcısını (web sitenizin alan adını tersine çevirerek) projenin adıyla birleştirir. Dolayısıyla, Apple'ın kuruluş tanımlayıcısı "com.apple" olabilir, bu nedenle Apple'ın Keynote uygulaması "com.apple.keynote" paket tanımlayıcısına sahip olabilir.

    When you’re ready, click Next, then choose somewhere to save your project and click Create. Xcode will think for a second or two, then create your project and open some code ready for you to edit.
    Hazır olduğunuzda İleri'ye tıklayın, ardından projenizi kaydetmek için bir yer seçin ve Oluştur'a tıklayın. Xcode bir iki saniye düşünecek, ardından projenizi oluşturacak ve düzenlemeniz için bazı kodlar açacaktır.

    Later on we’re going to be using this project to build our check-splitting app, but for now we’re going to use it as a sandbox where we can try out some code.
    Daha sonra bu projeyi çek bölme uygulamamızı oluşturmak için kullanacağız, ancak şimdilik bunu bazı kodları deneyebileceğimiz bir sanal alan olarak kullanacağız.

    Okay, let’s get to it!
*/

