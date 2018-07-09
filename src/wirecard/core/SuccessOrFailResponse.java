/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package wirecard.core;

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
}
