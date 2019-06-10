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
import wirecard.core.entity.CustomerInfo;
import wirecard.core.entity.Token;

/*
 *  Ortak ödeme sayfasý 3d secure ve 3d secure olmadan ödeme için gerekli olan sýnýfý temsil etmektedir.
 *  Ayrýca execute metodu içerisinde istek sýnýfý ve url bilgisiyle post iþlemi baþlatýlýr.
 *  Post iþlemi sonucunda oluþan response deðeri ekranda kullanýya gösterilir.
 */
@XmlRootElement(name = "WIRECARD")
public class WDTicketPaymentFormRequest {
        @XmlElement(name ="ServiceType")
        public String ServiceType ;
        @XmlElement(name ="OperationType")
        public String OperationType ;
        @XmlElement(name ="Token")
        public Token Token ;
        @XmlElement(name ="Price")
        public int Price;
        @XmlElement(name ="MPAY")
        public String MPAY;
        @XmlElement(name ="CurrencyCode")
        public String CurrencyCode ;
        @XmlElement(name ="Description")
        public String Description;
        @XmlElement(name ="ErrorURL")
        public String ErrorURL;
        @XmlElement(name ="SuccessURL")
        public String SuccessURL;
        @XmlElement(name ="ExtraParam")
        public String ExtraParam;
        @XmlElement(name ="PaymentContent")
        public String PaymentContent;
        @XmlElement(name ="PaymentTypeId")
        public int PaymentTypeId;
        @XmlElement(name ="CustomerInfo")
        public CustomerInfo CustomerInfo ;
        @XmlElement(name ="Language")
        public String Language ;
        
         public static String execute(WDTicketPaymentFormRequest request, Settings settings) throws Exception {         
		return RestHttpCaller.getInstance().postXML(settings.baseUrl,request);
	}
        
}
