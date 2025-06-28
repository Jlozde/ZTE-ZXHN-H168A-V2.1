# ZTE ZXHN H168A V2.1 - Root Hesabını Etkinleştirme

Bu rehber, ZTE ZXHN H168A V2.1 model modemlerde "root" kullanıcı hesabını nasıl etkinleştirebileceğinizi anlatmaktadır.

> **⚠️ Sorumluluk Reddi**
>
> Bu rehber, yalnızca kendi sorumluluğunuzdaki modemlerde root hesabını etkinleştirmek için hazırlanmıştır. Yapılan işlemler hakkında yeterli bilgiye sahip değilseniz, donanımınıza veya kendinize zarar verme riski bulunmaktadır. Sahipliğinin internet servis sağlayıcınıza ait oldığu modemlerde uygulanması yasal olmayabilir. Lütfen ne yaptığınızı bilerek ilerleyin veya bu işlemlerden kaçının.

### Genel Bakış

Bu çalışma için orijinal yöntemi ve script'i paylaşan **@Lemandark**'a teşekkürler. Orijinal çalışmaya buradan ulaşabilirsiniz: [https://github.com/LeMandark/H298A-V9](https://github.com/LeMandark/H298A-V9)

Ancak, LeMandark'ın H298A-V9 için hazırladığı script'teki parametreler, ne yazık ki ZTE'nin H168A V2.1 modelinde doğrudan çalışmamaktadır. Görünüşe göre ZTE, farklı modem versiyonlarında veya servis sağlayıcıya (ISP) özel olarak bu parametrelerin ön ekini değiştirmektedir.

Örneğin, H298A modelinde kullanılan bir parametre H168A V2.1'de farklı bir isme sahip olabiliyor:

  * `InternetGatewayDevice.X_TT.Configuration.Shell.Enable` yerine bu modelde `InternetGatewayDevice.X_TTNET.Configuration.Shell.Enable` kullanılmış.
  * `InternetGatewayDevice.X_TT.Users.User.2.Enable` yerine ise `InternetGatewayDevice.X_TTNET.Users.User.2.Enable` kullanılmış.

Buradaki `X_TT`, `X_ZTE`, `X_TURKTELEKOM` veya `X_TTNET` gibi ön ekler, modemin yazılımına ve dağıtan servis sağlayıcıya göre değişiklik gösterebilir.

### Doğru Parametreleri Nasıl Buluruz?

Neyse ki doğru parametreleri bulmak oldukça basit. Modemle **TR-069** protokolü üzerinden konuşarak cihaz üzerindeki tüm aktif parametrelerin listesini talep edebiliriz.

Aşağıdaki SOAP isteğini kullanarak modemdeki tüm parametre ağacını (`InternetGatewayDevice.`) çekebilirsiniz:

```xml
<SOAP-ENV:Envelope xmlns:SOAP="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:cwmp="urn:dslforum-org:cwmp-1-0" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <SOAP-ENV:Header>
    <cwmp:ID SOAP-ENV:mustUnderstand="1">1234</cwmp:ID>
    <cwmp:HoldRequests>0</cwmp:HoldRequests>
  </SOAP-ENV:Header>
  <SOAP-ENV:Body>
    <cwmp:GetParameterAttributes>
      <ParameterNames SOAP-ENC:arrayType="xsd:string[1]">
        <string>InternetGatewayDevice.</string>
      </ParameterNames>
    </cwmp:GetParameterAttributes>
  </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
```

Bu isteğe modemden gelen cevap, cihazda kullanılan tüm geçerli parametreleri içerecektir. Bu parametre listesini inceleyerek `Shell.Enable` ve `Users.User.2.Enable` gibi root erişimi için gereken doğru parametreleri kolayca bulabilirsiniz.

### Kaynaklar ve Hazır Dosyalar

  * **Tüm Parametrelerin Listesi:** Modemden gelen örnek bir parametre listesine buradan ulaşabilirsiniz.

      * [All-Parameters.txt](https://raw.githubusercontent.com/Jlozde/ZTE-ZXHN-H168A-V2.1/refs/heads/main/All-Parameters.txt)

  * **Boot SEQ:**

      * [putty.log](https://raw.githubusercontent.com/Jlozde/ZTE-ZXHN-H168A-V2.1/refs/heads/main/putty.log)

  * **Düzenlenmiş Config Dosyası:** Uğraşmak istemeyenler için, root hesabı aktifleştirilmiş ve düzenlenmiş örnek `config.bin` dosyası aşağıdadır. Bu dosyayı modeminize yükleyerek root erişimini açabilirsiniz.

      * [config.bin](https://raw.githubusercontent.com/Jlozde/ZTE-ZXHN-H168A-V2.1/refs/heads/main/config.bin)
      * **Root Kullanıcı Bilgileri:**
          * Kullanıcı Adı: `root`
          * Şifre: `Sifre123`
  * Loglardan -> **szCfgSignVal=** ZXHN H168A V2.1
  * Firmwaredan -> **Hardcode=** H168AV2.1_TTN

**GL:HF**
