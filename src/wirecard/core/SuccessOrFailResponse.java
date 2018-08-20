/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package wirecard.core;

import java.security.MessageDigest;
import javax.xml.bind.DatatypeConverter;

/**
 *
 * @author Codevist
 */
public class SuccessOrFailResponse 
{
    public String OrderId;
    public String MPAY;
    public String Statuscode;
    public String ResultCode;
    public String ResultMessage;
    public String LastTransactionDate;
    public String MaskedCCNo;
    public String CCTokenId;
    public String ExtraParam;
    public String HashParam;
      public String result;
    
     public static String computeHash(String hashString) throws Exception {
        MessageDigest sha1 = MessageDigest.getInstance(Constants.Formats.SHA1);
        return DatatypeConverter.printBase64Binary(sha1.digest(hashString.getBytes("ISO-8859-9")));
    }
}
