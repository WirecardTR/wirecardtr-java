/*
 *  Ortak �deme formu i�erisinde kullan�lacak olan alanlar bu s�n�f i�erisinde kullan�l�r.
 *  Ayr�ca execute metodu i�erisinde istek s�n�f� ve url bilgisiyle post i�lemi ba�lat�l�r.
 */
package wirecard.core.request;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import wirecard.core.RestHttpCaller;
import wirecard.core.Settings;
import wirecard.core.entity.CardTokenization;
import wirecard.core.entity.CreditCardInfo;
import wirecard.core.entity.Token;

@XmlRootElement(name = "WIRECARD")
public class CCProxySale3DRequest {
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
        @XmlElement(name ="Port")
        public String Port ;
        @XmlElement(name ="IPAddress")
        public String IPAddress ;
        @XmlElement(name ="ErrorURL")
        public String ErrorURL ;
        @XmlElement(name ="SuccessURL")
        public String SuccessURL ;
        @XmlElement(name ="PaymentContent")
        public String PaymentContent ;
        @XmlElement(name ="InstallmentCount")
        public int InstallmentCount ;
        @XmlElement(name ="Description")
        public String Description ;
        @XmlElement(name ="ExtraParam")
        public String ExtraParam ;
        
        public static String execute(CCProxySale3DRequest request, Settings settings) throws Exception {         
		return RestHttpCaller.getInstance().postXML(settings.baseUrl,request);
	}
}
