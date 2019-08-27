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
import wirecard.core.entity.CommissionRateList;
import wirecard.core.entity.CreditCardInfo;
import wirecard.core.entity.CustomerInfo;
import wirecard.core.entity.Token;


@XmlRootElement(name = "WIRECARD")
public class MarketPlaceWDTicketMpSale3dSecureRequest {
        @XmlElement(name ="ServiceType")
        public String ServiceType ;
        @XmlElement(name ="OperationType")
        public String OperationType ;
        @XmlElement(name ="Token")
        public Token Token ;
        @XmlElement(name ="Price")
        public int Price ;

        @XmlElement(name ="MPAY")
        public String MPAY ;
        @XmlElement(name ="CurrencyCode")
        public String CurrencyCode ;
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
        @XmlElement(name ="CustomerInfo")
        public CustomerInfo CustomerInfo ;
        @XmlElement(name ="Language")
        public String Language ;
        @XmlElement(name ="SubPartnerId")
        public int SubPartnerId ;
        @XmlElement(name ="InstallmentOptions")
        public int InstallmentOptions ;
        @XmlElement(name ="CommissionRateList")
        public CommissionRateList CommissionRateList ;
        public static String execute(MarketPlaceWDTicketMpSale3dSecureRequest request, Settings settings) throws Exception {         
		return RestHttpCaller.getInstance().postXML(settings.baseUrl,request);
	}
}
