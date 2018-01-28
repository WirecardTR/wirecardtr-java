/*
 *   Pazaryeri  kredi kart� �deme i�lemleri ve CCProxySale(�deme formu) xml verilerinin i�erisinde kullan�lacak olan creditcard�nfo s�n�f�n� temsil eder.
 */
package wirecard.core.entity;

import javax.xml.bind.annotation.XmlElement;

public class CreditCardInfo {
    
        @XmlElement(name = "CreditCardNo")
        public String CreditCardNo ;  
        @XmlElement(name = "OwnerName")
        public String OwnerName ;  
        @XmlElement(name = "ExpireYear")
        public int ExpireYear ;     
        @XmlElement(name = "ExpireMonth")
        public int ExpireMonth ;  
        @XmlElement(name = "Cvv")
        public String Cvv ;   
        @XmlElement(name = "Price")
        public int Price ; 
}