
package wirecard.core.entity;

/*
 *   pazaryeri  olu�turma ve pazaryeri g�ncelleme i�in kullan�lacak olan contactInfo s�n�f�n� temsil eder.
*/
import javax.xml.bind.annotation.XmlElement;

    public class ContactInfo {
        @XmlElement(name = "Country")
        public String Country ;    
        @XmlElement(name = "City")
        public String City ;
        @XmlElement(name = "Address")
        public String Address;
        @XmlElement(name = "BusinessPhone")
        public String BusinessPhone ;
        @XmlElement(name = "MobilePhone")
        public String MobilePhone;
     
}
