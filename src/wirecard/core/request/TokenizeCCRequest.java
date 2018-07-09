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
import wirecard.core.entity.Token;

@XmlRootElement(name = "WIRECARD")
public class TokenizeCCRequest {
     @XmlElement(name ="ServiceType")
        public String ServiceType ;
        @XmlElement(name ="OperationType")
        public String OperationType ;
        @XmlElement(name ="Token")
        public Token Token ;
        
        @XmlElement(name ="CustomerId")
        public String CustomerId ;
        @XmlElement(name ="CreditCardNumber")
        public String CreditCardNumber ;
        @XmlElement(name ="NameSurname")
        public String NameSurname ;
        @XmlElement(name ="ExpiryDate")
        public String ExpiryDate ;
        @XmlElement(name ="CVV")
        public String CVV ;
        @XmlElement(name ="Port")
        public String Port ;
        
        @XmlElement(name ="ValidityPeriod")
        public int ValidityPeriod ;
 
        
        @XmlElement(name ="IPAddress")
        public String IPAddress ;
        
         public static String execute(TokenizeCCRequest request, Settings settings) throws Exception {         
		return RestHttpCaller.getInstance().postXML(settings.baseUrl,request);
	}
}
