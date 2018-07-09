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
public class SubScriberChangePriceRequest
{
     @XmlElement(name ="ServiceType")
        public String ServiceType ;
        @XmlElement(name ="OperationType")
        public String OperationType ;
        @XmlElement(name ="Token")
        public Token Token ;
        @XmlElement(name ="Price")
        public String Price ;
        @XmlElement(name ="Description")
        public String Description ;
        @XmlElement(name ="SubscriberId")
        public String SubscriberId ;
        @XmlElement(name ="ValidFrom")
        public String ValidFrom ;
        public static String execute(SubScriberChangePriceRequest request, Settings settings) throws Exception {         
		return RestHttpCaller.getInstance().postXML(settings.baseUrl,request);
	}
                
}
