/*
 *   t�m xml �a�r�lar�nda gerekli olan Token s�n�f�n� temsil etmektedir.
 */
package wirecard.core.entity;

import javax.xml.bind.annotation.XmlElement;

public class Token {
    
            @XmlElement(name ="UserCode")
            public String UserCode ;
            @XmlElement(name ="Pin")
            public String Pin ;
}