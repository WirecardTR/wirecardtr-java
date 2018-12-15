/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package wirecard.core.entity;

/**
 *
 * @author Codevist
 */

import javax.xml.bind.annotation.XmlElement;
public class AuthSignatoryInfo {
    
     @XmlElement(name ="Name")
        public String Name;
        @XmlElement(name ="Surname")
        public String Surname ;
        @XmlElement(name ="BirthDate")
        public String BirthDate;
}
