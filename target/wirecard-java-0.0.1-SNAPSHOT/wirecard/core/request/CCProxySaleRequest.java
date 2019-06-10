/*
 *  Ortak ödeme formu içerisinde kullanýlacak olan alanlar bu sýnýf içerisinde kullanýlýr.
 *  Ayrýca execute metodu içerisinde istek sýnýfý ve url bilgisiyle post iþlemi baþlatýlýr.
 */
package wirecard.core.request;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import wirecard.core.RestHttpCaller;
import wirecard.core.Settings;
import wirecard.core.entity.CardTokenization;
import wirecard.core.entity.CreditCardInfo;
import wirecard.core.entity.CustomerInfo;
import wirecard.core.entity.Token;

@XmlRootElement(name = "WIRECARD")
public class CCProxySaleRequest {
        @XmlElement(name ="ServiceType")
        public String ServiceType ;
        @XmlElement(name ="OperationType")
        public String OperationType ;
        @XmlElement(name ="Token")
        public Token Token;
        @XmlElement(name ="CreditCardInfo")
        public CreditCardInfo CreditCardInfo;
        @XmlElement(name ="CardTokenization")
        
        public CardTokenization CardTokenization ;
        @XmlElement(name ="MPAY") 
        public String MPAY ;
        @XmlElement(name ="CurrencyCode")
        public String CurrencyCode ;
        @XmlElement(name ="Port")
        public String Port ;
        @XmlElement(name ="IPAddress")
        public String IPAddress ;
        @XmlElement(name ="PaymentContent")
        public String PaymentContent ;
        @XmlElement(name ="InstallmentCount")
        public int InstallmentCount ;
        @XmlElement(name ="Description")
        public String Description ;
        @XmlElement(name ="ExtraParam")
        public String ExtraParam ;
        @XmlElement(name ="CustomerInfo")
        public CustomerInfo CustomerInfo ;
        @XmlElement(name ="Language")
        public String Language ;
        public static String execute(CCProxySaleRequest request, Settings settings) throws Exception {         
		return RestHttpCaller.getInstance().postXML(settings.baseUrl,request);
	}
}
