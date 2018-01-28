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
import wirecard.core.entity.CreditCardInfo;
import wirecard.core.entity.Token;

/*
 *  Pazaryeri 3d secure ile �deme i�in gerekli olan s�n�f� temsil etmektedir.
 *  Ayr�ca execute metodu i�erisinde istek s�n�f� ve url bilgisiyle post i�lemi ba�lat�l�r.
 *  Post i�lemi sonucunda olu�an response de�eri ekranda kullan�ya g�sterilir.
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
        @XmlElement(name ="MPAY")
        public String MPAY ;
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
        
        
        public static String execute(MarketPlaceSale3DSecRequest request, Settings settings) throws Exception {         
		return RestHttpCaller.getInstance().postXML(settings.baseUrl,request);
	}
}
