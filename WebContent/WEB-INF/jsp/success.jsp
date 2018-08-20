<%@ page import="java.util.Locale" %>
<%@page import="javax.xml.bind.JAXB"%>
<%@page import="java.io.StringWriter"%>
<%@page import="wirecard.core.Helper"%>
<%@page import="wirecard.core.Settings"%>
<%@page import="wirecard.core.SuccessOrFailResponse"%>
<%@page contentType="text/html" pageEncoding="windows-1254"%>
<jsp:include page="layout.jsp" /> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1254">
        <title>Başarılı ödeme Bildirimi</title>
    </head>
    <body>
        
    <%
            
            Settings settings = new Settings();
		settings.userCode="";
                settings.pin="";
		settings.baseUrl = "https://www.wirecard.com.tr/SGate/Gate"; //"Wirecard web servisleri API url'lerinin bilgisidir. 
                settings.hashKey="";
                
                
    	request.setCharacterEncoding("UTF-8");
    	SuccessOrFailResponse successOrFailResponse = new SuccessOrFailResponse();
    	successOrFailResponse.OrderId = request.getParameter("OrderId");
    	successOrFailResponse.MPAY = request.getParameter("MPAY");
        successOrFailResponse.Statuscode = request.getParameter("StatusCode");
        successOrFailResponse.ResultCode = request.getParameter("ResultCode");
        successOrFailResponse.ResultMessage = request.getParameter("ResultMessage");
        successOrFailResponse.LastTransactionDate = request.getParameter("LastTransactionDate");
        successOrFailResponse.MaskedCCNo = request.getParameter("MaskedCCNo");
        successOrFailResponse.CCTokenId = request.getParameter("CCTokenId");
        successOrFailResponse.ExtraParam = request.getParameter("ExtraParam");
        successOrFailResponse.HashParam = request.getParameter("HashParam");
        
       
        String hashString =  successOrFailResponse.Statuscode.toString() +  successOrFailResponse.LastTransactionDate+successOrFailResponse.MPAY + successOrFailResponse.OrderId.toLowerCase() + settings.hashKey;
    	String result = successOrFailResponse.computeHash(hashString); 
         successOrFailResponse.result = result;
                 StringWriter sw = new StringWriter();
                 JAXB.marshal(successOrFailResponse, sw);	
		out.println("  <h1>Sonuç</h1>");
             
           
                
		out.println("<pre>" + Helper.prettyPrintXml(sw.toString()) + "</pre>");
                if( successOrFailResponse.result==successOrFailResponse.HashParam){
                //Gelen Hash değerinin doğru hesaplanmış olması işlem güvenliği açısından önemlidir !
                
                
                }
    
    %>

    </body>
  
</html>
<jsp:include page="footer.jsp" />