/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
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

/*
 *  Pazaryeri 3d secure ile ödeme için gerekli olan sýnýfý temsil etmektedir.
 *  Ayrýca execute metodu içerisinde istek sýnýfý ve url bilgisiyle post iþlemi baþlatýlýr.
 *  Post iþlemi sonucunda oluþan response deðeri ekranda kullanýya gösterilir.
 */
@XmlRootElement(name = "WIRECARD")
public class MarketPlaceSale3DSecRequest {
    
        @XmlElement(name ="ServiceType")
        public String ServiceType ;
        @XmlElement(name ="OperationType")
        public String OperationType ;
        @XmlElement(name ="Token")
        public Token Token ;
        @XmlElement(name ="CreditCardInfo")
        public CreditCardInfo CreditCardInfo ;
        @XmlElement(name ="CardTokenization")
        public CardTokenization CardTokenization ;
        @XmlElement(name ="MPAY")
        public String MPAY ;
        @XmlElement(name ="CurrencyCode")
        public String CurrencyCode ;
        @XmlElement(name ="IPAddress")
        public String IPAddress ;
        @XmlElement(name ="Port")
        public String Port ;
        @XmlElement(name ="Description")
        public String Description ;
        @XmlElement(name ="InstallmentCount")
        public int InstallmentCount ;
        @XmlElement(name ="ErrorURL")
        public String ErrorURL ;
        @XmlElement(name ="SuccessURL")
        public String SuccessURL ;
        @XmlElement(name ="CommissionRate")
        public int CommissionRate ;
        @XmlElement(name ="ExtraParam")
        public String ExtraParam ;
        @XmlElement(name ="PaymentContent")
        public String PaymentContent ;

        @XmlElement(name ="SubPartnerId")
        public int SubPartnerId ;
        @XmlElement(name ="CustomerInfo")
        public CustomerInfo CustomerInfo ;
        @XmlElement(name ="Language")
        public String Language ;
        
        public static String execute(MarketPlaceSale3DSecRequest request, Settings settings) throws Exception {         
		return RestHttpCaller.getInstance().postXML(settings.baseUrl,request);
	}
}
