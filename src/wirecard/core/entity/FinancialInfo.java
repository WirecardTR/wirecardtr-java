/*
 *   Pazaryeri olu�turma ve g�ncelleme i�lemi i�in gerekli olan financialinfo bilgilerinin tutuldu�u s�n�f� temsil etmektedir.
 */
package wirecard.core.entity;

import javax.xml.bind.annotation.XmlElement;


public class FinancialInfo {
    
        @XmlElement(name ="IdentityNumber")
        public String IdentityNumber;
        @XmlElement(name ="TaxOffice")
        public String TaxOffice ;
        @XmlElement(name ="TaxNumber")
        public String TaxNumber;
        @XmlElement(name ="BankName")
        public String BankName ;
        @XmlElement(name ="IBAN")
        public String IBAN ;
        @XmlElement(name ="AccountName")
        public String AccountName;
}
