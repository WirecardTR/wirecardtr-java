/*
 *   tüm xml çaðrýlarýnda gerekli olan Token sýnýfýný temsil etmektedir.
 */
package wirecard.core.entity;

import javax.xml.bind.annotation.XmlElement;

public class Token {
    
            @XmlElement(name ="UserCode")
            public String UserCode ;
            @XmlElement(name ="Pin")
            public String Pin ;
}