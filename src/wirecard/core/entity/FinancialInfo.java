/*
 *   Pazaryeri oluþturma ve güncelleme iþlemi için gerekli olan financialinfo bilgilerinin tutulduðu sýnýfý temsil etmektedir.
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
        @XmlElement(name ="TradeRegisterNumber")
        public String TradeRegisterNumber ;
        @XmlElement(name ="TradeChamber")
        public String TradeChamber ;
}
