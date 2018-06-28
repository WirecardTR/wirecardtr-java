# wirecardtr-java
Wirecard Ödeme Sistemleri Java Örnek Projesi

## Kullanım
Wirecard servislerini kullanabilmek için [Wirecard'a](https://www.wirecard.com.tr) üye olmalısınız. Üye olduktan sonra Wirecard sizinle token bilgileri için UserCode ve Pin keylerini, sms ile ödeme servislerinde kullanılacak olan TurkcellServiceId değerlerini sizinle paylaşacaktır. Paylaşılan bu anahtarları kendi projenizde ilgili yerlere yazarak saklamanız ve kullanmanız gerekmektedir.

* Örnek projelerimizi daha iyi anlamak için [Wirecard geliştirici merkezini](http://developer.wirecard.com.tr) takip etmeniz büyük önem arz etmektedir. 

## Genel Bilgiler
Wirecard sunduğu SMS, Kredi kartıyla ödeme alma, pazaryeri ve diğer servisler, dünya standartlarına uygun yapıda web ve mobil cihazlar üzerinden ödeme kabul etmek isteyen tüm üye işyerlerine hitap edecek bir şekilde, oturum bilgisi tutmayan(stateless) yapıda ve servis odaklı bir mimaride geliştirilmiştir.

Wirecard servislerine, XML formatında veri göndererek ve servis cevaplarına XML formatında cevap alarak, hızlıca entegre olup, Wirecard panelinden rahatlıkla işlemlerinizi takip edebilirsiniz.

Servislerimiz XML tabanlı olarak iki farklı yapıda çalışmaktadır; 

[SOAP (Simple Object Access Protocol)](https://tr.wikipedia.org/wiki/SOAP) Tabanlı XML Servisleri

[RESTful (Representational State Transfer)](https://tr.wikipedia.org/wiki/REST) Tabanlı XML servisleri 

Temelde birbirinden çok fazla farkı olmayan bu iki yapıda, SOAP yapısının, managed dillerde (.Net, JAVA vs.) servisi direkt referans ekleyerek ve entityleri yazmadan kullanabilmek gibi bir artısı vardır.


## Test ve Canlıya Geçiş Süreçleri, Dikkat Edilmesi Gereken Noktalar
* Wirecard sisteminde yapılan tüm işlemlerin süresi maksimum 5 dakikadır. Bu sürede tamamlanmayan işlemler iptal edilir.

* Tüm test süreçlerinizde, test kartlarımızı ve verilerimizi kullanabilirsiniz. Bu verilerle tüm durumları test edin.

* Üretim ortamında, yanlış sabit data gönderilmediğinden emin olun. Gönderdiğiniz işlemlere ait verileri mutlaka kontrol edin.

* Kurgu seçimi yapıldıktan sonra ilgili kurgu ile ödeme işlemi yapılabilmesi için, seçimin integration@3pay.com adresinden bize bildirilmesi gereklidir. Aksi takdirde işlem sonuçlarında hata ile karşılaşabilirsiniz.
* Wirecard servislerinden dönen tüm hataları karşılayacak ve müşteriye uygun cevabı gösterecek şekilde kodunuzu düzenleyin ve test edin. Hata mesajlarımız genelde kullanıcı dostudur.

* Entegrasyon tamamlanana kadar üye işyeri Wirecard sisteminde test statüsünde tanımlıdır. Bu statüde sadece 0.01 TL’lik işlem yapılabilmektedir. Gerçek ücretler entegrasyon tamamlandıktan ve operatörlerden onay alındıktan sonra devreye alınmaktadır.
Canlı ortama geçiş sonrası pilot işlemleri kendi cep telefonunuz veya kredi kartlarınız ile deneyerek, sonuçlarını size özel panelden görüntüleyin. Sonuçların ve işlemlerin doğru tamamlandığından emin olun.

* Hassas olan (Kredi Kartı datası vb.) veriler dışındaki verileri ve servis istek ve yanıtlarını, hata çözümü ve olası sorunların çözümünde yardımcı olması açısından loglamaya(raporlamaya) dikkat edin.

## API Endpoint (Yayın) Adresleri

Wirecard API adresleri test ve üretim ortamları için aynıdır. Servis tipine göre erişeceğiniz adres ve servis yapısını aşağıda ve her bir servisin detayında bulabilirsiniz.

Servis Adı        	        | Servis Tipi   	      | Adres 	|
------------------	        |----------------       |-----	|
 SMS ile Ödeme Servisleri 	| SOAP 	                | https://www.wirecard.com.tr/services/saleservice.asmx	|
 SMS ile Abonelik Servisleri| SOAP                  | https://www.wirecard.com.tr/services/SubscriberManagementService.asmx
 Bilgi SMS Servisleri       | SOAP                  | https://www.wirecard.com.tr/vas/msendsmsservice.asmx <br>  https://www.wirecard.com.tr/vas/MCustomSendSMSService.asmx
 Kredi Kartı ile Ödeme Servisler |REST              | https://www.wirecard.com.tr/SGate/Gate
 Marketplace (Pazaryeri) ile Ödeme Servisleri | REST | https://www.wirecard.com.tr/SGate/Gate
                                                     


## Test Kartları

Testleriniz sırasında aşağıdaki kart numaralarını ve diğer bilgileri kullanabilirsiniz. 

| Sıra No 	| Kart Numarası    	| SKT   	| CVC 	|
|---------	|------------------	|-------	|-----	|
| 1       	| 4282209004348015 	| 12/22 	| 123 	|



## Destek

Entegrasyon sırasında karşılaştığınız ve çözüm bulamadığınız her konuda bizimle iletişime geçebilir; istek, öneri, talep ve her türlü görüşlerinizi bizimle paylaşabilirsiniz. 
Bizimle iletişime geçmek için **integration@3pay.com** adresine e-posta gönderebilir veya [iletişim Formu](https://developer.wirecard.com.tr/tr/bize-ulasin) yardımıyla bizlere ulaşabilirsiniz.

