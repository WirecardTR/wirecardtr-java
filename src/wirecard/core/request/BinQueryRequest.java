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
public class BinQueryRequest {
    @XmlElement(name ="ServiceType")
        public String ServiceType ;
        @XmlElement(name ="OperationType")
        public String OperationType ;
        @XmlElement(name ="Token")
        public Token Token;
        @XmlElement(name ="BIN")
        public String BIN ;
        
        
         public static String execute(BinQueryRequest request, Settings settings) throws Exception {     
             
             
		return RestHttpCaller.getInstance().postXML(settings.baseUrl,request);
	}
}
