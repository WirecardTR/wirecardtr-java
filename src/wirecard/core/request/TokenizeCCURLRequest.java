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

/**
 *
 * @author Codevist
 */
@XmlRootElement(name = "WIRECARD")
public class TokenizeCCURLRequest {
     @XmlElement(name ="ServiceType")
        public String ServiceType ;
        @XmlElement(name ="OperationType")
        public String OperationType ;
        @XmlElement(name ="Token")
        public Token Token ;
        
        @XmlElement(name ="CustomerId")
        public String CustomerId ;
        
        @XmlElement(name ="ValidityPeriod")
        public int ValidityPeriod ;
        
        @XmlElement(name ="ErrorURL")
        public String ErrorURL ;
        @XmlElement(name ="SuccessURL")
        public String SuccessURL ;
        @XmlElement(name ="IPAddress")
        public String IPAddress ;
        
         public static String execute(TokenizeCCURLRequest request, Settings settings) throws Exception {         
		return RestHttpCaller.getInstance().postXML(settings.baseUrl,request);
	}
}
