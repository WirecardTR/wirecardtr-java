/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package wirecard.core.entity;

import javax.xml.bind.annotation.XmlElement;

/**
 *
 * @author Codevist
 */
public class CustomerInfo {
    @XmlElement(name ="CustomerName")
        public String CustomerName ;
        @XmlElement(name ="CustomerSurname")
        public String CustomerSurname ;
        @XmlElement(name ="CustomerEmail")
        public String CustomerEmail ;
}
