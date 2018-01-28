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
import wirecard.core.entity.ContactInfo;
import wirecard.core.entity.FinancialInfo;
import wirecard.core.entity.Token;

/*
 *  Pazaryeri g�ncelleme i�in gerekli olan s�n�f� temsil etmektedir.
 *  Ayr�ca execute metodu i�erisinde istek s�n�f� ve url bilgisiyle post i�lemi ba�lat�l�r.
 *  Post i�lemi sonucunda olu�an response de�eri ekranda kullan�ya g�sterilir.
 */
@XmlRootElement(name = "WIRECARD")
public class MarketPlaceUpdateSubMerchantRequest {
        @XmlElement(name ="ServiceType")
        public String ServiceType ;
        @XmlElement(name ="OperationType")
        public String OperationType ;
        @XmlElement(name ="Token")
        public Token Token;
        @XmlElement(name ="UniqueId")
        public String UniqueId ;
        @XmlElement(name ="SubPartnerType")
        public String SubPartnerType;
        @XmlElement(name ="Name")
        public String Name ;
        @XmlElement(name ="ContactInfo")
        public ContactInfo ContactInfo;
        @XmlElement(name ="FinancialInfo")
        public FinancialInfo FinancialInfo ;
        
        @XmlElement(name ="SubPartnerId")
        public int SubPartnerId ;
        
         public static String execute(MarketPlaceUpdateSubMerchantRequest request, Settings settings) throws Exception {         
		return RestHttpCaller.getInstance().postXML(settings.baseUrl,request);
	}
}
