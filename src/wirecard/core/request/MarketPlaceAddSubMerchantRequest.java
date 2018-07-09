
package wirecard.core.request;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import wirecard.core.RestHttpCaller;
import wirecard.core.Settings;
import wirecard.core.entity.ContactInfo;
import wirecard.core.entity.FinancialInfo;
import wirecard.core.entity.Token;

/*
 *  Pazaryeri oluþturma için gerekli olan sýnýfý temsil etmektedir.
 *  Ayrýca execute metodu içerisinde istek sýnýfý ve url bilgisiyle post iþlemi baþlatýlýr.
 *  Post iþlemi sonucunda oluþan response deðeri ekranda kullanýya gösterilir.
 */
@XmlRootElement(name = "WIRECARD")
public class MarketPlaceAddSubMerchantRequest {
    
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
        @XmlElement(name ="BranchName")
        public String BranchName ;
        @XmlElement(name ="ContactInfo")
        public ContactInfo ContactInfo;
        @XmlElement(name ="FinancialInfo")
        public FinancialInfo FinancialInfo ;
        
         public static String execute(MarketPlaceAddSubMerchantRequest request, Settings settings) throws Exception {         
		return RestHttpCaller.getInstance().postXML(settings.baseUrl,request);
	}
}
